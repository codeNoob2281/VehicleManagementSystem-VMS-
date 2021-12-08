package com.dao;

import com.model.Violation;
import com.stat.UserInfo;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ViolationDaoImpl implements ViolationDao {
    /**
     * 按人员查找违规记录
     * @param personId
     * @return 违规记录List
     * @throws DaoException
     */
    @Override
    public List<Violation> SelectViolationByPersonId(String personId) throws DaoException {
        List<Violation> violationList=new ArrayList<>();
        Connection conn=getConnection();
        String sql="select * from violation_record where person_id=?";
        try{
            PreparedStatement statement=conn.prepareStatement(sql);
            statement.setString(1,personId);
            ResultSet rst=statement.executeQuery();
            while (rst.next()){
                Violation violation=new Violation();
                violation.setId(rst.getInt(1));
                violation.setCarNum(rst.getString(2));
                violation.setLocation(rst.getString(3));
                violation.setTime(rst.getDate(4));
                violation.setContent(rst.getString(5));
                violation.setPersonId(rst.getString(6));
                violation.setStatue(rst.getString(7));
                violation.setMaterial(rst.getBlob(8));
                violationList.add(violation);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            try {
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return violationList;
    }
    /**
     * 将提交的材料存入数据库并修改处理状态:未处理->处理中
     * @param uid
     * @return
     * @throws DaoException
     */
    @Override
    public boolean updateMaterialAndStateById(int uid) throws DaoException {
        Connection conn=getConnection();
        String sql="update violation_record set violation_state='处理中',do_material=? where id=?";

        try{
                File f = new File("D:\\idea_project\\VMS-NoFrameWork\\target\\VMS-NoFrameWork-1.0-SNAPSHOT\\resource\\upload\\"+ UserInfo.UserId+".jpg");//获取临时文件
                InputStream fin = new FileInputStream(f);//获取文件输入流
                ByteArrayOutputStream baos=new ByteArrayOutputStream();//将文件读入内存
                int len=-1;
                byte[] buf=new byte[1024*1024*6];//设置文件字节读入缓冲区大小(设置为6MB)
                while((len=fin.read(buf))!=-1){//将文件读入内存
                    baos.write(buf,0,len);
                baos.close();fin.close();//关闭流对象
                byte[] bytes=baos.toByteArray();
                Blob image=conn.createBlob();
                image.setBytes(1,bytes);//将内存中的字节读入blob对象
                PreparedStatement statement=conn.prepareStatement(sql);
                statement.setBlob(1,image);
                statement.setInt(2,uid);
                int res=statement.executeUpdate();
                if(res>0){
                    f.delete();//删除临时文件
                    return true;
                }

            }
        }catch (SQLException e){
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
        finally {
            try {
                conn.close();
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return false;
    }

}
