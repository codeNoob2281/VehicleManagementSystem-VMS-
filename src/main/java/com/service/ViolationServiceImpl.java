package com.service;

import com.dao.ViolationDao;
import com.po.Violation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

/**
 * 违章处理服务接口类
 * @author hzf 2021/12/13
 */
@Service("violationService")
public class ViolationServiceImpl implements ViolationService {

    @Autowired
    private ViolationDao violationDao;


    /**
     * 查找所有违章信息
     * @param personId 用户编号
     * @return 违章信息列表
     */
    @Override
    public List<Violation> findAllViolations(String personId) {
        return violationDao.selectViolationByPersonId(personId);
    }

    /**
     * 上传违章处理证明材料
     * @param violationId 违章记录编号
     * @param bytes 违规材料字节流
     * @return 上传结果
     */
    @Override
    public boolean submitMaterial(int violationId, byte[] bytes) {
        Violation violation=new Violation();
        violation.setId(violationId);
        //设置材料文件字节流
        violation.setDoMaterial(bytes);
         int result=violationDao.updateMaterialAndStateById(violation);
         return (result>0);
        }
    /**
     * 检查查勘员借车许可
     * @param surveyorId 查勘员id
     * @return 是否可借车
     */
    @Override
    public boolean checkCarReqPermission(String surveyorId) {
        List<Violation> list=violationDao.selectUnfinishedViolationByPersonId(surveyorId);
        if(list.size()!=0){
            return false;
        }
        return true;
    }
    /**
     * 查找所有未处理/处理中违章信息
     * @param personId 相关人员id
     * @return 未处理/处理中违章信息列表
     */
    @Override
    public List<Violation> findAllUnfinishedViolations(String personId) {
        return violationDao.selectUnfinishedViolationByPersonId(personId);
    }
}



