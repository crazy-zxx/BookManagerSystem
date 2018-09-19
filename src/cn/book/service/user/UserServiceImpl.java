package cn.book.service.user;

import cn.book.dao.user.UserDao;
import cn.book.entity.User;
import com.opensymphony.xwork2.ActionContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

import static cn.book.util.BookConstants.USER_SESSION;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Resource
    UserDao userDao;

    public User userLogin(User user){
        return userDao.login(user);
    }

    public List<User> getAllUser(){
        return userDao.selectAllUser();
    }

    public User getOneUser(String  stuid){
        return userDao.selectOneUser(stuid);
    }

    public List<User> getUserLike(String stuid){
        return userDao.selectUserLike(stuid);
    }

    public int userRegister(User user){
        return userDao.register(user);
    }

    public int updatePassword(String pass){
        User user = (User) ActionContext.getContext().getSession().get(USER_SESSION);
        user.setPassword(pass);
        return userDao.updatePassword(user);
    }

    public int updatePower(User user){
        return userDao.updatePower(user);
    }

    public int updateConut(int stuId,int num){
        return userDao.updateCount(stuId,num);
    }

    public int deleteUser(String stuId){
        return userDao.deleteUser(stuId);
    }


}
