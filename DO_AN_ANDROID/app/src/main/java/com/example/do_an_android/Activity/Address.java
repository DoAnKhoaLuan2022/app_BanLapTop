package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.do_an_android.Adapter.DiaChiAdapter;
import com.example.do_an_android.Adapter.DonHangAdapter;
import com.example.do_an_android.Model.DetailOrder;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class Address extends AppCompatActivity {

    User userLogin;
    RecyclerView recyclerView;
    ImageView iconBack,iconCart,iconCreateAddress;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_address);
        userLogin = (User) getIntent().getSerializableExtra("us");


        init();
        docAPI("https://nam1612it.bsite.net/selectAddress/"+String.valueOf(userLogin.cusID),recyclerView);
        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent= new Intent(getApplicationContext(), Person.class);
                intent.putExtra("us", userLogin);
                startActivity(intent);
            }
        });
        iconCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent7=new Intent(getApplicationContext(),GioHang.class);
                intent7.putExtra("idUser","001"+ "," + userLogin.cusID);
                startActivity(intent7);
            }
        });
        iconCreateAddress.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent= new Intent(getApplicationContext(), CreateAddress.class);
                intent.putExtra("us", userLogin);
                startActivity(intent);
            }
        });
    }

    public  void init()
    {
        iconBack = this.findViewById(R.id.iconBack);
        iconCart = this.findViewById(R.id.iconCart);
        iconCreateAddress = this.findViewById(R.id.iv_addAddress);
        recyclerView = findViewById(R.id.rcv_DiaChi);
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 1);
        recyclerView.setLayoutManager(layoutManager);
    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent= new Intent(getApplicationContext(), Person.class);
        intent.putExtra("us", userLogin);
        startActivity(intent);
    }
    public void docAPI(String url, RecyclerView a){
        // Khởi tạo OkHttpClient để lấy dữ liệu.
        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, com.example.do_an_android.Model.Address.class);
        final JsonAdapter<List<com.example.do_an_android.Model.Address>> jsonAdapter = moshi.adapter(usersType);

        // Tạo request lên server.
        // Select
        Request request = new Request.Builder()
                .url(url).get()
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
                final List<com.example.do_an_android.Model.Address> list = jsonAdapter.fromJson(json);

                // Cho hiển thị lên RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        a.setAdapter(new DiaChiAdapter(com.example.do_an_android.Activity.Address.this,Address.this,list,userLogin));
                    }
                });
            }
        });

    }
}