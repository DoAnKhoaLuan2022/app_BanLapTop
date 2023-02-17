package com.example.do_an_android.Activity;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.do_an_android.R;

import java.text.DecimalFormat;

public class DatHang extends AppCompatActivity {

    private static final String FILE_NAME = "myFile";
    SharedPreferences sharedPreferences;
    private static int idorder,tien;
    TextView tongtien,dathang,huybo;
    EditText ten,diachi,sdt;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_dathang);
        anhxa();

        DecimalFormat formatter = new DecimalFormat("###,###,###");
        tongtien.setText("Tổng tiền: "+formatter.format(tien)+" VND");


        dathang.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(ten.getText().toString().equals("")||diachi.getText().toString().equals("")||sdt.getText().toString().equals("")){
                    Toast.makeText(getApplicationContext(), "Vui lòng nhập đầy đủ thông tin", Toast.LENGTH_SHORT).show();
                    return;
                }else {
                //Thêm đặt hàng
                //Cập nhật đặt hàng
                    }
            }
        });
        huybo.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
                startActivity(new Intent(DatHang.this, GioHang.class));
            }
        });

    }

    private void anhxa(){
        dathang=(TextView) findViewById(R.id.dat_hang_dh);
        ten=(EditText) findViewById(R.id.hoten_dh);
        diachi=(EditText)findViewById(R.id.dia_chi_dh);
        sdt=(EditText)findViewById(R.id.so_dien_thoai_dh);
        tongtien=(TextView) findViewById(R.id.tong_tien_thanh_toan_dh);
        huybo=(TextView) findViewById(R.id.huy_dat_hang);
    }



    @Override
    public void onBackPressed() {
        finish();
        startActivity(new Intent(getApplicationContext(), GioHang.class));
    }
}