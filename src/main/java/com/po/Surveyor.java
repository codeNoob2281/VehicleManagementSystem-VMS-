package com.po;

/**
 * 查勘员账户信息实体类
 * @author hzf 2021/12/11
 */
public class Surveyor {
    /**
     * 查勘员工号
     */
    private String id;
    /**
     * 登录密码
     */
    private String password;


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }


}
