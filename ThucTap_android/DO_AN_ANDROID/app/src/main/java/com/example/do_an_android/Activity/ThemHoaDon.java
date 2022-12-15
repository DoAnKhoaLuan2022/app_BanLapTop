package com.example.do_an_android.Activity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.do_an_android.R;

public class ThemHoaDon extends AppCompatActivity {

    private EditText txttrangthai,txtdate,txtdiachi,txtiduser;
    private TextView btnthemHD;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.themhoadon);
        txttrangthai= (EditText) findViewById(R.id.txt_trangthaihoadon);
        txtdate= (EditText) findViewById(R.id.txt_ngaylaphoadon);
        txtdiachi= (EditText) findViewById(R.id.txt_diachihoadon);
        txtiduser= (EditText) findViewById(R.id.txt_iduser);

        btnthemHD = (TextView) findViewById(R.id.btn_themhoadon);
        btnthemHD.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
    }

    @Override
    public void onBackPressed() {
        finish();
        startActivity(new Intent(ThemHoaDon.this,TrangChu.class));
    }
}
