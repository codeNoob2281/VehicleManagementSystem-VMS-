package com.dao;

import com.model.Violation;

import java.sql.Blob;
import java.util.List;

public interface ViolationDao extends BaseDao{
    /**
     * 按人员查找违规记录
     * @param personId
     * @return 违规记录List
     * @throws DaoException
     */
    public List<Violation> SelectViolationByPersonId(String personId) throws DaoException;

    /**
     * 将提交的材料存入数据库并修改处理状态:未处理->处理中
     * @param uid
     * @return
     * @throws DaoException
     */
    public boolean updateMaterialAndStateById(int uid) throws DaoException;
}
