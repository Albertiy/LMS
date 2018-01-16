package cn.niit.lms.login;

//数据接口
public interface UserDao {
	//保存用户对象
    void save(User u);

    //用Email查询用户
    User findUserByEmail(String email);
}
