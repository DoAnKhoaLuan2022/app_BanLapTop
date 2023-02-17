package com.example.do_an_android.Adapter;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Filter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.do_an_android.Activity.DetailAccessory;
import com.example.do_an_android.Activity.DetailActivity;
import com.example.do_an_android.Model.Product;
import com.example.do_an_android.R;

import java.lang.reflect.Array;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

public class SanPhamAdapter extends RecyclerView.Adapter<SanPhamAdapter.ViewHolder> {
    private Context context;
    private List<Product> list;
    int idUser;
    List<Product> listSort;
    Filter filter;
    NumberFormat format = NumberFormat.getCurrencyInstance();

    public SanPhamAdapter() {
    }
    public SanPhamAdapter(Context context, List<Product> list) {
        this.context = context;
        this.list = list;
        this.listSort = list;
    }
    public SanPhamAdapter(Context context, List<Product> list,int idUser) {
        this.context = context;
        this.list = list;
        this.idUser=idUser;
        this.listSort = list;
    }

    @NonNull
    @Override
    public ViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        //Set layout cho adapter để hiển thị lên list
        View view = LayoutInflater.from(context).inflate(R.layout.one_item, parent, false);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull ViewHolder holder, int position) {
        //Trả về 1 item tại vị trí position(vị trí hiện tại theo list)
        Product sp = list.get(position);
        String[] ha= sp.avatar.toString().split("\\.");
        String[] ten = sp.id.toString().split("0");
        DecimalFormat formatter = new DecimalFormat("###,###,###");

        //Set tiêu đề
        String name = sp.Name.toString();
        if(name.length()>=30)
        {
            name = sp.Name.toString().substring(0,30).toString()+"...";
        }
        holder.name.setText(name);
        holder.Price.setText(String.valueOf(formatter.format(sp.price))+" VND");
        holder.imageView.setImageResource(context.getResources().getIdentifier(ha[0],"drawable","com.example.do_an_android"));;
        //Bắt sự kiện khi click vào một item
        holder.view.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if(ten[0].equals("LAP"))
                {
                    Intent intent = new Intent(context, DetailActivity.class);
                //Truyền toàn bộ data sang

                    intent.putExtra("detailProduct", "https://nam1612it.bsite.net/api/details?id="+ sp.id + ","+ idUser);
                    context.startActivity(intent);
                }
                else
                {
                    Intent intent = new Intent(context, DetailAccessory.class);
                    intent.putExtra("detailAccessory", "https://nam1612it.bsite.net/accessory/"+ sp.id + ","+ idUser);
                    context.startActivity(intent);
                }
            }
        });
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        ImageView imageView;
        TextView name, Price;
        View view;

        public ViewHolder(@NonNull View itemView) {
            super(itemView);
            //Khai báo id theo itemView
            imageView = itemView.findViewById(R.id.ivNewsList);
            name = itemView.findViewById(R.id.one_name);
            Price = itemView.findViewById(R.id.one_price);
            view = itemView;
        }
    }

    public void resetData() {
        list = listSort;
    }

    public Filter getFilter() {
        if (filter == null)
            filter = new CustomFilter();
        return filter;
    }

    private class CustomFilter extends Filter {
        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            FilterResults results = new FilterResults();
            // We implement here the filter logic
            if (constraint == null || constraint.length() == 0) {
                results.values = listSort;
                results.count = listSort.size();
            } else {
                ArrayList<Product> findItem = new ArrayList<>();
                for (Product p : list) {
                    if (p.Name.toUpperCase().contains(constraint.toString().toUpperCase()))
                        findItem.add(p);
                }
                results.values = findItem;
                results.count = findItem.size();
            }
            return results;
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            if (results.count == 0) {
            } else {
                list = (List<Product>) results.values;
                notifyDataSetChanged();
            }
        }
    }
}
