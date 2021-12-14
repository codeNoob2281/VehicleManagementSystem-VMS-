package com.service;

import com.po.Violation;

import java.util.List;

/**
 * 违章处理服务接口类
 * @author hzf 2021/12/13
 */
public interface ViolationService {

    /**
     * 查找所有违章信息
     * @param personId 用户编号
     * @return 违章信息列表
     */
    public List<Violation> findAllViolations(String personId);

    /**
     * 上传违章处理证明材料
     * @param violationId 违章记录编号
     * @param bytes 违规材料字节流
     * @return 上传结果
     */
    public boolean submitMaterial(int violationId,byte[] bytes);

    /**
     * 检查查勘员借车许可
     * @param surveyorId 查勘员id
     * @return 是否可借车
     */
    public boolean checkCarReqPermission(String surveyorId);

    /**
     * 查找所有未处理/处理中违章信息
     * @param personId 相关人员id
     * @return 未处理/处理中违章信息列表
     */
    public List<Violation> findAllUnfinishedViolations(String personId);


}
