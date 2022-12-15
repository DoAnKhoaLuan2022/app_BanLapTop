package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.example.do_an_android.Util.CheckConnection;

import java.io.UnsupportedEncodingException;

public class DangKy extends AppCompatActivity {

    private EditText edit_name,edit_email,edit_pass,edit_repass,edit_phone;
    ImageView iconBack,iv_signup;
    private TextView btnDK;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dangki);

        edit_name=(EditText) findViewById(R.id.edit_fullname);
        edit_email=(EditText) findViewById(R.id.edit_email);
        edit_phone=(EditText) findViewById(R.id.edit_phone);
        edit_pass=(EditText) findViewById(R.id.edit_password);
        edit_repass=(EditText) findViewById(R.id.edit_password_again);
        iconBack=(ImageView) findViewById(R.id.iconBack) ;
        iv_signup = (ImageView) findViewById(R.id.iv_signup);
        iv_signup.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String email = edit_email.getText().toString().trim();
                String name = edit_name.getText().toString().trim();
                String phone = edit_phone.getText().toString().trim();
                String pass = edit_pass.getText().toString().trim();
                String repass = edit_repass.getText().toString().trim();
                if(pass.equals(repass)&& email.length()!=0 && name.length() != 0 && phone.length() != 0)
                {
                    Intent i = new Intent(getApplicationContext(),DangKyChuyen.class);
                    String body="{"
                            +"\"cusName\":"+"\""+name+"\","
                            +"\"cusEmail\":"+"\""+email+"\","
                            +"\"cusPhone\":"+"\""+phone+"\","
                            +"\"cusPassword\":"+"\""+pass+"\",";
//
                    i.putExtra("body",body);
                    startActivity(i);
                }
                else
                {
                    Toast.makeText(DangKy.this,"Vui lòng nhập đầy đủ thông tin và mật khẩu",Toast.LENGTH_LONG).show();
                }

            }
        });
        iconBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(getApplicationContext(), DangNhap.class));
                overridePendingTransition(R.anim.slide_in_left,android.R.anim.slide_out_right);
            }
        });
    }

    public void register( ) {
//        String nameuser = this.nameuser.getText().toString();
//        String email = this.email.getText().toString();
//        String password = this.password.getText().toString();
//        String repass=this.Repassword.getText().toString();
//        if(nameuser.equals("")||email.equals("")||password.equals("")||repass.equals("")){
//            Toast.makeText(getApplicationContext(), "Vui lòng nhập đầy đủ thông tin", Toast.LENGTH_SHORT).show();
//            return;
//        }else if(email.indexOf("@")<0){
//            Toast.makeText(getApplicationContext(), "Email không đúng định dạng!", Toast.LENGTH_SHORT).show();
//        }
//        else if(password.equals(repass)!=true){
//            Toast.makeText(getApplicationContext(), "Mật khẩu không trùng khớp!", Toast.LENGTH_SHORT).show();
//            return;
//        }else {
//            if (email.equals("nam@112gmail.com")) {
//                finish();
//                Toast.makeText(getApplicationContext(), "Đăng ký thành công", Toast.LENGTH_SHORT).show();
//                startActivity(new Intent(getApplicationContext(), DangNhap.class));
//            } else {
//                Toast.makeText(getApplicationContext(), "Đăng ký không thành công", Toast.LENGTH_SHORT).show();
//            }
//        }
    }
//    public String MD5(String md5) {
//        try {
//            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
//            byte[] array = md.digest(md5.getBytes("UTF-8"));
//            StringBuffer sb = new StringBuffer();
//            for (int i = 0; i < array.length; ++i) {
//                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
//            }
//            return sb.toString();
//        } catch (java.security.NoSuchAlgorithmException e) {
//        } catch(UnsupportedEncodingException ex){
//        }
//        return null;
//    }
}