package com.example.do_an_android.Model;

import java.io.Serializable;

public class DetailOrder implements Serializable {
    public int DeOrderID;
    public int orderID;
    public String proID;
    public String proName;
    public String orderAddress;
    public int proPrice;
    public int orderQuantity;
    public String avatar;
    public String orderStatus;
    public int orderMoney;

    public DetailOrder(int deOrderID, int orderID, String proID, String proName, String orderAddress, int proPrice, int orderQuantity, String avatar, String orderStatus, int orderMoney, int cusID) {
        DeOrderID = deOrderID;
        this.orderID = orderID;
        this.proID = proID;
        this.proName = proName;
        this.orderAddress = orderAddress;
        this.proPrice = proPrice;
        this.orderQuantity = orderQuantity;
        this.avatar = avatar;
        this.orderStatus = orderStatus;
        this.orderMoney = orderMoney;
        this.cusID = cusID;
    }

    public DetailOrder(int deOrderID, int orderID, String proID, String orderAddress, int proPrice, int orderQuantity, int orderMoney, int cusID) {
        DeOrderID = deOrderID;
        this.orderID = orderID;
        this.proID = proID;
        this.orderAddress = orderAddress;
        this.proPrice = proPrice;
        this.orderQuantity = orderQuantity;
        this.orderMoney = orderMoney;
        this.cusID = cusID;
    }

    public int getDeOrderID() {
        return DeOrderID;
    }

    public void setDeOrderID(int deOrderID) {
        DeOrderID = deOrderID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public int getProPrice() {
        return proPrice;
    }

    public void setProPrice(int proPrice) {
        this.proPrice = proPrice;
    }

    public int getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(int orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public int getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(int orderMoney) {
        this.orderMoney = orderMoney;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public int cusID;

}
