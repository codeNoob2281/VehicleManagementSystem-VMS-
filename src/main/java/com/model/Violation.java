package com.model;

import java.sql.Blob;
import java.util.Date;
/*违章记录信息*/
public class Violation {
    private int id;//违章记录编号
    private String carNum;//违章车牌
    private String location;//违章地点
    private Date time;//违章时间
    private String content;//违章内容
    private String personId;//违章负责人
    private String statue;//违章处理状态(未处理/材料不通过->处理中->已处理)
    private Blob material;//提交的审核材料

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCarNum() {
        return carNum;
    }

    public void setCarNum(String carNum) {
        this.carNum = carNum;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPersonId() {
        return personId;
    }

    public void setPersonId(String personId) {
        this.personId = personId;
    }

    public String getStatue() {
        return statue;
    }

    public void setStatue(String statue) {
        this.statue = statue;
    }

    public Blob getMaterial() {
        return material;
    }

    public void setMaterial(Blob material) {
        this.material = material;
    }
}
