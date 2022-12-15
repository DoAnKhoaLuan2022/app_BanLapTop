package com.example.do_an_android.Model;

import java.io.Serializable;
import java.util.ArrayList;

public class Product  implements Serializable{
    public String id;
    public String Name;
    public int quanlity;
    public  int purchase;
    public  int price;
    public  int trademark_id;
    public String avatar;
    public int productType_id;
    public int view;

    public Product() {
    }

    public Product(String id, String name, int quanlity, int purchase, int price, int trademark_id, String avatar, int productType_id, int view) {
        this.id = id;
        Name = name;
        this.quanlity = quanlity;
        this.purchase = purchase;
        this.price = price;
        this.trademark_id = trademark_id;
        this.avatar = avatar;
        this.productType_id = productType_id;
        this.view = view;
    }

    public Product(String id, String name, int quanlity) {
        this.id = id;
        Name = name;
        this.quanlity = quanlity;
    }
}
