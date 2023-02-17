package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import com.denzcoskun.imageslider.ImageSlider;
import com.denzcoskun.imageslider.models.SlideModel;
import com.example.do_an_android.Adapter.SanPhamAdapter;
import com.example.do_an_android.Model.Product;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
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

public class showTypeProduct extends AppCompatActivity {

    ImageSlider imageSlider;
    ImageView iconBack,iconSearch,iconCart;
    EditText search;
    User userLogin;
    String url;
    String chuyen;
    String[] mang;
    RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_show_type_product);
        chuyen = (String)getIntent().getStringExtra("url");
        mang =chuyen.split("[,]");
        url = mang[0];
        anhXa();
        getUser(Integer.parseInt(mang[1]));
        List<SlideModel> slideModels= new ArrayList<>();

        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-11.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-293.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-11.png"));

        imageSlider.setImageList(slideModels,true);

        docAPI(url,recyclerView);
        iconSearch.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent6= new Intent(getApplicationContext(), TimKiemSP.class);
                String search_product = search.getText().toString().trim();
                intent6.putExtra("search_product", search_product+","+String.valueOf(userLogin.cusID));
                startActivity(intent6);
            }
        });
        iconCart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),GioHang.class);
                intent.putExtra("idUser","000"+","+ String.valueOf(userLogin.cusID));
                startActivity(intent);
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
    }
    public void anhXa()
    {
        imageSlider = findViewById(R.id.sliderProductType);
        search=this.findViewById(R.id.txtSearch);
        recyclerView= this.findViewById(R.id.rcvListNews);
        iconBack= this.findViewById(R.id.iconBackHome);
        iconSearch=this.findViewById(R.id.iconSearch);
        iconCart=this.findViewById(R.id.iconCart);
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

    public void docAPI(String url, RecyclerView a)
    {
        // Khởi tạo OkHttpClient để lấy dữ liệu.
        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Product.class);
        final JsonAdapter<List<Product>> jsonAdapter = moshi.adapter(usersType);

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
                final List<Product> list = jsonAdapter.fromJson(json);

                // Cho hiển thị lên RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        a.setAdapter(new SanPhamAdapter(com.example.do_an_android.Activity.showTypeProduct.this,list,Integer.parseInt(mang[1])));
                    }
                });
            }
        });
    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent = new Intent(getApplicationContext(), TrangChu.class);
        intent.putExtra("us",userLogin);
        startActivity(intent);
    }
}

