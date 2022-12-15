package com.example.do_an_android.Model;

import java.io.Serializable;

public class Address implements Serializable {

    public int ID_address;
    public int cusID;
    public String Name_Address;

    public Address(int ID_address, int cusID, String name_Address) {
        this.ID_address = ID_address;
        this.cusID = cusID;
        Name_Address = name_Address;
    }

    public int getID_address() {
        return ID_address;
    }

    public void setID_address(int ID_address) {
        this.ID_address = ID_address;
    }

    public int getCusID() {
        return cusID;
    }

    public void setCusID(int cusID) {
        this.cusID = cusID;
    }

    public String getName_Address() {
        return Name_Address;
    }

    public void setName_Address(String name_Address) {
        Name_Address = name_Address;
    }
}
