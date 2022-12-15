package com.example.do_an_android.Activity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Adapter.GioHangAdapter;
import com.example.do_an_android.Model.Cart;
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

public class GioHang extends AppCompatActivity {

    ImageView backToHome,cancel;
    private static final String FILE_NAME = "myFile";
    SharedPreferences sharedPreferences;
    public static List<Cart> cartList;
    private RecyclerView view;
    TextView tongtiengh,getidorder,muaHang;
    CheckBox cbAll;
    int idUser;
    String url;
    int tong = 0;
    String chuyen;
    String[] mang;
    User userLogin;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);

        chuyen = getIntent().getStringExtra("idUser");
        mang= chuyen.split("[,]");
        url= mang[0];

        init();
        idUser = Integer.parseInt(mang[1]);
        getUser(Integer.parseInt(mang[1]));

        backToHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                    finish();
                    Intent i = new Intent(GioHang.this , TrangChu.class);
                    i.putExtra("us",userLogin);
                    startActivity(i);
            }
        });

        docAPI("https://nam1612it.bsite.net/selectcart/"+String.valueOf(idUser),view);

        muaHang = findViewById(R.id.muaHang);
        muaHang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent i = new Intent(GioHang.this , Buy.class);
                i.putExtra("us",userLogin);
                startActivity(i);
            }
        });
//        cbAll.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
//            @Override
//            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
//                if(cbAll.isChecked()==true)
//                {
//                    updateStatus1(idUser);
//                    finish();
//                    Intent intent = new Intent(GioHang.this, GioHang.class);
//                    intent.putExtra("idUser","000"+"," + idUser);
//                    startActivity(intent);
//                }
//                else {
//                    updateStatus0(idUser);
//                    finish();
//                    Intent intent = new Intent(GioHang.this, GioHang.class);
//                    intent.putExtra("idUser","000"+"," + idUser);
//                    startActivity(intent);
//                }
//            }
//        });

    }
    public void docAPI(String url, RecyclerView a){
        // Khởi tạo OkHttpClient để lấy dữ liệu.
        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Cart.class);
        final JsonAdapter<List<Cart>> jsonAdapter = moshi.adapter(usersType);

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
                final List<Cart> list = jsonAdapter.fromJson(json);

                // Cho hiển thị lên RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        int i = 0;
                        int j= 0;
                        for (Cart a:list
                        ) {
                            int status = a.status;
                            if(status ==1)
                            {
                                int quanlity = a.getCartQuantity();
                                int price = a.getProPrice();
                                tong =tong + (quanlity*price);
                                i++;
                            }
                            j++;
                        }
                        a.setAdapter(new GioHangAdapter(com.example.do_an_android.Activity.GioHang.this,GioHang.this,list,idUser));
                        if(i==j)
                        {
                            cbAll.setChecked(true);
                        }
                        else
                        {
                            cbAll.setChecked(false);
                        }
                        DecimalFormat formatter = new DecimalFormat("###,###,###");
                        tongtiengh.setText(String.valueOf(formatter.format(tong))+" VND");
                    }
                });
            }
        });

    }
    public void init()
    {
        sharedPreferences = getSharedPreferences(FILE_NAME, MODE_PRIVATE);
        getidorder =(TextView) findViewById(R.id.txt_idorder);
        tongtiengh =(TextView) findViewById(R.id.tongTienGioHang);
        cbAll = this.findViewById(R.id.chonTatCa);
        backToHome = (ImageView) findViewById(R.id.veTrangChu);
        view = findViewById(R.id.mylistview_Danhsachsp);
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 1);
        view.setLayoutManager(layoutManager);
    }
    public void updateStatus1(int id)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/updateStatusall1/"+String.valueOf(id)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
    }
    public void updateStatus0(int id)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/updateStatusall0/"+String.valueOf(id)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

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
    @Override
    public void onBackPressed() {
        finish();
        Intent intent = new Intent(getApplicationContext(), TrangChu.class);
        intent.putExtra("us",userLogin);
        startActivity(intent);
    }
}