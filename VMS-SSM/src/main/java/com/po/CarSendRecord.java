package com.po;

import java.util.Date;


/**
 * 车辆使用记录实体类
 * @author hzf 2021/12/13
 */
public class CarSendRecord {
    /**
     * 记录编号
     */
    private Integer id;
    /**
     * 车牌号
     */
    private String licencePlate;
    /**
     * 借出时间
     */
    private Date outTime;
    /**
     * 归还时间
     */
    private Date backTime;
    /**
     * 目的地x坐标
     */
    private Integer destX;
    /**
     * 目的地y坐标
     */
    private Integer destY;
    /**
     * 车辆使用者
     */
    private String surveyorId;
    /**
     * 车辆使用时间
     */
    private Double useTime;
    /**
     * 车辆请求及运行状态
     */
    private String requestState;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLicencePlate() {
        return licencePlate;
    }

    public void setLicencePlate(String licencePlate) {
        this.licencePlate = licencePlate;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public Date getBackTime() {
        return backTime;
    }

    public void setBackTime(Date backTime) {
        this.backTime = backTime;
    }

    public Integer getDestX() {
        return destX;
    }

    public void setDestX(Integer destX) {
        this.destX = destX;
    }

    public Integer getDestY() {
        return destY;
    }

    public void setDestY(Integer destY) {
        this.destY = destY;
    }

    public String getSurveyorId() {
        return surveyorId;
    }

    public void setSurveyorId(String surveyorId) {
        this.surveyorId = surveyorId;
    }

    public Double getUseTime() {
        return useTime;
    }

    public void setUseTime(Double useTime) {
        this.useTime = useTime;
    }

    public String getRequestState() {
        return requestState;
    }

    public void setRequestState(String requestState) {
        this.requestState = requestState;
    }
}
