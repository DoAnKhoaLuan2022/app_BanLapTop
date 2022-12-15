package com.example.do_an_android.Model;

import java.io.Serializable;

public class DetailProduct implements Serializable {
    public int id;
    public String product_id;
    public String CPU;
    public String SoNhan;
    public String SoLuong;
    public String Speed;
    public String MaxSpeed;
    public String Cache;
    public String RAM;
    public String RAM_type;
    public String BusRAM;
    public String MaxRAM;
    public String OCung;
    public String ManHinh;
    public String DoPhanGiai;
    public String TanSoQuet;
    public String CongNgheManHinh;
    public String VGA;
    public String AmThanh;
    public String CongGiaoTiep;
    public String KetNoiKhongDay ;
    public String Webcam;
    public String TinhNangKhac;
    public String DenBanPhim;
    public String SizeAndWeight;
    public String ChatLieu;
    public String Pin;
    public String HeDieuHanh ;
    public String RaMat ;

    public DetailProduct() {
    }

    public DetailProduct(int id, String product_id, String CPU,
                         String soNhan, String soLuong, String speed, String maxSpeed,
                         String cache, String RAM, String RAM_type, String busRAM, String maxRAM,
                         String OCung, String manHinh, String doPhanGiai, String tanSoQuet,
                         String congNgheManHinh, String VGA, String amThanh, String congGiaoTiep,
                         String ketNoiKhongDay, String webcam, String tinhNangKhac, String denBanPhim,
                         String sizeAndWeight, String chatLieu, String pin, String heDieuHanh,
                         String raMat) {
        this.id = id;
        this.product_id = product_id;
        this.CPU = CPU;
        SoNhan = soNhan;
        SoLuong = soLuong;
        Speed = speed;
        MaxSpeed = maxSpeed;
        Cache = cache;
        this.RAM = RAM;
        this.RAM_type = RAM_type;
        BusRAM = busRAM;
        MaxRAM = maxRAM;
        this.OCung = OCung;
        ManHinh = manHinh;
        DoPhanGiai = doPhanGiai;
        TanSoQuet = tanSoQuet;
        CongNgheManHinh = congNgheManHinh;
        this.VGA = VGA;
        AmThanh = amThanh;
        CongGiaoTiep = congGiaoTiep;
        KetNoiKhongDay = ketNoiKhongDay;
        Webcam = webcam;
        TinhNangKhac = tinhNangKhac;
        DenBanPhim = denBanPhim;
        SizeAndWeight = sizeAndWeight;
        ChatLieu = chatLieu;
        Pin = pin;
        HeDieuHanh = heDieuHanh;
        RaMat = raMat;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getCPU() {
        return CPU;
    }

    public void setCPU(String CPU) {
        this.CPU = CPU;
    }

    public String getSoNhan() {
        return SoNhan;
    }

    public void setSoNhan(String soNhan) {
        SoNhan = soNhan;
    }

    public String getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(String soLuong) {
        SoLuong = soLuong;
    }

    public String getSpeed() {
        return Speed;
    }

    public void setSpeed(String speed) {
        Speed = speed;
    }

    public String getMaxSpeed() {
        return MaxSpeed;
    }

    public void setMaxSpeed(String maxSpeed) {
        MaxSpeed = maxSpeed;
    }

    public String getCache() {
        return Cache;
    }

    public void setCache(String cache) {
        Cache = cache;
    }

    public String getRAM() {
        return RAM;
    }

    public void setRAM(String RAM) {
        this.RAM = RAM;
    }

    public String getRAM_type() {
        return RAM_type;
    }

    public void setRAM_type(String RAM_type) {
        this.RAM_type = RAM_type;
    }

    public String getBusRAM() {
        return BusRAM;
    }

    public void setBusRAM(String busRAM) {
        BusRAM = busRAM;
    }

    public String getMaxRAM() {
        return MaxRAM;
    }

    public void setMaxRAM(String maxRAM) {
        MaxRAM = maxRAM;
    }

    public String getOCung() {
        return OCung;
    }

    public void setOCung(String OCung) {
        this.OCung = OCung;
    }

    public String getManHinh() {
        return ManHinh;
    }

    public void setManHinh(String manHinh) {
        ManHinh = manHinh;
    }

    public String getDoPhanGiai() {
        return DoPhanGiai;
    }

    public void setDoPhanGiai(String doPhanGiai) {
        DoPhanGiai = doPhanGiai;
    }

    public String getTanSoQuet() {
        return TanSoQuet;
    }

    public void setTanSoQuet(String tanSoQuet) {
        TanSoQuet = tanSoQuet;
    }

    public String getCongNgheManHinh() {
        return CongNgheManHinh;
    }

    public void setCongNgheManHinh(String congNgheManHinh) {
        CongNgheManHinh = congNgheManHinh;
    }

    public String getVGA() {
        return VGA;
    }

    public void setVGA(String VGA) {
        this.VGA = VGA;
    }

    public String getAmThanh() {
        return AmThanh;
    }

    public void setAmThanh(String amThanh) {
        AmThanh = amThanh;
    }

    public String getCongGiaoTiep() {
        return CongGiaoTiep;
    }

    public void setCongGiaoTiep(String congGiaoTiep) {
        CongGiaoTiep = congGiaoTiep;
    }

    public String getKetNoiKhongDay() {
        return KetNoiKhongDay;
    }

    public void setKetNoiKhongDay(String ketNoiKhongDay) {
        KetNoiKhongDay = ketNoiKhongDay;
    }

    public String getWebcam() {
        return Webcam;
    }

    public void setWebcam(String webcam) {
        Webcam = webcam;
    }

    public String getTinhNangKhac() {
        return TinhNangKhac;
    }

    public void setTinhNangKhac(String tinhNangKhac) {
        TinhNangKhac = tinhNangKhac;
    }

    public String getDenBanPhim() {
        return DenBanPhim;
    }

    public void setDenBanPhim(String denBanPhim) {
        DenBanPhim = denBanPhim;
    }

    public String getSizeAndWeight() {
        return SizeAndWeight;
    }

    public void setSizeAndWeight(String sizeAndWeight) {
        SizeAndWeight = sizeAndWeight;
    }

    public String getChatLieu() {
        return ChatLieu;
    }

    public void setChatLieu(String chatLieu) {
        ChatLieu = chatLieu;
    }

    public String getPin() {
        return Pin;
    }

    public void setPin(String pin) {
        Pin = pin;
    }

    public String getHeDieuHanh() {
        return HeDieuHanh;
    }

    public void setHeDieuHanh(String heDieuHanh) {
        HeDieuHanh = heDieuHanh;
    }

    public String getRaMat() {
        return RaMat;
    }

    public void setRaMat(String raMat) {
        RaMat = raMat;
    }



}
