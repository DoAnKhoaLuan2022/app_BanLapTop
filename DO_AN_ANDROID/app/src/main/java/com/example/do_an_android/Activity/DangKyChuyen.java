package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.Toast;

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

public class DangKyChuyen extends AppCompatActivity {

    EditText edit_tinh, edit_huyen, edit_xa, edit_sonha;
    ImageView iconBack, iv_signup;
    String body;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dang_ky_chuyen);
        init();
        body = getIntent().getStringExtra("body");

        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(getApplicationContext(), DangKy.class));
                overridePendingTransition(R.anim.slide_in_left,android.R.anim.slide_out_right);
            }
        });
        iv_signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String tinh = edit_tinh.getText().toString().trim();
                String huyen = edit_huyen.getText().toString().trim();
                String xa = edit_xa.getText().toString().trim();
                String sonha = edit_sonha.getText().toString().trim();
                if(tinh.length()!=0 &&huyen.length()!=0 &&xa.length()!=0 &&sonha.length()!=0)
                {
                    String address = sonha + ", " +xa + ", " +huyen + ", " +tinh;
                    body = body + "\"cusAddress\":"+"\""+ address +"\","
                            +"\"cusType\":"+"\""+String.valueOf(1)+"\","
                            +"\"cusStatus\":"+"\""+String.valueOf(1)+"\"}";
                    docAPI(body);
                    Toast.makeText(DangKyChuyen.this,"Đăng ký thành công",Toast.LENGTH_LONG).show();
                    Intent i = new Intent(getApplicationContext(),DangNhap.class);
                    startActivity(i);
                    overridePendingTransition(R.anim.slide_in_left,android.R.anim.slide_out_right);
                }
                else {
                    Toast.makeText(DangKyChuyen.this,"Vui lòng nhập đầy đủ thông tin",Toast.LENGTH_LONG).show();
                }
            }
        });

    }
    public void init()
    {
        edit_tinh = this.findViewById(R.id.edit_tinh);
        edit_huyen = this.findViewById(R.id.edit_huyen);
        edit_xa = this.findViewById(R.id.edit_xa);
        edit_sonha = this.findViewById(R.id.edit_sonha);
        iconBack = this.findViewById(R.id.iconBack);
        iv_signup = this.findViewById(R.id.iv_signup);
    }
    public void docAPI(String bd){
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        //Create 1 user
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/customers").post(RequestBody.create(MediaType.parse("application/json; charset=utf-8"),bd))
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
}