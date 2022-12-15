package com.example.do_an_android.Activity;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.WindowManager;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.example.do_an_android.Util.CheckConnection;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class DangNhap extends AppCompatActivity {

    EditText email,password;
    ImageView chuyentrangdangki1,iv_login;
//    TextView txtdangki;
    User userLogin;
    int kt= 0 ;

    private static final String FILE_NAME = "myFile";
    private static final String FILE_SAVE = "savePass";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_STATE_HIDDEN);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        anhxa();
        iv_login.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
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

                            // Cho hiển thị lên RecyclerView.
                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {
                                    for (User a:users) {
                                        String us= a.cusEmail.toString().trim();
                                        String pw= a.cusPassword.toString().trim();
                                        if(us.equals(email.getText().toString().trim())==true&&pw.equals(password.getText().toString().trim())==true)
                                        {
                                            kt++;
                                            userLogin = a;
                                        }

                                    }
                                    login(kt,userLogin);
                                }
                            });
                        }
                    });

                }
            });
//        txtdangki.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                finish();
//                startActivity(new Intent(getApplicationContext(), DangKy.class));
//            }
//        });
        chuyentrangdangki1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(getApplicationContext(), DangKy.class));
                overridePendingTransition(R.anim.slide_in_right,android.R.anim.slide_out_right);
            }
        });
    }

    public void anhxa() {
        chuyentrangdangki1 = findViewById(R.id.chuyentrangdangki1);
//        txtdangki = findViewById(R.id.txt_dangkidn);
        iv_login = findViewById(R.id.iv_login);
        email = findViewById(R.id.edtEmail_Dangnhap);
        password = findViewById(R.id.edtPassword_Dangnhap);
    }
    public void login(int kt,User a) {

        String email = this.email.getText().toString().trim();
        String password = (this.password.getText().toString().trim());
        if (email.equals("") || password.equals("")) {
            Toast.makeText(getApplicationContext(), "Vui lòng điền đủ thông tin", Toast.LENGTH_SHORT).show();
            return;
        } else {

            if (kt!=0) {
                finish();
                Toast.makeText(getApplicationContext(), "Đăng nhập thành công", Toast.LENGTH_SHORT).show();
                Intent intent = new Intent(getApplicationContext(), TrangChu.class);
                SharedPreferences.Editor editor = getSharedPreferences(FILE_NAME, MODE_PRIVATE).edit();
                //Truyền toàn bộ data sang
                editor.apply();
                intent.putExtra("us", a);
                startActivity(intent);
                finish();
            } else {
                Toast.makeText(getApplicationContext(), "Tài khoản hoặc mật khẩu không đúng", Toast.LENGTH_SHORT).show();
            }
        }
    }

//    private void Remember(String edittext_phone,String edittext_password) {
//        if (remember_me.isChecked()){
//            SharedPreferences.Editor editor = getSharedPreferences(FILE_SAVE, MODE_PRIVATE).edit();
//            editor.putString("edittext_phone",edittext_phone);
//            editor.putString("edittext_password",edittext_password);
//            editor.apply();
//        }else {
//            SharedPreferences.Editor editor = getSharedPreferences(FILE_SAVE, MODE_PRIVATE).edit();
//            editor.putString("edittext_phone","");
//            editor.putString("edittext_password","");
//            editor.apply();
//        }
//    }

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