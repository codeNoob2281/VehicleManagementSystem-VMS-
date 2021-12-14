package com.test;

import com.model.CarRequest;
import com.po.Car;
import com.service.CarService;
import com.service.UserService;
import com.service.ViolationService;
import com.service.ViolationServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 测试类
 * @author hzf 2021/12/11
 */
public class ServiceTest {


    @Test
    public void userTest(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userService=(UserService) ctx.getBean("userService");
       boolean res= userService.login("S0285","S0284",1);
     System.out.println(res);
    }

    @Test
    public void carTest(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("applicationContext.xml");
        ViolationService violationService=(ViolationService) ctx.getBean("violationService");
        byte[] bytes=new byte[10];
        for(int i=0;i<10;i++){
            bytes[i]=35;
        }
        violationService.submitMaterial(1,bytes);



    }



}
