package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.denzcoskun.imageslider.ImageSlider;
import com.denzcoskun.imageslider.models.SlideModel;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.google.android.material.bottomnavigation.BottomNavigationView;

import java.util.ArrayList;
import java.util.List;

public class Person extends AppCompatActivity {

    ImageView iconBack,iconCart,iconSetting;
    ImageView iv_DangLayHang, iv_ChoXacNhan, iv_DangGiaoHang, iv_DanhGia;
    BottomNavigationView bottomNavigationView;
    RelativeLayout rlAddress,rlSupport;
    TextView tv_ten;
    String url;
    String[] mang;
    User userLogin;
    ImageSlider imageSlider;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_person);
        userLogin = (User) getIntent().getSerializableExtra("us");


        init();
        tv_ten.setText(userLogin.cusName.toString());
        List<SlideModel> slideModels= new ArrayList<>();

        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/09/banner/mac-2880-800-1920x533.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/10/banner/ws8-2880-800-1920x533-2.png"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/10/banner/Banner-Big---Desk-1920x450-3.png"));
        slideModels.add(new SlideModel("https://laptopworld.vn/media/news/0912_Promotion_Campaign_KV_1900x684.jpg"));
        slideModels.add(new SlideModel("https://cdn.tgdd.vn/2022/11/banner/800-200-800x200-182.png"));

        imageSlider.setImageList(slideModels,true);

        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent5= new Intent(getApplicationContext(), TrangChu.class);
                intent5.putExtra("us", userLogin);
                startActivity(intent5);
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
        iconSetting.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent5= new Intent(getApplicationContext(), ThongTinCaNhan.class);
                intent5.putExtra("us", userLogin);
                startActivity(intent5);
            }
        });

        iv_ChoXacNhan.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),DonHang.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectDetailOrderNew/"+String.valueOf(userLogin.cusID)+ "," + String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        iv_DangLayHang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),DonHang.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectDetailOrderDangGiao/"+String.valueOf(userLogin.cusID)+ "," + String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        iv_DangGiaoHang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent=new Intent(getApplicationContext(),DonHang.class);
                intent.putExtra("url","https://nam1612it.bsite.net/selectDetailOrderHoanThanh/"+String.valueOf(userLogin.cusID)+ "," + String.valueOf(userLogin.cusID));
                startActivity(intent);
            }
        });
        iv_DanhGia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
        rlAddress.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent2= new Intent(getApplicationContext(), Address.class);
                intent2.putExtra("us", userLogin);
                startActivity(intent2);
            }
        });
        rlSupport.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
//        bottomNavigationView = (BottomNavigationView) findViewById(R.id.bottom_nav) ;
//        bottomNavigationView.setOnNavigationItemSelectedListener((item)->{
//            finish();
//            switch (item.getItemId()){
//                case R.id.page_1:
//                    Intent intent= new Intent(this, TrangChu.class);
//                    intent.putExtra("us", userLogin);
//                    startActivity(intent);
//                    break;
//                case R.id.Click_to_cart:
//                    Intent intent7=new Intent(getApplicationContext(),GioHang.class);
//                    intent7.putExtra("idUser","000"+"," + userLogin.cusID);
//                    startActivity(intent7);
//                    break;
//                case R.id.page_3:
//                    Intent intent2= new Intent(this, DanhSachSP.class);
//                    intent2.putExtra("us", userLogin);
//                    startActivity(intent2);
//                    break;
//                case R.id.page_5:
//                    Intent intent5= new Intent(this, Person.class);
//                    intent5.putExtra("us", userLogin);
//                    startActivity(intent5);
//                    break;
//            }
//            return true;
//        });
    }
    public void init()
    {
        imageSlider = this.findViewById(R.id.slider);
        iconBack = this.findViewById(R.id.iconBack);
        iconCart = this.findViewById(R.id.iconCart);
        iconSetting = this.findViewById(R.id.iconSetting);
        iv_ChoXacNhan = this.findViewById(R.id.iv_ChoXacnhan);
        iv_DangLayHang = this.findViewById(R.id.iv_ChoLayHang);
        iv_DangGiaoHang = this.findViewById(R.id.iv_DangGiao);
        iv_DanhGia = this.findViewById(R.id.iv_DanhGia);
        tv_ten = this.findViewById(R.id.tv_ten);
        rlAddress = this.findViewById(R.id.rlAddress);
        rlSupport = this.findViewById(R.id.rlHoTro);
    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent= new Intent(getApplicationContext(), TrangChu.class);
        intent.putExtra("us", userLogin);
        startActivity(intent);
    }
}