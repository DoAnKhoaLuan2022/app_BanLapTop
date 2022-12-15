package com.example.do_an_android.Activity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.do_an_android.R;

public class ThemLoaiSP extends AppCompatActivity {
    private EditText txttenloai;
    private TextView btnthemloai;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.themloaisanpham);
        txttenloai = (EditText) findViewById(R.id.txt_themtenloai);

        btnthemloai = (TextView) findViewById(R.id.btn_themloai);
        btnthemloai.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

            }
        });
    }

}

