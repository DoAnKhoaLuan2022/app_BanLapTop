package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.Moshi;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class CreateAddress extends AppCompatActivity {

    EditText edit_tinh, edit_huyen, edit_xa, edit_sonha;
    User userLogin;
    ImageView iconBack;
    Button btnCreate;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_create_address);
        userLogin = (User) getIntent().getSerializableExtra("us");
        init();
        btnCreate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String tinh = edit_tinh.getText().toString().trim();
                String huyen = edit_huyen.getText().toString().trim();
                String xa = edit_xa.getText().toString().trim();
                String sonha = edit_sonha.getText().toString().trim();
                if(tinh.length()!=0 &&huyen.length()!=0 &&xa.length()!=0 &&sonha.length()!=0)
                {
                    String address = sonha + ", " +xa + ", " +huyen + ", " +tinh;
                    docAPI(address);
                    Toast.makeText(CreateAddress.this,"Thêm địa chỉ thành công!",Toast.LENGTH_LONG).show();
                    finish();
                    Intent intent = new Intent(getApplicationContext(),Address.class);
                    intent.putExtra("us",userLogin);
                    startActivity(intent);
                }
                else {
                    Toast.makeText(CreateAddress.this,"Vui lòng nhập đầy đủ thông tin",Toast.LENGTH_LONG).show();
                }
            }
        });
        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent= new Intent(getApplicationContext(), Address.class);
                intent.putExtra("us", userLogin);
                startActivity(intent);
            }
        });

    }
    public  void init(){
        edit_tinh = this.findViewById(R.id.edit_tinh);
        edit_huyen = this.findViewById(R.id.edit_huyen);
        edit_xa = this.findViewById(R.id.edit_xa);
        edit_sonha = this.findViewById(R.id.edit_sonha);
        iconBack = this.findViewById(R.id.iconBack);
        btnCreate = this.findViewById(R.id.btnCreateAddress);
    }
    public void docAPI(String ad)
    {
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        String body="{"
                +"\"cusID\":"+"\""+String.valueOf(userLogin.cusID)+"\","
                +"\"Name_Address\":"+"\""+ad+"\"}";
        //Create 1 user
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/CustomerAddresses").post(RequestBody.create(MediaType.parse("application/json; charset=utf-8"),body))
                .build();
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent= new Intent(getApplicationContext(), Address.class);
        intent.putExtra("us", userLogin);
        startActivity(intent);
    }
}