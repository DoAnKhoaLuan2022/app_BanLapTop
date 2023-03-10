package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.do_an_android.Adapter.DiaChiAdapter;
import com.example.do_an_android.Adapter.GioHangAdapter;
import com.example.do_an_android.Model.Address;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class Buy extends AppCompatActivity {

    Button btnDY,btnTC;
    RecyclerView recyclerView;
    Spinner spinner;
    User userLogin;
    int idUser;
    Cart cart;
    String dc;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_buy);
        userLogin = (User) getIntent().getSerializableExtra("us");
        init();


        docAPI();
        docAPICart("https://nam1612it.bsite.net/selectCartStatus/"+userLogin.cusID,recyclerView);
        btnDY.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                themOrder();
                themdetailOrder();
                finish();
                Intent i = new Intent(getApplicationContext(), TrangChu.class);
                i.putExtra("us",userLogin);
                startActivity(i);
            }
        });
        btnTC.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent7=new Intent(getApplicationContext(),GioHang.class);
                intent7.putExtra("idUser","000"+"," + userLogin.cusID);
                startActivity(intent7);
            }
        });
    }

    public void init(){
        btnDY = this.findViewById(R.id.btnDongY);
        btnTC = this.findViewById(R.id.btnTuChoi);
        spinner = this.findViewById(R.id.spinner_address);
        recyclerView = findViewById(R.id.rcv_thanhtoan);
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 1);
        recyclerView.setLayoutManager(layoutManager);
    }
    public void docAPI(){
        // Kh???i t???o OkHttpClient ????? l???y d??? li???u.
        OkHttpClient client = new OkHttpClient();

        // Kh???i t???o Moshi adapter ????? bi???n ?????i json sang model java (??? ????y l?? User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, com.example.do_an_android.Model.Address.class);
        final JsonAdapter<List<Address>> jsonAdapter = moshi.adapter(usersType);

        // T???o request l??n server.
        // Select
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/selectAddress/"+String.valueOf(userLogin.cusID)).get()
                .build();
        // Th???c thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                // L???y th??ng tin JSON tr??? v???. B???n c?? th??? log l???i bi???n json n??y ????? xem n?? nh?? th??? n??o.
                String json = response.body().string();
                final List<com.example.do_an_android.Model.Address> list = jsonAdapter.fromJson(json);

                // Cho hi???n th??? l??n RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        ArrayList<String> arrayList =new ArrayList<>();
                        for (Address a:list
                             ) {
                            arrayList.add(a.Name_Address.toString().trim());
                        }
                        ArrayAdapter<String> adapter = new ArrayAdapter<String>(Buy.this, androidx.appcompat.R.layout.support_simple_spinner_dropdown_item,arrayList);
                        adapter.setDropDownViewResource(androidx.appcompat.R.layout.support_simple_spinner_dropdown_item);
                        spinner.setAdapter(adapter);
                    }
                });
            }
        });

    }
    public void docAPICart(String url, RecyclerView a){
        // Kh???i t???o OkHttpClient ????? l???y d??? li???u.
        OkHttpClient client = new OkHttpClient();

        // Kh???i t???o Moshi adapter ????? bi???n ?????i json sang model java (??? ????y l?? User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Cart.class);
        final JsonAdapter<List<Cart>> jsonAdapter = moshi.adapter(usersType);

        // T???o request l??n server.
        // Select
        Request request = new Request.Builder()
                .url(url).get()
                .build();
        // Th???c thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                // L???y th??ng tin JSON tr??? v???. B???n c?? th??? log l???i bi???n json n??y ????? xem n?? nh?? th??? n??o.
                String json = response.body().string();
                final List<Cart> list = jsonAdapter.fromJson(json);

                // Cho hi???n th??? l??n RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        a.setAdapter(new GioHangAdapter(com.example.do_an_android.Activity.Buy.this,Buy.this,list,userLogin.cusID));
                    }
                });
            }
        });

    }
    public void themOrder(){
        // Kh???i t???o OkHttpClient ????? l???y d??? li???u.
        OkHttpClient client = new OkHttpClient();

        // Kh???i t???o Moshi adapter ????? bi???n ?????i json sang model java (??? ????y l?? User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Cart.class);
        final JsonAdapter<List<Cart>> jsonAdapter = moshi.adapter(usersType);

        // T???o request l??n server.
        // Select
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/createOrder/"+userLogin.cusID).get()
                .build();
        // Th???c thi request.
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
    public void themdetailOrder(){
        // Kh???i t???o OkHttpClient ????? l???y d??? li???u.
        OkHttpClient client = new OkHttpClient();

        // Kh???i t???o Moshi adapter ????? bi???n ?????i json sang model java (??? ????y l?? User)
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, Cart.class);
        final JsonAdapter<List<Cart>> jsonAdapter = moshi.adapter(usersType);

        // T???o request l??n server.
        // Select
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/selectCartStatus/"+userLogin.cusID).get()
                .build();
        // Th???c thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

                // L???y th??ng tin JSON tr??? v???. B???n c?? th??? log l???i bi???n json n??y ????? xem n?? nh?? th??? n??o.
                String json = response.body().string();
                final List<Cart> list = jsonAdapter.fromJson(json);

                // Cho hi???n th??? l??n RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        for (Cart a:list
                             ) {
                            update(a);
                            delete(a.cartID);
                        }
                    }
                });
            }
        });

    }
    public void delete(int id){
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        //Update 1 user
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/deleteCartOrder/"+ String.valueOf(id)).delete()
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
    public void update(Cart c){
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        String body="{"
                +"\"proID\":"+"\""+c.proID+"\","
                +"\"orderAddress\":"+"\""+userLogin.cusAddress+"\","
                +"\"proPrice\":"+"\""+String.valueOf(c.proPrice)+"\","
                +"\"orderQuantity\":"+"\""+String.valueOf(c.getCartQuantity())+"\","
                +"\"orderMoney\":"+"\""+ String.valueOf(c.getCartMoney()) +"\","
                +"\"cusID\":"+"\""+String.valueOf(userLogin.cusID)+"\"}";
        //Update 1 user
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/DetailsOrders").post(RequestBody.create(MediaType.parse("application/json; charset=utf-8"),body))
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