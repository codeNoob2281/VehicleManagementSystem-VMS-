package com.controller;

import com.Service.ViolationService;
import com.stat.UserInfo;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "DoViolationServlet", value = "/doViolation")
public class DoViolationServlet extends HttpServlet {
    private static final long serialVersionUID = -4187075130535308117L;
    private boolean isMultipart;
    private int maxFileSize = 1024 * 1024 * 10;
    private int maxMemSize = 100 * 1024;
    int violationId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 文件大小的最大值将被存储在内存中
        factory.setSizeThreshold(maxMemSize);
        String path = getServletContext().getRealPath("/") + "/resource/upload/";//确定临时文件路径
        factory.setRepository(new File(path));
        System.out.println("临时文件保存在："+path);//输出文件路径

        // 创建一个新的文件上传处理程序
        ServletFileUpload upload = new ServletFileUpload(factory);
        // 允许上传的文件大小的最大值
        upload.setSizeMax(maxFileSize);

        try {
            // 解析请求，获取文件项
            List fileItems = upload.parseRequest(request);
            // 处理上传的文件项
                for (Object i : fileItems) {
                    FileItem fi = (FileItem) i;
                    if (!fi.isFormField()) {//上传的是文件
                        // 写入文件
                        File file = new File(path + UserInfo.UserId + ".jpg");
                        fi.write(file);

                    } else {//上传的是普通表单域(传入违章编号)
                        violationId =Integer.parseInt(fi.getString());//赋值给违章编号
                    }
                }
            } catch (Exception ex) {
                System.out.println("ex:" + ex.getMessage());
            }
          //提交材料
        ViolationService violationService=new ViolationService();
        violationService.submitMaterial(violationId);
              response.sendRedirect("undoViolation");

        }
    }
