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

import com.example.do_an_android.Adapter.DonHangAdapter;
import com.example.do_an_android.Adapter.GioHangAdapter;
import com.example.do_an_android.Model.Cart;
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

public class DonHang extends AppCompatActivity {

    ImageView iconBack, iconCart;
    RecyclerView rcv_dh;
    TextView tv_TongTien;
    User userLogin;
    String chuyen;
    String url;
    String[] mang;
    int idUser;
    int tong = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_don_hang);
        chuyen = getIntent().getStringExtra("url");
        mang= chuyen.split("[,]");


        init();
        url= mang[0];
        idUser = Integer.parseInt(mang[1]);
        getUser(Integer.parseInt(mang[1]));
        docAPI(url,rcv_dh);
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
    }
    public void init()
    {
        iconBack= this.findViewById(R.id.iconBack);
        iconCart = this.findViewById(R.id.iconCart);
        tv_TongTien = this.findViewById(R.id.tv_TongTien);
        rcv_dh = findViewById(R.id.rcv_dh);
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 1);
        rcv_dh.setLayoutManager(layoutManager);
    }
    public void docAPI(String url, RecyclerView a){
        // Khởi tạo OkHttpClient để lấy dữ liệu.
        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, DetailOrder.class);
        final JsonAdapter<List<DetailOrder>> jsonAdapter = moshi.adapter(usersType);

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
                final List<DetailOrder> list = jsonAdapter.fromJson(json);

                // Cho hiển thị lên RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        a.setAdapter(new DonHangAdapter(com.example.do_an_android.Activity.DonHang.this,DonHang.this,list,idUser));
                        for (DetailOrder a:list
                        ) {
                            int quanlity = a.orderQuantity;
                            int price = a.getProPrice();
                            tong =tong + (quanlity*price);
                        }
                        DecimalFormat formatter = new DecimalFormat("###,###,###");
                        tv_TongTien.setText(String.valueOf(formatter.format(tong))+" VND");
                    }
                });
            }
        });

    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent= new Intent(getApplicationContext(), Person.class);
        intent.putExtra("us", userLogin);
        startActivity(intent);
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