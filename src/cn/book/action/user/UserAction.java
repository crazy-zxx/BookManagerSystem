package cn.book.action.user;

import cn.book.entity.User;
import cn.book.service.user.UserServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import static cn.book.util.BookConstants.USER_SESSION;


@Controller
@Scope("prototype")
@ParentPackage(value = "struts-default")
@Namespace(value = "/user")
public class UserAction extends ActionSupport{

    String pass;
    User user;
    String stuId;
    //获取session
    ActionContext actionContext = ActionContext.getContext();
    Map session = actionContext.getSession();
    HttpServletRequest request = ServletActionContext.getRequest();

    @Resource
    UserServiceImpl userService;

    @Action(
            value = "login",
            results = {
                    @Result(name = "fail",location = "/user/login.jsp",type = "dispatcher"),    /*"/user/login.jsp"这个路径 最前面加上"/",去找web-app下的,不加就找web-inf下面的*/
                    @Result(name = "user_success",location = "/book/main.jsp",type = "dispatcher"),
                    @Result(name = "manage_success",location = "/book/managemain.jsp",type = "dispatcher")
            }
    )
    public String userLogin(){
        String forward = null;
        User user1 = userService.userLogin(user);
        if (user1 == null){
            forward = "fail";
        }else{
            session.put(USER_SESSION,user1);
            if (user1.getPower() == 0){
                forward = "user_success";
            }else{
                forward = "manage_success";
            }

        }
        return forward;
    }


    @Action(
            value = "allUser",
            results = {
                    @Result(name = "success",location = "/user/manage_user.jsp",type="dispatcher"),
                    @Result(name = "fail",location = "/error.jsp",type="dispatcher")
            }
    )
    public String getAllUser(){
        String forward = null;
        List<User> users = userService.getAllUser();
        if (users.size() == 0){
            forward="fail";
        }else{
            request.setAttribute("users",users);
            forward="success";
        }
        return forward;
    }



    @Action(
            value = "/userLike",
            results = {
                    @Result(name = "success",location = "/user/manage_user.jsp",type = "dispatcher"),
            }
    )
    public String getUserLike(){
        String forward = "success";
        List<User> users = userService.getUserLike(stuId);
        request.setAttribute("users",users);
        return forward;
    }

    @Action(
            value = "/oneUser",
            results = {
                    @Result(name = "success",location = "/user/power_update.jsp",type = "dispatcher"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String getOneUser(){
        String forward = null;
        User user = userService.getOneUser(stuId);
        request.setAttribute("user",user);
        if (user == null)
            forward = "fail";
        else
            forward = "success";
        return forward;
    }


    @Action(
            value = "register",
            results = {
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher"),    /*"/user/login.jsp"这个路径 最前面加上"/",去找web-app下的,不加就找web-inf下面的*/
                    @Result(name = "success",location = "/user/login.jsp",type = "dispatcher")
            }
    )
    public String userRegister(){
        String forward = null;
        int rw = userService.userRegister(user);
        if (rw == 0){
            forward = "fail";
        }else{
            forward = "success";
        }
        return forward;
    }

    @Action(value = "/updateUser")
    public void revert(){
        int  re = userService.updatePassword(pass);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        try {
            response.getWriter().print(re);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Action(
            value = "/updatePower2",
            results = {
                    @Result(name = "success",location = "allUser",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String updatePower2(){
        String forward = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        User user1 = (User) request.getAttribute("user");
        int re = userService.updatePower(user1);
        if (re == 1){
            forward="success";
        }else{
            forward="fail";
        }
        return forward;
    }
    @Action(
            value = "/updatePower",
            results = {
                    @Result(name = "success",location = "updatePower2",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String updatePower(){
        String forward = null;
        User user1 = userService.getOneUser(String.valueOf(user.getStuid()));
        user1.setPower(user.getPower());
        if (user1!=null){
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("user",user1);
            forward="success";
        }else{
            forward="fail";
        }
        return forward;
    }



    @Action(value = "/deleteUser")
    public void delete(){
        int  re = userService.deleteUser(stuId);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        try {
            response.getWriter().print(re);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    //    User对象的getter  setter方法
    //必须要加  才可以进行自动赋值
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getStuId() {
        return stuId;
    }

    public void setStuId(String stuId) {
        this.stuId = stuId;
    }
}
