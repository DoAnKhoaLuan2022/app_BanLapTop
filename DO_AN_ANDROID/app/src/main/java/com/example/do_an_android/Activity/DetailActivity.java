package com.example.do_an_android.Activity;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.do_an_android.Adapter.ShowDialog;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.Model.DetailProduct;
import com.example.do_an_android.Model.GioHang;
import com.example.do_an_android.Model.Product;
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
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class DetailActivity extends AppCompatActivity {

    Product pro;
    ImageView imageView;
    TextView name, price, mota;
    Button add;
    ShowDialog showDialog;
    ImageView iconBack;
    ImageView iconCart;
    GioHang gioHang;
    int idUser;
    User userLogin;
    String id_pro;
    String mt;
    String url,url1;
    String ten ;
    String gia;
    String image;
    String[] mang;
    String[] ha;
    Cart c;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);
        url = getIntent().getStringExtra("detailProduct");
        //url1 = getIntent().getStringExtra("detailAccessory");

        mang =url.split("[,]");

        init();
        idUser = Integer.parseInt(mang[1]);
        getUser(idUser);
//        getDetail(url);
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
                Intent intent7=new Intent(getApplicationContext(), com.example.do_an_android.Activity.GioHang.class);
                intent7.putExtra("idUser","000"+"," + idUser);
                startActivity(intent7);
            }
        });
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        Type usersType = Types.newParameterizedType(List.class, DetailProduct.class);
        final JsonAdapter<List<DetailProduct>> jsonAdapter = moshi.adapter(usersType);
        Request request = new Request.Builder()
                .url(mang[0]).get()
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
                final List<DetailProduct> details = jsonAdapter.fromJson(json);
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        for (DetailProduct a: details)
                              {
                                  id_pro =a.product_id;
                                  mt = "CPU: "+ a.CPU + "\nS??? nh??n: " +a.SoNhan +"\nS??? lu???ng: "
                                          + a.SoLuong + "\n"
                                          +"Speed: "+ a.Speed + "\n"
                                          +"Maxspeed: "+ a.MaxSpeed + "\n"
                                          +"Cache: "+ a.Cache + "\n"
                                          +"RAM: "+ a.RAM + "\n"
                                          +"Lo???i RAM: "+ a.RAM_type + "\n"
                                          +"BusRAM: "+ a.BusRAM + "\n"
                                          +"MaxRAM: "+ a.MaxRAM + "\n"
                                          +"??? c???ng: "+ a.OCung + "\n"
                                          +"M??n h??nh: "+ a.ManHinh + "\n"
                                          +"????? ph??n gi???i: "+ a.DoPhanGiai + "\n"
                                          +"T???n s??? qu??t: "+ a.TanSoQuet + "\n"
                                          +"C??ng ngh??? m??n h??nh: "+ a.CongNgheManHinh + "\n"
                                          +"VGA: "+ a.VGA + "\n"
                                          +"??m thanh: "+ a.AmThanh + "\n"
                                          +"C???ng giao ti???p: "+ a.CongGiaoTiep + "\n"
                                          +"K???t n???i kh??ng d??y: "+ a.KetNoiKhongDay + "\n"
                                          +"Web cam: "+ a.Webcam + "\n"
                                          +"T??nh n??ng kh??c: "+ a.TinhNangKhac + "\n"
                                          +"????n b??n ph??m: "+ a.DenBanPhim + "\n"
                                          +"K??ch th?????c v?? c??n n???ng: "+ a.SizeAndWeight + "\n"
                                          +"Ch???t li???u: "+ a.ChatLieu + "\n"
                                          +"Pin: "+ a.Pin + "\n"
                                          +"H??? ??i???u h??nh: "+ a.HeDieuHanh + "\n"
                                          +"Ra m???t: "+ a.RaMat + "\n" ;
                                  mota.setText(mt);
                        }
                    }
                });
            }
        });
//        OkHttpClient client1 = new OkHttpClient();
//        Moshi moshi1 = new Moshi.Builder().build();
        Type usersType1 = Types.newParameterizedType(List.class, Product.class);
        final JsonAdapter<List<Product>> jsonAdapter1 = moshi.adapter(usersType1);

        // T???o request l??n server.
        // Select
        request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/products").get()
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
                final List<Product> list = jsonAdapter1.fromJson(json);

                // Cho hi???n th??? l??n RecyclerView.
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        for (Product a:list) {
                            DecimalFormat formatter = new DecimalFormat("###,###,###");
                            String idpro = a.id.toString();
                            if(idpro.equals(id_pro)==true)
                            {
                                ten= a.Name.toString();
                                gia= String.valueOf(formatter.format(a.price));
                                name.setText(ten);
                                price.setText(gia +"VND");
                                image = a.avatar;
                                ha = image.split("\\.");
                                imageView.setImageResource(getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));
                                c = new Cart(0,a.id.toString(),a.price,1,a.price*1,idUser,1);
                            }
                        }
                    }
                });
            }
        });
        //Khi b???m n??t ????? th??m v??o gi??? h??ng
        add.setOnClickListener(view -> {
            addCart(c);
        });
    }

    public void getDetail(String dd) {
    }
    private void init() {
        imageView = findViewById(R.id.ivNewsList);
        name = findViewById(R.id.one_name);
        price = findViewById(R.id.one_price);
        mota = findViewById(R.id.tv_mota);
        add = findViewById(R.id.btn_add);
        showDialog = new ShowDialog(this);
        iconBack = this.findViewById(R.id.iconBack);
        iconCart = this.findViewById(R.id.iconCart);
    }
    public void addCart(Cart add)
    {

        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        String body="{"+"\"cartID\":"+"\""+add.cartID+"\","
                +"\"proID\":"+"\""+add.proID+"\","
                +"\"proPrice\":"+"\""+String.valueOf(add.proPrice)+"\","
                +"\"CartQuantity\":"+"\""+String.valueOf(add.getCartQuantity())+"\","
                +"\"CartMoney\":"+"\""+String.valueOf(add.getCartMoney())+"\","
                +"\"cusID\":"+"\""+String.valueOf(add.cusID)+"\","
                +"\"tt\":"+"\""+String.valueOf(add.status)+"\"}";
        //Th??m 1 cart
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/carts").post(RequestBody.create(MediaType.parse("application/json; charset=utf-8"),body))
                .build();
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {


                // L???y th??ng tin JSON tr??? v???. B???n c?? th??? log l???i bi???n json n??y ????? xem n?? nh?? th??? n??o.
                String json = response.body().string();
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        showDialog.show("Th??m gi??? h??ng th??nh c??ng!");
                    }
                });
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

    public  void getProduct(String Id)
    {
        // Kh???i t???o OkHttpClient ????? l???y d??? li???u.
        OkHttpClient client = new OkHttpClient();

        // Kh???i t???o Moshi adapter ????? bi???n ?????i json sang model java (??? ????y l?? User)
        Moshi moshi = new Moshi.Builder().build();

    }
    //icon gi??? h??ng
//Set menu cho action bar
    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.bottom_navigation_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(@NonNull MenuItem item) {
        switch (item.getItemId()) {
            case R.id.Click_to_cart:
                startActivity(new Intent(this, GioHang.class));
                return true;
            default:
                break;
        }
        return super.onOptionsItemSelected(item);
    }
}