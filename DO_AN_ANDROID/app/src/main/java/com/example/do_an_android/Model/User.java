package com.example.do_an_android.Model;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable
{
    public int cusID ;
    public String cusName ;
    public String cusEmail ;
    public String cusPhone ;
    public String cusPassword;
    public String cusAddress ;
    public int cusType ;
    public int cusStatus;

    public User(int cusID, String cusName, String cusEmail, String cusPhone, String cusPassword, String cusAddress, int cusType, int cusStatus, String cusPhoto) {
        this.cusID = cusID;
        this.cusName = cusName;
        this.cusEmail = cusEmail;
        this.cusPhone = cusPhone;
        this.cusPassword = cusPassword;
        this.cusAddress = cusAddress;
        this.cusType = cusType;
        this.cusStatus = cusStatus;
        this.cusPhoto = cusPhoto;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public String getCusEmail() {
        return cusEmail;
    }

    public void setCusEmail(String cusEmail) {
        this.cusEmail = cusEmail;
    }

    public String getCusPhone() {
        return cusPhone;
    }

    public void setCusPhone(String cusPhone) {
        this.cusPhone = cusPhone;
    }

    public String getCusPassword() {
        return cusPassword;
    }

    public void setCusPassword(String cusPassword) {
        this.cusPassword = cusPassword;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public int getCusType() {
        return cusType;
    }

    public void setCusType(int cusType) {
        this.cusType = cusType;
    }

    public int getCusStatus() {
        return cusStatus;
    }

    public void setCusStatus(int cusStatus) {
        this.cusStatus = cusStatus;
    }

    public String getCusPhoto() {
        return cusPhoto;
    }

    public void setCusPhoto(String cusPhoto) {
        this.cusPhoto = cusPhoto;
    }

    public String cusPhoto;

    public User() {
    }
}
