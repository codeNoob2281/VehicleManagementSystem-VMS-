package com.model;
/*车辆信息*/
public class Car {
    private String carId;//车牌号
    private String status;//车辆状态(空闲中/使用中/维护中)
    private String pnumber;//车辆所在地区编号

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }


    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPnumber() {
        return pnumber;
    }

    public void setPnumber(String pnumber) {
        this.pnumber = pnumber;
    }
}
