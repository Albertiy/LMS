package cn.niit.lms.service;

import cn.niit.lms.dao.UserDao;
import cn.niit.lms.dao.impl.UserDaoImpl;
import cn.niit.lms.domain.User;

//提供Servlet调用的功能，使用Dao接口访问数据�?
public class UserService {
	private UserDao udao = new UserDaoImpl();
	
	//登陆成功返回�?个User对象
	public User login(User u){
        User user = udao.findUserByEmail(u.getEmail());
        if (user.equals(null)||!user.getPwd().equals(u.getPwd())) {
            //说明密码不正�?
            throw new RuntimeException("邮箱错误或密码不正确�?");
        }
        //2.登录成功，返回user对象
        return user;
	}
	
	public void regist(User u) {
		User user = null;
        //1.校验 各种 不重复
        user = udao.findUserByName(u.getUname());
        if (user != null) {
            //说明用户名已经存在了
            throw new RuntimeException("Uname already used!");
        }
        user = udao.findUserByEmail(u.getEmail());
        if (user != null) {
            //说明Email已经存在了
            throw new RuntimeException("Email already used!");
        }
        user = udao.findUserByPhone(u.getPhone());
        if (user != null) {
            //说明Phone已经存在了
            throw new RuntimeException("Phone already used!");
        }
        //2.调用User数据接口，执行保存操作
        udao.save(u);
    }
}
