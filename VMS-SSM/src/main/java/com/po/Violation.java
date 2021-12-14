package com.po;

import java.sql.Blob;
import java.util.Date;

/**
 * 违章信息
 * @author hzf 2021/12/13
 */
public class Violation {
    /**
     * 违章记录编号
     */
    private Integer id;
    /**
     * 违章车牌
     */
    private String  licencePlate;
    /**
     * 违章地点
     */
    private String illegalSites;
    /**
     * 违章时间
     */
    private Date time;
    /**
     * 违章内容
     */
    private String content;
    /**
     * 违章负责人
     */
    private String personId;
    /**
     * 违章处理状态(未处理/材料不通过->处理中->已处理)
     */
    private String violationState;
    /**
     * 提交的审核材料???
     */
    private byte[] doMaterial;

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

    public String getIllegalSites() {
        return illegalSites;
    }

    public void setIllegalSites(String illegalSites) {
        this.illegalSites = illegalSites;
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

    public String getViolationState() {
        return violationState;
    }

    public void setViolationState(String violationState) {
        this.violationState = violationState;
    }

    public byte[] getDoMaterial() {
        return doMaterial;
    }

    public void setDoMaterial(byte[] doMaterial) {
        this.doMaterial = doMaterial;
    }
}
