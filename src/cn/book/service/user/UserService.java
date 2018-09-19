package cn.book.service.user;

import cn.book.entity.User;

import java.util.List;

public interface UserService {
    User userLogin(User user);
    List<User> getAllUser();

    User getOneUser(String stuid);

    List<User> getUserLike(String stuid);

    int userRegister(User user);

    int updatePassword(String pass);
    int updatePower(User user);

    int updateConut(int stuId, int num);

    int deleteUser(String stuId);
}
