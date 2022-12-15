package com.example.do_an_android.Adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Activity.DonHang;
import com.example.do_an_android.Activity.GioHang;
import com.example.do_an_android.Model.Address;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.Model.DetailOrder;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.Moshi;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class DiaChiAdapter extends RecyclerView.Adapter<DiaChiAdapter.ViewHolder>{

    private Context context;
    private Activity a;
    private List<Address> list;
    User userLogin;
    public DiaChiAdapter(Context context,Activity a, List<Address> list,User userLogin) {
        this.context = context;
        this.a = a;
        this.list = list;
        this.userLogin = userLogin;
    }
    @NonNull
    @Override
    public DiaChiAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //Set layout cho adapter để hiển thị lên list
        View view = LayoutInflater.from(context).inflate(R.layout.one_address, parent, false);
        return new DiaChiAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DiaChiAdapter.ViewHolder holder, int position) {
        //Trả về 1 item tại vị trí position(vị trí hiện tại theo list)
        Address dc = list.get(position);
        String dcUser = userLogin.cusAddress.toString().trim();
        String dcUpdate = dc.Name_Address.toString().trim();

        holder.tv_DiaChi.setText(dc.Name_Address.toString());

        if(dcUser.equals(dcUpdate)==false){
            holder.tv_MacDinh.setVisibility(View.INVISIBLE);
        }
        else
        {
            holder.tv_MacDinh.setVisibility(View.VISIBLE);
        }
        holder.iv_Setting.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                updateAddressForUser(userLogin,dcUpdate);
                User userUpdate = new User(userLogin.cusID,userLogin.cusName,
                        userLogin.cusEmail,userLogin.cusPhone,userLogin.cusPassword,
                        dcUpdate,userLogin.cusType,userLogin.cusStatus,userLogin.cusPhoto);
                a.finish();
                Intent intent = new Intent(context, com.example.do_an_android.Activity.Address.class);
                intent.putExtra("us",userUpdate);
                context.startActivity(intent);
            }
        });
        holder.iv_delete.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                deleteAddress(dc.ID_address);
                a.finish();
                Intent intent = new Intent(context, com.example.do_an_android.Activity.Address.class);
                intent.putExtra("us",userLogin);
                context.startActivity(intent);
            }
        });
    }
    @Override
    public int getItemCount() {
        return list.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView tv_DiaChi, tv_MacDinh;
        ImageView iv_Setting, iv_delete;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            //Khai báo id theo itemView
            iv_delete = itemView.findViewById(R.id.iv_delete);
            iv_Setting = itemView.findViewById(R.id.iv_setting);
            tv_DiaChi =itemView.findViewById(R.id.tv_DiaChi);
            tv_MacDinh = itemView.findViewById(R.id.tv_macdinh);

        }
    }
    public void deleteAddress(int idAd)
    {
        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        //Thêm 1 cart
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/CustomerAddresses/" + String.valueOf(idAd)).delete().build();
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {
            }
        });
        Toast.makeText(context, "Xóa địa chỉ thành công!", Toast.LENGTH_SHORT).show();
    }
    public void updateAddressForUser(User add, String address)
    {

        OkHttpClient client = new OkHttpClient();
        Moshi moshi = new Moshi.Builder().build();
        String body="{"+"\"cusID\":"+"\""+add.cusID+"\","
                +"\"cusName\":"+"\""+add.cusName+"\","
                +"\"cusEmail\":"+"\""+String.valueOf(add.cusEmail)+"\","
                +"\"cusPhone\":"+"\""+String.valueOf(add.cusPhone)+"\","
                +"\"cusPassword\":"+"\""+String.valueOf(add.cusPassword)+"\","
                +"\"cusAddress\":"+"\""+ address +"\","
                +"\"cusType\":"+"\""+String.valueOf(add.cusType)+"\","
                +"\"cusStatus\":"+"\""+String.valueOf(add.cusStatus)+"\","
                +"\"cusPhoto\":"+"\""+String.valueOf(add.cusPhoto)+"\"}";
        //Update 1 user
        Request request = new Request.Builder()
                .url("https://nam1612it.bsite.net/api/customers/" + String.valueOf(add.cusID)).put(RequestBody.create(MediaType.parse("application/json; charset=utf-8"),body))
                .build();
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {
                Log.e("Error", "Network Error");
            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
        Toast.makeText(context, "Hoàn thành cập nhật", Toast.LENGTH_SHORT).show();
    }
}
