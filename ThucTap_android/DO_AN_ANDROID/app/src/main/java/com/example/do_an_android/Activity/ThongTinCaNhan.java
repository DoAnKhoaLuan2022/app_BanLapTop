package com.example.do_an_android.Activity;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.DatePickerDialog;
import android.content.Intent;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.AuthFailureError;
import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.example.do_an_android.Admin.Admin;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;

import java.io.UnsupportedEncodingException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class ThongTinCaNhan extends AppCompatActivity {
    DatePickerDialog.OnDateSetListener setListener;
    TextView txtemail,txtten,txtsdt,txtgender,txtngaysinh,txtpass,admin_profile,admin_logout,thaydoithongtin,luuthaydoi, huythaydoi;
    LinearLayout layout_admin_profile;
    User userLogin;
    ImageView trove;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        Anhxa();
        userLogin = (User) getIntent().getSerializableExtra("us");
        txtten.setText(userLogin.cusName);
        txtsdt.setText(userLogin.cusPhone);
        txtemail.setText(userLogin.cusEmail);
        trove = (ImageView) findViewById(R.id.IV_BackToHome);
        trove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                Intent intent = new Intent(getApplicationContext(), TrangChu.class);
                startActivity(intent);
            }
        });
        Sukien();
        txtngaysinh.setClickable(false);
    }

    private void Sukien() {
        admin_logout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(getApplicationContext(), DangNhap.class));
            }
        });
        admin_profile.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(getApplicationContext(), Admin.class));
            }
        });
    }


    public void backToHome(View view) {
        finish();
       Intent intent= new Intent(this, TrangChu.class);
//       String email_user = txtemail.getText().toString().trim();
//       intent.putExtra("email_user", email_user);
       startActivity(intent);
    }
    public  void Anhxa(){
        txtemail    = findViewById(R.id.txt_emailprofile);
        txtten      = findViewById(R.id.txt_tenprofile);
        txtsdt      = findViewById(R.id.txt_sdtprofile);
        txtgender   = findViewById(R.id.txt_genderprofile);
        txtngaysinh = findViewById(R.id.txt_ngaysinhprofile);
        txtpass     = findViewById(R.id.txt_passprofile);
        admin_logout = findViewById(R.id.admin_logout);
        admin_profile = findViewById(R.id.admin_profile);
        layout_admin_profile = findViewById(R.id.layout_admin_profile);
        layout_admin_profile.setVisibility(View.GONE);
        thaydoithongtin = findViewById(R.id.thaydoithongtin);
        luuthaydoi = findViewById(R.id.luuthaydoi);
        luuthaydoi.setVisibility(View.GONE);
        huythaydoi = findViewById(R.id.huythaydoi);
        huythaydoi.setVisibility(View.GONE);
        thaydoithongtin.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txtten.setEnabled(true);
                txtten.setBackgroundResource(R.drawable.custom_edittext_noframe_no);
                txtsdt.setBackgroundResource(R.drawable.custom_edittext_noframe_no);
                txtgender.setBackgroundResource(R.drawable.custom_edittext_noframe_no);
                txtpass.setBackgroundResource(R.drawable.custom_edittext_noframe_no);
                txtngaysinh.setBackgroundResource(R.drawable.custom_edittext_noframe_no);
                txtsdt.setEnabled(true);

                txtgender.setEnabled(true);
                txtngaysinh.setClickable(true);
                txtpass.setEnabled(true);

                luuthaydoi.setVisibility(View.VISIBLE);
                huythaydoi.setVisibility(View.VISIBLE);
            }
        });
        luuthaydoi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txtten.setEnabled(false);
                txtsdt.setEnabled(false);
                txtgender.setEnabled(false);
                txtpass.setEnabled(false);
                txtngaysinh.setClickable(false);
                txtten.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtsdt.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtgender.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtpass.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtngaysinh.setBackgroundResource(R.drawable.custom_edittext_noframe);

                luuthaydoi.setVisibility(View.GONE);
                huythaydoi.setVisibility(View.GONE);
                updateInfor();
            }
        });
        huythaydoi.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                txtten.setEnabled(false);
                txtsdt.setEnabled(false);
                txtgender.setEnabled(false);
                txtpass.setEnabled(false);
                txtten.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtsdt.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtgender.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtpass.setBackgroundResource(R.drawable.custom_edittext_noframe);
                txtngaysinh.setBackgroundResource(R.drawable.custom_edittext_noframe);

                luuthaydoi.setVisibility(View.GONE);
                huythaydoi.setVisibility(View.GONE);
                txtngaysinh.setClickable(false);
            }
        });
        Calendar calendar = Calendar.getInstance();
        final int year = calendar.get(Calendar.YEAR);
        final int month = calendar.get(Calendar.MONTH);
        final int day = calendar.get(Calendar.DAY_OF_MONTH);
        setListener = (view, year1, month1, day1) -> {
            month1 = month1 + 1;
            String date = day1 + "/" + month1 + "/" + year1;
            txtngaysinh.setText(date);
        };
        txtngaysinh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(
                        ThongTinCaNhan.this, R.style.DatePickerTheme
                        , setListener, year, month, day);
                datePickerDialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                datePickerDialog.show();
            }
        });
    }


    private void updateInfor() {

    }
    @Override
    public void onBackPressed() {
        finish();
        Intent intent= new Intent(getApplicationContext(), Person.class);
        intent.putExtra("us", userLogin);
        startActivity(intent);
    }
    public String MD5(String md5) {
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(md5.getBytes("UTF-8"));
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
        } catch(UnsupportedEncodingException ex){
        }
        return null;
    }
}