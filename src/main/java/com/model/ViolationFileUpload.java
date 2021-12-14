package com.model;

import org.springframework.web.multipart.MultipartFile;

/**
 *违章材料上传参数映射类
 * @author hzf 2021/12/14
 */
public class ViolationFileUpload {
    /**
     * 违章记录编号
     */
    private int violationId;
    /**
     * 上传的违章证明材料
     */
    private MultipartFile proveMaterial;

    public int getViolationId() {
        return violationId;
    }

    public void setViolationId(int violationId) {
        this.violationId = violationId;
    }

    public MultipartFile getProveMaterial() {
        return proveMaterial;
    }

    public void setProveMaterial(MultipartFile proveMaterial) {
        this.proveMaterial = proveMaterial;
    }
}
