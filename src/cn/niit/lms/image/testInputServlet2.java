package cn.niit.lms.image;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.sql.*;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


@WebServlet("/testInput2")
public class testInputServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public testInputServlet2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        PrintWriter pwout = response.getWriter();
	        String savePath = null;
	        String tempPath = this.getServletContext().getRealPath("/Temp");
	        String redirect="";
	        boolean inputSuccess = false;
	        String ISBN = "";
	        java.sql.Connection con = null;
	        java.sql.PreparedStatement psmt = null;
	        
	        File tmpFile = new File(tempPath);
	        if (!tmpFile.exists() && !tmpFile.isDirectory()) {//创建临时文件夹
	            tmpFile.mkdir();
	        }
	        
	        System.out.println("tempPath: "+tempPath);
	        String message="";
	        System.out.println("========== Handle Servlet Beginning ===========");
	        try {
	            DiskFileItemFactory factory = new DiskFileItemFactory();
	            //设置工厂的缓冲区的大小
	            //设定缓冲区的大小为100KB，如果不指定，那么缓冲区的大小默认是10KB
	            factory.setSizeThreshold(1024 * 100);
	            //设置上传时生成的临时文件的保存目录
	            factory.setRepository(tmpFile);
	            //2、创建文件上传解析器
	            ServletFileUpload upload = new ServletFileUpload(factory);
	            //监听文件上传进度
	            upload.setProgressListener((long pBytesRead, long pContentLength, int arg2) -> {
	                System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
	            });
	            //解决中文乱码
	            upload.setHeaderEncoding("UTF-8");
	            //判断是否是表单提供的文件
	            if (!ServletFileUpload.isMultipartContent(request)) {
	                //按照传统方式获取数据
	                System.out.println("============== request 无效 ================");
	                pwout.print("无效的上传请求<br>");
	                return;
	            }
	            //设置上传单个文件的大小的最大值，目前是设置为128*1024*1024字节，也就是128MB
	            upload.setFileSizeMax(128 * 1024 * 1024);
	            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为512MB
	            upload.setSizeMax(1024 * 1024 * 512);
	            
	            /*☆☆☆☆☆☆☆☆参数解析中☆☆☆☆☆☆☆☆☆*/
	            System.out.println("☆☆☆☆☆☆☆☆ 参数解析中 ☆☆☆☆☆☆☆☆☆");
	            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，
	            //	  每一个FileItem对应一个Form表单的输入项
	            String ISBNname = null;
	            List<FileItem> list = upload.parseRequest(request);
	            for (FileItem item : list) {
	                //如果封装的是普通输入项文本数据
	                if (item.isFormField()) {
	                    String fieldname = item.getFieldName();
	                    String value = item.getString("UTF-8");
	                    System.out.println("[参数]：\t" + fieldname + " = " + value);
	                    if(fieldname.equals("ISBN")){
	                    	ISBN = value;
	                    	ISBNname = value;
	                    }
	                    //pwout.print(fieldname + " = " + value);
	                    //获得了id
	                    //owner_id = Integer.parseInt(value);
	                    //savePath = savePath + owner_id;
	                } else {//是上传的文件
	                    //获取文件名
	                    String filename = item.getName();
	                    System.out.println(filename);

	                    if (filename == null || filename.trim().equals("")) {
	                    	System.out.println("[参数]：\t上传文件为空！");
	                    	message=message.concat("\n\t| 某一文件输入为空！\n");
	                        continue;
	                    }
	                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
	                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
	                    //pwout.print("文件名：" + filename + "<br>");
	                    message=message.concat("文件名：" + filename + "<br>");
	                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
	                    String fileExtName = filename.substring(filename.lastIndexOf(".") + 1);
	                    System.out.println("| 上传的文件的扩展名是：" + fileExtName);
	                    message=message.concat("扩展名：" + fileExtName + "<br>");
	                    if(ISBNname != null){
	                    	System.out.println("| 保存到服务器的文件名是：" + ISBNname+"."+fileExtName);
	                    	filename = ISBNname+"."+fileExtName;
	                    }
	                    message=message.concat("保存到服务器的文件名是：" + filename + "<br>");
	                    int col=0;
	                    //获取item中上传文件的输入流
	                    try (InputStream in = item.getInputStream()) {
	                    	System.out.println("InputStream 的长度："+in.available());
	                    	long l = (long) in.available();
	                    	try{
	                        String saveFilename = filename;
	                    	con = testJDBCUtils.getConnection();
	                    	psmt = con.prepareStatement("insert into testimage.bookcover(ISBN,cover) values(?,?)");
	                    	psmt.setString(1, ISBN);
	                    	//可以不写InputStream的长度
	                        //psmt.setBinaryStream(2, (InputStream) in, (int) (image.length()));
	                    	psmt.setBinaryStream(2, (InputStream)in,(int)l);
	                    	col = psmt.executeUpdate();
	                    	}catch (SQLException e) {
		                    	System.out.println("[testInputServlet2.java]: 数据库写入异常！");
								e.printStackTrace();
							}catch(Exception e){
	                    		e.printStackTrace();
							}finally{
								testJDBCUtils.close(con, psmt, null);
								in.close();
							}
	                    }
	                    
	                    item.delete();
                    	if(col>0){
    	                    message=message.concat("文件上传数据库成功！");
    	                    inputSuccess = true;
                    	}else{
                    		message=message.concat("文件上传数据库失败！");
                    	}

	                }
	            }
	        } catch (FileUploadBase.FileSizeLimitExceededException e) {
	            //pwout.print("单个文件超出最大值！！！");
	        	message=message.concat("\n单个文件超出最大值！！！\n");
	            //request.setAttribute("message", "单个文件超出最大值！！！");
	            //request.getRequestDispatcher("/message.jsp").forward(request, response);
	            //return;
	        } catch (FileUploadBase.SizeLimitExceededException e) {
	            //pwout.print("上传文件的总的大小超出限制的最大值！！！");
	        	message=message.concat("\n上传文件的总的大小超出限制的最大值！！！\n");
	            //request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
	            //request.getRequestDispatcher("/message.jsp").forward(request, response);
	            //return;
	        } catch (IOException | FileUploadException e) {
	            message=message.concat("\n文件上传失败！\n");
	            e.printStackTrace();
	        }
	        System.out.println("--------------上传结果--------------\n" + message);
	        request.setAttribute("message", message);

	        if(inputSuccess)
	        	response.sendRedirect(request.getContextPath() + "/testOutput2.jsp?ISBN="+ISBN);
	        else
	        	response.sendRedirect(request.getContextPath() + "/testInput2.jsp");
	        return;
	}
}
