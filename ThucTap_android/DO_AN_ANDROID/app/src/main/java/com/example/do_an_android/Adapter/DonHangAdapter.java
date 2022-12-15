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

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Activity.DonHang;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.Model.DetailOrder;
import com.example.do_an_android.R;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

public class DonHangAdapter extends RecyclerView.Adapter<DonHangAdapter.ViewHolder>{
    private Context context;
    private Activity a;
    private List<DetailOrder> list;
    CheckBox cbAll;
    int tongTien;
    int idUser;
    NumberFormat format = NumberFormat.getCurrencyInstance();

    public DonHangAdapter(Context context, List<DetailOrder> list,int id ) {
        this.context = context;
        this.list = list;
        this.idUser = id;
    }
    public DonHangAdapter(Context context,Activity a, List<DetailOrder> list,int id ) {
        this.context = context;
        this.a = a;
        this.list = list;
        this.idUser = id;
    }
    public DonHangAdapter(Context context,Activity a,CheckBox chAll,int tongTien, List<DetailOrder> list,int id ) {
        this.context = context;
        this.a = a;
        this.cbAll = cbAll;
        this.tongTien =tongTien;
        this.list = list;
        this.idUser = id;
    }
    @NonNull
    @Override
    public DonHangAdapter.ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //Set layout cho adapter để hiển thị lên list
        View view = LayoutInflater.from(context).inflate(R.layout.one_donhang, parent, false);
        return new DonHangAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DonHangAdapter.ViewHolder holder, int position) {
        //Trả về 1 item tại vị trí position(vị trí hiện tại theo list)
        DetailOrder gh = list.get(position);
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        holder.name.setText(gh.proName.toString());
        String[] ha= gh.avatar.toString().split("\\.");
        holder.imageView.setImageResource(context.getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));
        holder.price.setText(String.valueOf(formatter.format(gh.proPrice))+" VND");
        holder.sl.setText("Số lượng :"+ String.valueOf(gh.orderQuantity));

        holder.del.setOnClickListener(view -> {
            a.finish();
            Intent intent = new Intent(context, DonHang.class);
            intent.putExtra("idUser","000"+"," + idUser);
            context.startActivity(intent);
        });
    }
    @Override
    public int getItemCount() {
        return list.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView, del;
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
            del = itemView.findViewById(R.id.iv_del);
            view = itemView;

        }
    }
}
