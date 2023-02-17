package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class HuyHang extends AppCompatActivity {

    EditText edit_lido;
    Button btnHuy;
    String maDH;
    String nameImage;
    int idUser;
    String chuyen ;
    String[] mang;
    User userLogin;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_huy_hang);
        chuyen = getIntent().getStringExtra("idUser");
        mang= chuyen.split("[,]");

        maDH = mang[0];
        idUser = Integer.parseInt(mang[1]);
        getUser(Integer.parseInt(mang[1]));
        init();
        btnHuy.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                getAPI();
                Toast.makeText(HuyHang.this, "Hủy đơn hàng", Toast.LENGTH_SHORT).show();
                OkHttpClient client = new OkHttpClient();
                Moshi moshi = new Moshi.Builder().build();
                Type usersType = Types.newParameterizedType(List.class, User.class);
                final JsonAdapter<List<User>> jsonAdapter = moshi.adapter(usersType);
                okhttp3.Request request = new Request.Builder()
                        .url("https://nam1612it.bsite.net/createCancel/"+String.valueOf(maDH)+"/"+edit_lido.getText().toString()).get()
                        .build();
                // Thực thi request.
                client.newCall(request).enqueue(new Callback() {
                    @Override
                    public void onFailure(Call call, IOException e) {
                        Log.e("Error", "Network Error");
                    }
                    @Override
                    public void onResponse(Call call, Response response) throws IOException {
                        // Lấy thông tin JSON trả về. Bạn có thể log lại biến json này để xem nó như thế nào.
                        String json = response.body().string();

                    }
                });
                finish();
                Intent intent=new Intent(getApplicationContext(),DonHang.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectDetailOrderNew/"+String.valueOf(userLogin.cusID)+ "," + String.valueOf(userLogin.cusID)+","+"Đang chờ xác nhận");
                startActivity(intent);
            }
        });
    }
    public void init()
    {
        edit_lido = this.findViewById(R.id.edit_lido);
        btnHuy = this.findViewById(R.id.btnHuy);

    }
    public void getAPI()
    {
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, User.class);
        final JsonAdapter<List<User>> jsonAdapter = moshi.adapter(usersType);
        okhttp3.Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/updateOrderCancel/"+String.valueOf(maDH)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }
            @Override
            public void onResponse(Call call, Response response) throws IOException {
                // Lấy thông tin JSON trả về. Bạn có thể log lại biến json này để xem nó như thế nào.
                String json = response.body().string();

            }
        });
    }
    public void getUser(int id)
    {
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, User.class);
        final JsonAdapter<List<User>> jsonAdapter = moshi.adapter(usersType);
        okhttp3.Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/customers").get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }
            @Override
            public void onResponse(Call call, Response response) throws IOException {
                // Lấy thông tin JSON trả về. Bạn có thể log lại biến json này để xem nó như thế nào.
                String json = response.body().string();
                final List<User> users = jsonAdapter.fromJson(json);
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        for (User a:users) {
                            int idus=a.cusID;
                            if(idus==id)
                            {
                                userLogin = a;
                            }

                        }
                    }
                });
            }
        });
    }
}