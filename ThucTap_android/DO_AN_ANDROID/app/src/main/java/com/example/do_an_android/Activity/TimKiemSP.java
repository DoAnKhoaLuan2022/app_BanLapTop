package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.ImageView;

import com.example.do_an_android.Adapter.SanPhamAdapter;
import com.example.do_an_android.Model.Product;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.google.android.material.textfield.TextInputEditText;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class TimKiemSP extends AppCompatActivity {


    private ArrayList<Product> list;
    SanPhamAdapter sanPhamAdapter;
    private RecyclerView recyclerView;
    private TextInputEditText find;
    ImageView iconBack,iconCart,image_search;
    User userLogin;
    int idUser;
    String[] mang;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);
        String chuyen = (String)getIntent().getStringExtra("search_product");
        mang= chuyen.split("[,]");
        init();
        idUser = Integer.parseInt(mang[1]);
        getUser(idUser);

        if(mang[0]==null)
        {
            find.setText("");
        }
        else
        {
            find.setText(mang[0]);
        }

        image_search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                OkHttpClient client = new OkHttpClient();

                // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
                Moshi moshi = new Moshi.Builder().build();
                Type usersType = Types.newParameterizedType(List.class, Product.class);
                final JsonAdapter<List<Product>> jsonAdapter = moshi.adapter(usersType);

                // Tạo request lên server.
                // Select
                Request request = new Request.Builder()
                        .url("https://nam1612it.bsite.net/find/"+find.getText().toString()).get()
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
                        final List<Product> list = jsonAdapter.fromJson(json);

                        // Cho hiển thị lên RecyclerView.
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                recyclerView.setAdapter(new SanPhamAdapter(com.example.do_an_android.Activity.TimKiemSP.this,list,Integer.parseInt(mang[1])));
                            }
                        });
                    }
                });
            }
        });
        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),TrangChu.class);
                intent.putExtra("us",userLogin);
                startActivity(intent);
            }
        });
        iconCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent7=new Intent(getApplicationContext(),GioHang.class);
                intent7.putExtra("idUser","000"+"," + userLogin.cusID);
                startActivity(intent7);
            }
        });
        //Set tìm kiếm
//        setFindNews();
        // Khởi tạo OkHttpClient để lấy dữ liệu.
        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Product.class);
        final JsonAdapter<List<Product>> jsonAdapter = moshi.adapter(usersType);

        // Tạo request lên server.
        // Select
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/products").get()
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
                final List<Product> list = jsonAdapter.fromJson(json);

                // Cho hiển thị lên RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        recyclerView.setAdapter(new SanPhamAdapter(com.example.do_an_android.Activity.TimKiemSP.this,list,Integer.parseInt(mang[1])));
                    }
                });
            }
        });

}

//    private void setFindNews() {
//
//
//        // Khởi tạo OkHttpClient để lấy dữ liệu.
//        OkHttpClient client = new OkHttpClient();
//
//        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
//        Moshi moshi = new Moshi.Builder().build();
//        Type usersType = Types.newParameterizedType(List.class, Product.class);
//        final JsonAdapter<List<Product>> jsonAdapter = moshi.adapter(usersType);
//
//        // Tạo request lên server.
//        // Select
//        Request request = new Request.Builder()
//                .url("https://nam1612it.bsite.net/api/products").get()
//                .build();
//        // Thực thi request.
//        client.newCall(request).enqueue(new Callback() {
//            @Override
//            public void onFailure(Call call, IOException e) {
//                Log.e("Error", "Network Error");
//            }
//
//            @Override
//            public void onResponse(Call call, Response response) throws IOException {
//
//                // Lấy thông tin JSON trả về. Bạn có thể log lại biến json này để xem nó như thế nào.
//                String json = response.body().string();
//                final List<Product> list = jsonAdapter.fromJson(json);
//
//                // Cho hiển thị lên RecyclerView.
//                runOnUiThread(new Runnable() {
//                    @Override
//                    public void run() {
//                        recyclerView.setAdapter(new SanPhamAdapter(com.example.do_an_android.Activity.TimKiemSP.this, list, Integer.parseInt(mang[1])));
//                        recyclerView.setFilterTouchesWhenObscured(true);
//                        find.addTextChangedListener(new TextWatcher() {
//                            @Override
//                            public void onTextChanged(CharSequence s, int start, int before, int
//                                    count) {
//                                System.out.println("Text [" + s + "] - Start [" + start + "] - Before [" + before + "] - Count [" + count + "]");
//                                if (count < before) {
//                                    sanPhamAdapter.resetData();
//                                }
//                                sanPhamAdapter.getFilter().filter(s.toString());
//                            }
//
//                            @Override
//                            public void beforeTextChanged(CharSequence s, int start, int count,
//                                                          int after) {
//                            }
//
//                            @Override
//                            public void afterTextChanged(Editable s) {
//                            }
//                        });
//                    }
//                });
//            }
//        });
//    }
    private void init() {
        find = findViewById(R.id.tvFind);
        recyclerView = findViewById(R.id.rcvListNews);
        iconBack = this.findViewById(R.id.iconBack);
        iconCart = this.findViewById(R.id.iconCart);
        image_search = this.findViewById(R.id.image_search);
        //Cài đặt layout cho list, set cố cột là 2 cột
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 2);
        recyclerView.setLayoutManager(layoutManager);
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
    //icon giỏ hàng
//Set menu cho action bar
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.bottom_navigation_menu, menu);
        return true;
    }

    @Override
    public void onBackPressed() {
        finish();
        startActivity(new Intent(getApplicationContext(),TrangChu.class));
    }

}