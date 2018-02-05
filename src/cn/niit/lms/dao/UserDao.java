
package cn.niit.lms.dao;

import cn.niit.lms.domain.Rule;
import cn.niit.lms.domain.User;

//数据接口
public interface UserDao {
	//保存用户对象
    void save(User u);
    //用 Email 查询用户
    User findUserByEmail(String email);
    //用 Uname 查询用户
	User findUserByName(String uname);
	//用 Phone 查询用户
	User findUserByPhone(String phone);
	//获取对应的Rule设定
	Rule getRule(String role);
	//获取用户的罚金总额
	int getFine(int UID);
}
