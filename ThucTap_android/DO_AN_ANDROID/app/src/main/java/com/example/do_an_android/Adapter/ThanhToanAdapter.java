package com.example.do_an_android.Adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Activity.GioHang;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.R;
import com.squareup.moshi.Moshi;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class ThanhToanAdapter extends RecyclerView.Adapter<ThanhToanAdapter.ViewHolder>{

    private Context context;
    private Activity a;
    private List<Cart> list;
    int i=0;
    CheckBox cbAll;
    int tongTien;
    int idUser;
    String idCartThanhToan ="";
    NumberFormat format = NumberFormat.getCurrencyInstance();

    public ThanhToanAdapter(Context context, List<Cart> list,int id ) {
        this.context = context;
        this.list = list;
        this.idUser = id;
    }
    public ThanhToanAdapter(Context context,Activity a, List<Cart> list,int id ) {
        this.context = context;
        this.a = a;
        this.list = list;
        this.idUser = id;
    }
    public ThanhToanAdapter(Context context,Activity a,CheckBox cbAll,int tongTien, List<Cart> list,int id ) {
        this.context = context;
        this.a = a;
        this.cbAll = cbAll;
        this.tongTien =tongTien;
        this.list = list;
        this.idUser = id;
    }
    @NonNull
    @Override
    public ThanhToanAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //Set layout cho adapter để hiển thị lên list
        View view = LayoutInflater.from(context).inflate(R.layout.one_thanhtoan, parent, false);
        return new ThanhToanAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ThanhToanAdapter.ViewHolder holder, int position) {
        //Trả về 1 item tại vị trí position(vị trí hiện tại theo list)
        Cart gh = list.get(position);
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        holder.name.setText(gh.proName.toString());
        String[] ha= gh.avatar.toString().split("\\.");
        holder.imageView.setImageResource(context.getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));
        holder.price.setText(String.valueOf(formatter.format(gh.proPrice))+" VND");
        holder.sl.setText(String.valueOf(gh.getCartQuantity()));
    }
    @Override
    public int getItemCount() {
        return list.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView;
        TextView name, price;
        TextView sl;
        View view;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            //Khai báo id theo itemView
            imageView = itemView.findViewById(R.id.ivNewsList);
            name = itemView.findViewById(R.id.one_name);
            price = itemView.findViewById(R.id.one_price);
            sl = itemView.findViewById(R.id.one_sl);
            view = itemView;

        }
    }
}
