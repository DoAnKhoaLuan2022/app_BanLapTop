package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.WindowManager;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.do_an_android.R;

public class PlashScreen extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_plash_screen);
        //Khai báo biến
        ImageView iv = findViewById(R.id.gif);
//        TextView textView = findViewById(R.id.tvText);

        //Set full màn hình
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);

        //Truyền ảnh chạy động
        Glide.with(this).load(R.drawable.icon).into(iv);

        //Animation cho text chạy trái vào
//        textView.startAnimation(AnimationUtils.loadAnimation(this, R.anim.scale_in));
//        textView.animate().setDuration(4000);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                overridePendingTransition(R.anim.no_animation, R.anim.slide_up);
                Intent intent = new Intent(PlashScreen.this, DangNhap.class);
                startActivity(intent);
            }
        }, 3000);// thoi gian chạy 3s
    }
}