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

public class GioHangAdapter extends RecyclerView.Adapter<GioHangAdapter.ViewHolder> {
    private Context context;
    private Activity a;
    private List<Cart> list;
    int i=0;
    CheckBox cbAll;
    int tongTien;
    int idUser;
    String idCartThanhToan ="";
    NumberFormat format = NumberFormat.getCurrencyInstance();

    public GioHangAdapter(Context context, List<Cart> list,int id ) {
        this.context = context;
        this.list = list;
        this.idUser = id;
    }
    public GioHangAdapter(Context context,Activity a, List<Cart> list,int id ) {
        this.context = context;
        this.a = a;
        this.list = list;
        this.idUser = id;
    }
    public GioHangAdapter(Context context,Activity a,CheckBox cbAll,int tongTien, List<Cart> list,int id ) {
        this.context = context;
        this.a = a;
        this.cbAll = cbAll;
        this.tongTien =tongTien;
        this.list = list;
        this.idUser = id;
    }
    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //Set layout cho adapter để hiển thị lên list
        View view = LayoutInflater.from(context).inflate(R.layout.one_giohang, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        //Trả về 1 item tại vị trí position(vị trí hiện tại theo list)
        Cart gh = list.get(position);
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        holder.name.setText(gh.proName.toString());
        String[] ha= gh.avatar.toString().split("\\.");
        holder.imageView.setImageResource(context.getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));
        holder.price.setText(String.valueOf(formatter.format(gh.proPrice))+" VND");
        holder.sl.setText(String.valueOf(gh.getCartQuantity()));

        holder.del.setOnClickListener(view -> {
           deleteGioHang(gh.cartID);
            a.finish();
            Intent intent = new Intent(context, GioHang.class);
            intent.putExtra("idUser","000"+"," + idUser);
            context.startActivity(intent);
        });
        holder.update.setOnClickListener(view -> {
            upDateGioHang(gh.cartID,Integer.parseInt(holder.sl.getText().toString().trim()));
            a.finish();
            Intent intent = new Intent(context, GioHang.class);
            intent.putExtra("idUser","000"+"," + idUser);
            context.startActivity(intent);
        });
        if(gh.status==1)
        {
            holder.cbItem.setChecked(true);
        }else{
            holder.cbItem.setChecked(false);
        }
        holder.cbItem.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton compoundButton, boolean b) {
                if(holder.cbItem.isChecked()==false)
                {
                    updateStatus0(gh.cartID);
                    a.finish();
                    Intent intent = new Intent(context, GioHang.class);
                    intent.putExtra("idUser","000"+"," + idUser);
                    context.startActivity(intent);
                }
                else {
                    updateStatus1(gh.cartID);
                    a.finish();
                    Intent intent = new Intent(context, GioHang.class);
                    intent.putExtra("idUser","000"+"," + idUser);
                    context.startActivity(intent);
                }
            }
        });
    }

    public void updateStatus1(int id)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/updateStatus1/"+String.valueOf(id)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
    }
    public void updateStatus0(int id)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/updateStatus0/"+String.valueOf(id)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
    }
    public void deleteGioHang(int id)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/deletecart/"+String.valueOf(id)).delete()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
        Toast.makeText(context,"Xóa thành công !",Toast.LENGTH_LONG).show();
    }
    public void upDateGioHang(int id, int sl)
    {

        OkHttpClient client = new OkHttpClient();

        // Khởi tạo Moshi adapter để biến đổi json sang model java (ở đây là User)
        Moshi moshi = new Moshi.Builder().build();
        Request.Builder builder = new Request.Builder();
        // Tạo request lên server.
        // Delete
        Request request = builder
                .url("https://nam1612it.bsite.net/updateCart/"+String.valueOf(id)+"/"+String.valueOf(sl)).get()
                .build();
        // Thực thi request.
        client.newCall(request).enqueue(new Callback() {
            @Override
            public void onFailure(Call call, IOException e) {

            }

            @Override
            public void onResponse(Call call, Response response) throws IOException {

            }
        });
        Toast.makeText(context,"Cập nhật thành công !",Toast.LENGTH_LONG).show();
    }
    @Override
    public int getItemCount() {
        return list.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView, del, update;
        TextView name, price;
        CheckBox cbItem;
        EditText sl;
        View view;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            //Khai báo id theo itemView
            imageView = itemView.findViewById(R.id.ivNewsList);
            name = itemView.findViewById(R.id.one_name);
            price = itemView.findViewById(R.id.one_price);
            sl = itemView.findViewById(R.id.one_sl);
            del = itemView.findViewById(R.id.iv_del);
            update = itemView.findViewById(R.id.iv_update);
            cbItem = itemView.findViewById(R.id.cbItemCart);
            view = itemView;

        }
    }


}