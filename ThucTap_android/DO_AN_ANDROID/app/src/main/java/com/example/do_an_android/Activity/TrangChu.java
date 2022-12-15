
package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;

import com.denzcoskun.imageslider.ImageSlider;
import com.denzcoskun.imageslider.models.SlideModel;
import com.example.do_an_android.Adapter.SanPhamAdapter;
import com.example.do_an_android.Model.Product;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.google.android.material.bottomnavigation.BottomNavigationView;
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

public class TrangChu extends AppCompatActivity {

    EditText editseacrchh;
    RecyclerView recyclerView;
    ImageView search,kk1,kk2,kk3,iconCart;
    ImageView imgLap,imgPhone,imgIpad,imgDongHo,imgPhuKien;
    ImageSlider imageSlider,imageSlider1;
    User userLogin;
    String idUser;
    Button btnMac,btnAsus,btnAcer,btnHP,btnMSI,btnDell,btnPK,btnLenovo,btnLG;
    private static final String FILE_NAME = "myFile";

    BottomNavigationView bottomNavigationView;
    public static String email_user = "";

    @Override
    protected void onCreate(Bundle savedInstanceState) {

        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_trangchu);
        userLogin = (User) getIntent().getSerializableExtra("us");
        AnhXa();
        init();

        List<SlideModel> slideModels= new ArrayList<>();

        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/09/banner/mac-2880-800-1920x533.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/10/banner/ws8-2880-800-1920x533-2.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/10/banner/Banner-Big---Desk-1920x450-3.png"));
        slideModels.add(new SlideModel("https://laptopworld.vn/media/news/0912_Promotion_Campaign_KV_1900x684.jpg"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/800-200-800x200-182.png"));

        imageSlider.setImageList(slideModels,true);

        List<SlideModel> slideModels1= new ArrayList<>();

        slideModels1.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-11.png"));
        slideModels1.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-293.png"));
        slideModels1.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/720-220-720x220-11.png"));



        imageSlider1.setImageList(slideModels1,true);

        docAPI("https://nam1612it.bsite.net/api/products",recyclerView);
        imgLap.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intentLap=new Intent(getApplicationContext(),showTypeProduct.class);
                intentLap.putExtra("url","https://nam1612it.bsite.net/selectLaptop"+","+String.valueOf(userLogin.cusID));
                startActivity(intentLap);
            }
        });
        imgPhone.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intentPhone=new Intent(getApplicationContext(),showTypeProduct.class);
                intentPhone.putExtra("url","https://nam1612it.bsite.net/selectPhone"+","+String.valueOf(userLogin.cusID));
                startActivity(intentPhone);
            }
        });
        imgPhuKien.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intentPK=new Intent(getApplicationContext(),showTypeProduct.class);
                intentPK.putExtra("url","https://nam1612it.bsite.net/selectPhuKienMayTinh"+","+String.valueOf(userLogin.cusID));
                startActivity(intentPK);
            }
        });
        btnMac.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectmacbook"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnAcer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectacer"+","+String.valueOf(userLogin.cusID));
                intent.putExtra("us",userLogin);
                startActivity(intent);
            }
        });
        btnAsus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectasus"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnHP.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectHP"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnMSI.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectMSI"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnDell.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectDell"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnLenovo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectLenovo"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnLG.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectLG"+","+String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        btnPK.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),showTypeProduct.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectPK"+","+String.valueOf(userLogin.cusID));
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
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent6= new Intent(getApplicationContext(), TimKiemSP.class);
                String search_product = editseacrchh.getText().toString().trim();
                intent6.putExtra("search_product", search_product+","+String.valueOf(userLogin.cusID));
                startActivity(intent6);
            }
        });

        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottom_nav) ;
        bottomNavigationView.setOnNavigationItemSelectedListener((item)->{
            finish();
            switch (item.getItemId()){
                case R.id.page_1:
                    Intent intent= new Intent(this, TrangChu.class);
                    intent.putExtra("us", userLogin);
                    startActivity(intent);
                    break;
                case R.id.Click_to_cart:
                    Intent intent7=new Intent(getApplicationContext(),GioHang.class);
                    intent7.putExtra("idUser","000"+"," + userLogin.cusID);
                    startActivity(intent7);
                    break;
                case R.id.page_3:
                    Intent intent2= new Intent(this, DanhSachSP.class);
                    intent2.putExtra("us", userLogin);
                    startActivity(intent2);
                    break;
                case R.id.page_5:
                    Intent intent5= new Intent(this, Person.class);
                    intent5.putExtra("us", userLogin);
                    startActivity(intent5);
                    break;
            }
            return true;
        });
    }

    public void docAPI(String url,RecyclerView a)
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
                        a.setAdapter(new SanPhamAdapter(com.example.do_an_android.Activity.TrangChu.this,list,userLogin.cusID));
                    }
                });
            }
        });
    }
    private void init() {
        recyclerView = findViewById(R.id.rcvListNews);
        //Cài đặt layout cho list, set cố cột là 2 cột
        LinearLayoutManager layoutManager
                = new GridLayoutManager(this, 2);
        recyclerView.setLayoutManager(layoutManager);
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
        startActivity(new Intent(getApplicationContext(),DangNhap.class));
    }


    public void AnhXa(){
        search=findViewById(R.id.image_search);
        editseacrchh=findViewById(R.id.search);
        recyclerView = findViewById(R.id.rcvListNews);
        imageSlider = findViewById(R.id.slider);
        imageSlider1= findViewById(R.id.slider1);
        btnMac= this.findViewById(R.id.btnMac);
        btnAsus= this.findViewById(R.id.btnAsus);
        btnAcer= this.findViewById(R.id.btnAcer);
        btnHP= this.findViewById(R.id.btnHP);
        btnMSI= this.findViewById(R.id.btnMSI);
        btnDell= this.findViewById(R.id.btnDell);
        btnPK= this.findViewById(R.id.btnPK);
        btnLenovo= this.findViewById(R.id.btnLenovo);
        btnLG= this.findViewById(R.id.btnLG);
//        kk1=findViewById(R.id.kk1);
//        kk2=findViewById(R.id.kk2);
//        kk3=findViewById(R.id.kk3);
        imgLap=this.findViewById(R.id.imgLap);
        imgPhone=this.findViewById(R.id.imgPhone);
        imgIpad = this.findViewById(R.id.imgIpad);
        imgDongHo = this.findViewById(R.id.imgDongho);
        imgPhuKien= this.findViewById(R.id.imgPK);
        iconCart=this.findViewById(R.id.icon_cart);
        // item = (MenuItem) findViewById(R.id.Click_to_cart);
    }
//

    //Hide keyboard
    public void AnBanPhim() {
        try {
            InputMethodManager inputMethodManager = (InputMethodManager) getSystemService(DangNhap.INPUT_METHOD_SERVICE);
            inputMethodManager.hideSoftInputFromWindow(getCurrentFocus().getWindowToken(),0);

        }catch (NullPointerException ex)
        {ex.printStackTrace();}

    }

    public void btngiohang(View view) {
        startActivity(new Intent(getApplicationContext(), GioHang.class));
    }

    public void xemtatca(View view) {
        startActivity(new Intent(getApplicationContext(),DanhSachSP.class));
    }

}

