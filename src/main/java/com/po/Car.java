package com.po;

/**
 * 车辆信息实体类
 * @author hzf 2021/12/13
 */
public class Car {
    /**
     * 车牌号
     */
    private String licencePlate;
    /**
     * 车辆状态(空闲中/使用中/维护中)
     */
    private String carState;
    /**
     * 车辆所在地区编号
     */
    private String number;
    /**
     * 车辆使用总时间
     */
    private Double totalTime;

    public String getLicencePlate() {
        return licencePlate;
    }

    public void setLicencePlate(String licencePlate) {
        this.licencePlate = licencePlate;
    }

    public String getCarState() {
        return carState;
    }

    public void setCarState(String carState) {
        this.carState = carState;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public Double getTotalTime() {
        return totalTime;
    }

    public void setTotalTime(Double totalTime) {
        this.totalTime = totalTime;
    }
}
