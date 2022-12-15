package com.example.do_an_android.Model;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class Order implements Serializable {

    public int orderID;
    public String dateNow;
    public Date orderDate;
    public String orderStatus;
    public int empID;
    public int cusID;


    public static String getCurrentDate() {
        SimpleDateFormat dateFormat = new SimpleDateFormat("MM-dd-YYYY HH-mm-ss");
        dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
        Date today = Calendar.getInstance().getTime();
        return dateFormat.format(today);
    }
    public Order(int orderID, int empID, int cusID) {
        this.orderID = orderID;
        this.dateNow = getCurrentDate();
        this.orderStatus ="Đang chờ xác nhận";
        this.empID = empID;
        this.cusID = cusID;
    }
    public Order(int orderID, Date orderDate, String orderStatus, int empID, int cusID) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.orderStatus ="Đang chờ xác nhận";
        this.empID = empID;
        this.cusID = cusID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }


}
