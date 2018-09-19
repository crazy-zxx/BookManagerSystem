package cn.book.dao.user;

import cn.book.dao.DaoHibernate;
import cn.book.entity.User;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository("userDao")
public class UserDao extends DaoHibernate<User> {

    // 登录
    public User login(User user) {
        String hql = "from User where  stuid=?0 and  stupassword=?1";
        Object[] params = {user.getStuid(),user.getPassword()};
        User user1 = this.findOne(hql,params);
        return user1;
    }

    // / 查询所有的用户信息
    public List<User> selectAllUser() {
        String hql = "from User";
        List<User> users = new ArrayList<User>();
        users = this.find(hql,null);
        return users;
    }

    // 获得单个用户信息
    public User  selectOneUser(String stuid) {
        String hql = "from User where stuid = ?0";
        User user = new User();
        Object[] params = {Integer.parseInt(stuid)};
        user = this.findOne(hql,params);
        return user;
    }


    // / 模糊查询用户信息
    public List<User>  selectUserLike(String stuid) {
        List<User> users = new ArrayList<User>();
        String hql = "from User where stuid like '%" + stuid + "%'";
        users = this.find(hql,null);
        return users;
    }

    // 想数据库中插入一个用户
    public int register(User user) {
        int row = 0;
        row = this.insert(user);
        return row;
    }

    // 修改用户密码
    public int updatePassword(User user) {
        int row = 0;
        row = this.update(user);
        return row;
    }

    // 修改用户借阅数量
    public int updateCount(int stuid,int num) {
        int row = 0;

        //获取原本的其他值,避免更新时默认置零
        String hql = "from User where stuid = ?0";
        Object[] params = {stuid};
        User user1 = new User();
        user1 = this.findOne(hql,params);

        User user = new User();
        user.setStuid(stuid);
        user.setPassword(user1.getPassword());
        user.setPower(user1.getPower());
        if (num == 1){
            user.setCount(user1.getCount()+1);
        }else{
            user.setCount(user1.getCount()-1);
        }
        row = this.update(user);
        return row;
    }


    // 修改用户权限
    public int updatePower(User user) {
        int row = 0;
        row = this.update(user);
        return row;
    }



    // 删除用户
    public int deleteUser(String stuId) {
        int row = 0;
        User user = new User();
        user.setStuid(Integer.parseInt(stuId));
        row = this.delete(user);
        return row;
    }


}
