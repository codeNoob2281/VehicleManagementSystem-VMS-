package com.dao;

import com.po.Violation;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 违章Dao类
 * @author hzf 2021/12/13
 */
@Mapper
public interface ViolationDao {

    /**
     * 查询所有违章记录
     * @param personId 相关人员id
     * @return 所有违章记录列表
     */
    public List<Violation> selectViolationByPersonId(String personId);

    /**
     *更新违章材料
     * @param  violation 违规实体类
     * @return 影响行数
     */
    public int updateMaterialAndStateById(Violation violation);

    /**
     * 查询所有未处理/处理中违章记录
     * @param personId 相关人员id
     * @return 未处理/处理中违章记录列表
     */
    public List<Violation> selectUnfinishedViolationByPersonId(String personId);

}
