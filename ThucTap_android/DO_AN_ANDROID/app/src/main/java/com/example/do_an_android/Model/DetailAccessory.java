package com.example.do_an_android.Model;

import java.io.Serializable;

public class DetailAccessory implements Serializable {
    public int ac_ID;
    public String product_id;
    public String title;

    public int getAc_ID() {
        return ac_ID;
    }

    public void setAc_ID(int ac_ID) {
        this.ac_ID = ac_ID;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String content;

    public DetailAccessory() {
    }

    public DetailAccessory(int ac_ID, String product_id, String title, String content) {
        this.ac_ID = ac_ID;
        this.product_id = product_id;
        this.title = title;
        this.content = content;
    }
}
