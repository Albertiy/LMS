package cn.niit.lms.service;

import cn.niit.lms.dao.UserDao;
import cn.niit.lms.dao.impl.UserDaoImpl;
import cn.niit.lms.domain.User;

//提供Servlet调用的功能，使用Dao接口访问数据。
public class UserService {
	private UserDao udao = new UserDaoImpl();
	
	//登陆成功返回一个User对象
	public User login(User u){
        User user = udao.findUserByEmail(u.getEmail());
        if (user.equals(null)||!user.getPwd().equals(u.getPwd())) {
            //说明密码不正确
            throw new RuntimeException("邮箱错误或密码不正确！");
        }
        //2.登录成功，返回user对象
        return user;
	}
}
