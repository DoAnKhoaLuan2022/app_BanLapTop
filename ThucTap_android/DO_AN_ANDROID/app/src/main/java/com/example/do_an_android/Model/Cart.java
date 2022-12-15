package com.example.do_an_android.Model;

import java.io.Serializable;

public class Cart implements Serializable {
//    int idcart;
//    String nameproduct;
//    int price;
//    int sum;
//    int totalprice;
//
//    public String getHinh() {
//        return hinh;
//    }
//
//    public void setHinh(String hinh) {
//        this.hinh = hinh;
//    }
//
//    String hinh;
//
//
//    public cart(int idcart, String nameproduct, int price, int sum, int totalprice, String hinh) {
//        this.idcart = idcart;
//        this.nameproduct = nameproduct;
//        this.price = price;
//        this.sum = sum;
//        this.totalprice = totalprice;
//        this.hinh = hinh;
//    }
//
//    public int getIdcart() {
//        return idcart;
//    }
//
//    public void setIdcart(int idcart) {
//        this.idcart = idcart;
//    }
//
//    public String getNameproduct() {
//        return nameproduct;
//    }
//
//    public void setNameproduct(String nameproduct) {
//        this.nameproduct = nameproduct;
//    }
//
//    public int getPrice() {
//        return price;
//    }
//
//    public void setPrice(int price) {
//        this.price = price;
//    }
//
//    public int getSum() {
//        return sum;
//    }
//
//    public void setSum(int sum) {
//        this.sum = sum;
//    }
//
//    public int getTotalprice() {
//        return totalprice;
//    }
//
//    public void setTotalprice(int totalprice) {
//        this.totalprice = totalprice;
//    }
//
//    public cart() {
//    }

    public int cartID;
    public String proID;
    public String proName;
    public int proPrice;
    public int CartQuantity;
    public int CartMoney;
    public String avatar;
    public int cusID;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int status;

    public Cart(int cartID, String proID, int proPrice, int cartQuantity, int cartMoney, int cusID, int status) {
        this.cartID = cartID;
        this.proID = proID;
        this.proPrice = proPrice;
        CartQuantity = cartQuantity;
        CartMoney = cartMoney;
        this.cusID = cusID;
        this.status = status;
    }

    public Cart(int cartID, String proID, String proName, int proPrice, int cartQuantity, int cartMoney, String avatar, int cusID, int status) {
        this.cartID = cartID;
        this.proID = proID;
        this.proName = proName;
        this.proPrice = proPrice;
        CartQuantity = cartQuantity;
        CartMoney = cartMoney;
        this.avatar = avatar;
        this.cusID = cusID;
        this.status = status;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public String getProID() {
        return proID;
    }

    public void setProID(String proID) {
        this.proID = proID;
    }

    public int getProPrice() {
        return proPrice;
    }

    public void setProPrice(int proPrice) {
        this.proPrice = proPrice;
    }

    public int getCartQuantity() {
        return CartQuantity;
    }

    public void setCartQuantity(int cartQuantity) {
        CartQuantity = cartQuantity;
    }

    public int getCartMoney() {
        return CartMoney;
    }

    public void setCartMoney(int cartMoney) {
        CartMoney = cartMoney;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }


}