package com.example.do_an_android.Adapter;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Activity.DonHang;
import com.example.do_an_android.Activity.HuyHang;
import com.example.do_an_android.Activity.Person;
import com.example.do_an_android.Activity.TraHang;
import com.example.do_an_android.Model.Cart;
import com.example.do_an_android.Model.DetailOrder;
import com.example.do_an_android.Model.User;
import com.example.do_an_android.R;
import com.squareup.moshi.JsonAdapter;
import com.squareup.moshi.Moshi;
import com.squareup.moshi.Types;

import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class DonHangAdapter extends RecyclerView.Adapter<DonHangAdapter.ViewHolder>{
    private Context context;
    private Activity a;
    private List<DetailOrder> list;
    CheckBox cbAll;
    int tongTien;
    int idUser;
    String trangThai;
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
    public DonHangAdapter(Context context,Activity a, List<DetailOrder> list,int id ,String tt) {
        this.context = context;
        this.a = a;
        this.list = list;
        this.idUser = id;
        this.trangThai =tt;
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
        //Set layout cho adapter ????? hi???n th??? l??n list
        View view = LayoutInflater.from(context).inflate(R.layout.one_donhang, parent, false);
        return new DonHangAdapter.ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull DonHangAdapter.ViewHolder holder, int position) {
        //Tr??? v??? 1 item t???i v??? tr?? position(v??? tr?? hi???n t???i theo list)
        DetailOrder gh = list.get(position);
        DecimalFormat formatter = new DecimalFormat("###,###,###");
        holder.name.setText(gh.proName.toString());
        String[] ha= gh.avatar.toString().split("\\.");
        holder.imageView.setImageResource(context.getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));
        holder.price.setText(String.valueOf(formatter.format(gh.proPrice))+" VND");
        holder.sl.setText("S??? l?????ng :"+ String.valueOf(gh.orderQuantity));
        holder.madh.setText(String.valueOf(gh.orderID));
        holder.tv_slban.setText(String.valueOf(gh.orderQuantity));
        holder.tv_tt.setText(gh.orderStatus);

        if(trangThai.equals("??ang l???y h??ng"))
        {
            holder.btn.setVisibility(View.INVISIBLE);
            holder.btnTra.setVisibility(View.INVISIBLE);
        }
        else if(trangThai.equals("???? giao h??ng"))
        {
            holder.btn.setVisibility(View.VISIBLE);
            holder.btn.setText("???? nh???n");
            holder.btnTra.setVisibility(View.VISIBLE);
        }
        else if(trangThai.equals("??ang ch??? x??c nh???n"))
        {
            holder.btn.setVisibility(View.VISIBLE);
            holder.btnTra.setVisibility(View.INVISIBLE);
        }
        else if(trangThai.equals("Giao h??ng th??nh c??ng"))
        {
            holder.btn.setVisibility(View.INVISIBLE);
            holder.btnTra.setVisibility(View.INVISIBLE);
        }else if(trangThai.equals("Tr??? h??ng"))
        {
            holder.btn.setVisibility(View.VISIBLE);
            holder.btn.setText("???? nh???n");
            holder.btnTra.setVisibility(View.INVISIBLE);
        }
        else if(trangThai.equals("???? h???y"))
        {
            holder.btn.setVisibility(View.INVISIBLE);
            holder.btnTra.setVisibility(View.INVISIBLE);
        }
        holder.del.setOnClickListener(view -> {
            a.finish();
            Intent intent = new Intent(context, DonHang.class);
            intent.putExtra("idUser","000"+"," + idUser);
            context.startActivity(intent);
        });
        if(holder.btn.getText().toString().equals("H???y h??ng"))
        {
            holder.btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    a.finish();
                    Intent intent = new Intent(context, HuyHang.class);
                    intent.putExtra("idUser",String.valueOf(gh.orderID)+"," + idUser);
                    context.startActivity(intent);
                }
            });
        }
        else if(holder.btn.getText().toString().equals("???? nh???n"))
        {
            holder.btn.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    OkHttpClient client = new OkHttpClient();
                    Moshi moshi = new Moshi.Builder().build();
                    Type usersType = Types.newParameterizedType(List.class, User.class);
                    final JsonAdapter<List<User>> jsonAdapter = moshi.adapter(usersType);
                    okhttp3.Request request = new Request.Builder()
                            .url("https://nam1612it.bsite.net/updateOrderComplete/"+String.valueOf(gh.orderID)).get()
                            .build();
                    // Th???c thi request.
                    client.newCall(request).enqueue(new Callback() {
                        @Override
                        public void onFailure(Call call, IOException e) {
                            Log.e("Error", "Network Error");
                        }
                        @Override
                        public void onResponse(Call call, Response response) throws IOException {
                            // L???y th??ng tin JSON tr??? v???. B???n c?? th??? log l???i bi???n json n??y ????? xem n?? nh?? th??? n??o.
                            String json = response.body().string();

                        }
                    });
                    Toast.makeText(context, "Ho??n th??nh ????n h??ng", Toast.LENGTH_SHORT).show();
                    a.finish();
                    Intent intent = new Intent(context, DonHang.class);
                    intent.putExtra("url","https://nam1612it.bsite.net/selectDetailOrderDaGiao/"+String.valueOf(idUser)+ "," + String.valueOf(idUser)+","+"???? giao h??ng");
                    context.startActivity(intent);
                }
            });
        }
        holder.btnTra.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                a.finish();
                Intent intent = new Intent(context, TraHang.class);
                intent.putExtra("idUser",String.valueOf(gh.orderID)+"," + idUser);
                context.startActivity(intent);
            }
        });
    }
    @Override
    public int getItemCount() {
        return list.size();
    }
    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView, del;
        TextView name, price;
        TextView sl, madh,tv_slban,tv_tt;
        View view;
        Button btn,btnTra;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            //Khai b??o id theo itemView
            imageView = itemView.findViewById(R.id.ivNewsList);
            name = itemView.findViewById(R.id.one_name);
            price = itemView.findViewById(R.id.one_price);
            sl = itemView.findViewById(R.id.one_sl);
            madh = itemView.findViewById(R.id.tv_maDonHang);
            tv_slban =itemView.findViewById(R.id.tv_sl);
            tv_tt =itemView.findViewById(R.id.tv_tt);
            del = itemView.findViewById(R.id.iv_del);
            btn = itemView.findViewById(R.id.btnHuyHang);
            btnTra = itemView.findViewById(R.id.btnTraHang);

            view = itemView;

        }
    }
}
