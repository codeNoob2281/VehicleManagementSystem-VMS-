package com.Service;

import com.dao.DaoException;
import com.dao.ViolationDao;
import com.dao.ViolationDaoImpl;
import com.model.Violation;

import java.util.ArrayList;
import java.util.List;

public class ViolationService {

    /**
     * 按工作人员工号查找所有违章记录
     * @param personId,表示查勘员或管理员id
     * @return 违章历史记录列表
     */
    public List<Violation> findAllVioHistory(String personId){
        List<Violation> violationList=new ArrayList<>();
        ViolationDao violationDao=new ViolationDaoImpl();
        try{
            violationList=violationDao.SelectViolationByPersonId(personId);
        }catch (DaoException e){
            e.printStackTrace();
        }
        return violationList;
    }

    /**
     * 提交材料到数据库
     * @param violationId
     * @return
     */
    public boolean submitMaterial(int violationId){
        ViolationDao violationDao=new ViolationDaoImpl();
        try{
            if(violationDao.updateMaterialAndStateById(violationId)) return true;
        }catch (DaoException e){
            e.printStackTrace();
        }
        return false;
    }

}
