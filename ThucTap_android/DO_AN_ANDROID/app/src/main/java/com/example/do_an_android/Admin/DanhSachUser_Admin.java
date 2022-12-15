package com.example.do_an_android.Admin;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;
import android.widget.ListView;
import android.widget.TextView;

import com.example.do_an_android.Activity.TrangChu;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;

import java.util.ArrayList;

public class DanhSachUser_Admin extends AppCompatActivity {

    ImageView trove;
    TextView chitiet;
    ListView listView;
    ArrayList<User> userArrayList = new ArrayList<>();
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_danh_sach_user_admin);
        listView = findViewById(R.id.mylistview_DanhsachUserAdmin);
//        getdata();

        trove = (ImageView) findViewById(R.id.IV_BackToHome);
        trove.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), Admin.class);
                finish();
                startActivity(intent);
            }
        });

//        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
//            @Override
//            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
//                Toast.makeText(getApplicationContext(), "" + userArrayList.get(i).getIdproduct(), Toast.LENGTH_SHORT).show();
//                Intent intent = new Intent(getApplicationContext(), ChiTietSanPham.class);
//                int idpro = userArrayList.get(i).getIdproduct();
//                intent.putExtra("idproduct", userArrayList.get(i).getIdproduct());
//                startActivity(intent);
//            }
//        });
    }
//    public  void getdata(){
//        RequestQueue requestQueue = Volley.newRequestQueue(getApplicationContext());
//        StringRequest stringRequest = new StringRequest(Request.Method.GET, Server.getalluser, response -> {
//            userArrayList.clear();
//            int     id = 0;
//            String name = "";
//            String birthday = "";
//            String phone = "";
//            String email = "";
//            String gender = "";
//            String pass = "";
//            int type = 0;
//            try {
//                JSONArray jsonArray = new JSONArray(response);
//                for (int i=0;i<jsonArray.length();i++){
//                    JSONObject jsonObject = jsonArray.getJSONObject(i);
//                    id =  jsonObject.getInt("iduser");
//                    name = jsonObject.getString("nameuser");
//                    birthday = jsonObject.getString("birthday");
//                    phone = jsonObject.getString("phone");
//                    email= jsonObject.getString("email");
//                    gender = jsonObject.getString("gender");
//                    pass  = jsonObject.getString("password");
//                    type =  jsonObject.getInt("typeuser");
//                    userArrayList.add(new User(id,name,birthday,phone,email, gender, pass,type));
//                }
//                adapter.notifyDataSetChanged();
//            } catch (JSONException e) {
//                e.printStackTrace();
//            }
//        }, error -> Toast.makeText(getApplicationContext(), "Lỗi " + error.toString(), Toast.LENGTH_SHORT).show());
//
//        requestQueue.add(stringRequest);
//    }
    @Override
    public void onBackPressed() {
        finish();
        startActivity(new Intent(getApplicationContext(),TrangChu.class));
    }
}