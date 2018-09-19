package cn.book.action.book;

import cn.book.entity.Book;
import cn.book.entity.User;
import cn.book.service.book.BookServiceImpl;
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
@Namespace(value = "/book")
public class BookAction extends ActionSupport{


    Book book;
    int bookId;
    String name;
    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    Map session =ActionContext.getContext().getSession();
    User user = (User)session.get(USER_SESSION);

    @Resource
    BookServiceImpl bookService;
    @Resource
    UserServiceImpl userService;


    @Action(
            value = "/allBook",
            results = {
                    @Result(name = "user_success",location = "/book/search.jsp",type = "dispatcher"),
                    @Result(name = "manage_success",location = "/book/manage_search.jsp",type = "dispatcher"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String getAllBook(){
        String forward = null;
        List<Book> books = bookService.getAllBook();
        if (books.size() == 0){
            forward = "fail";
        }else{
            request.setAttribute("books",books);
            if (user.getPower()==0)
                forward = "user_success";
            else
                forward = "manage_success";
        }
        return forward;
    }

    @Action(
            value = "/bookLike",
            results = {
                    @Result(name = "user_success",location = "/book/search.jsp",type = "dispatcher"),
                    @Result(name = "manage_success",location = "/book/manage_search.jsp",type = "dispatcher")
            }
    )
    public String getBookLike(){
        String forward = null;
        List<Book> books = bookService.getBookLike(name);
        request.setAttribute("books",books);
        if (user.getPower()==0)
            forward = "user_success";
        else
            forward = "manage_success";
        return forward;
    }

    @Action(
            value = "/oneBook",
            results = {
                    @Result(name = "success",location = "/book/manage_update.jsp",type = "dispatcher"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String getOneBook(){
        String forward = null;
        Book book = bookService.getOneBook(bookId);
        request.setAttribute("book",book);
        if (book == null)
            forward = "fail";
        else
            forward = "success";
        return forward;
    }


    @Action(
            value = "/bookUser",
            results = {
                    @Result(name = "success",location = "/book/revert.jsp",type = "dispatcher"),
            }
    )
    public String getUserBook(){
        String forward = null;
        List<Book> books = bookService.getUserBook(user.getStuid());
        response.setCharacterEncoding("utf-8");
        request.setAttribute("books",books);
        forward = "success";
        return forward;
    }

    @Action(
            value = "/updateCount"
    )
    public void updateCount(){
        int re2 = userService.updateConut(user.getStuid(),1);
        User user1 = new User();
        user1 = user;
        user1.setCount(user.getCount()+1);
        session.put(USER_SESSION,user1);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        try {
            response.getWriter().print("1");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Action(
            value = "/borrow2",
            results = {
                    @Result(name = "success",location = "updateCount",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String borrow2(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Book book = (Book) request.getAttribute("book");
        int re = bookService.borrowBook(book);
        String froward = "fail";
        if (re == 1){
            froward = "success";
        }
        return froward;
    }
    @Action(
            value = "/borrow",
            results = {
                    @Result(name = "success",location = "borrow2",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String borrow(){
        Book book = bookService.getOneBook(bookId);
        User user = (User)ActionContext.getContext().getSession().get(USER_SESSION);
        book.setStuId(user.getStuid());
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("book",book);
        String froward = "fail";
        if (book != null){
            froward = "success";
        }
        return froward;
    }

    @Action(
            value = "/updateRevert"
    )
    public void updateRevert(){
        int re2 = userService.updateConut(user.getStuid(),0);
        User user1 = new User();
        user1 = user;
        user1.setCount(user.getCount()-1);
        session.put(USER_SESSION,user1);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        try {
            response.getWriter().print("1");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Action(
            value = "/revert2",
            results = {
                    @Result(name = "success",location = "updateRevert",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }
    )
    public String revert2(){
        HttpServletRequest request = ServletActionContext.getRequest();
        Book book = (Book)request.getAttribute("book");
        int  re = bookService.revertBook(book);
        String forward = "fail";
        if (re ==1 ){
            forward = "success";
        }
        return forward;
    }
    @Action(
            value = "/revert",
            results = {
                    @Result(name = "success",location = "revert2",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher")
            }

    )
    public String revert(){
        Book book1 = bookService.getOneBook(bookId);
        book1.setStuId(0);
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("book",book1);
        String forward = null;
        if (book1 != null){
            forward="success";
        }else{
            forward = "fail";
        }
        return forward;
    }

    @Action(
            value = "/updateBook2",
            results = {
                    @Result(name = "success",location = "allBook",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher"),
            }
    )
    public String updateBook2(){
        String forward = null;
        HttpServletRequest request = ServletActionContext.getRequest();
        Book book1 = (Book)request.getAttribute("book");
        int re = bookService.updateBookInfo(book1);
        if (re == 1){
            forward="success";
        }else{
            forward = "fail";
        }
        return forward;
    }
    @Action(
            value = "/updateBook",
            results = {
                    @Result(name = "success",location = "updateBook2",type = "chain"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher"),
            }
    )
    public String updateBook(){
        String forward = null;
        Book book1 = bookService.getOneBook(book.getId());
        book1.setComment(book.getComment());
        book1.setName(book.getName());
        book1.setAuthor(book.getAuthor());
        book1.setPrice(book.getPrice());
        HttpServletRequest request = ServletActionContext.getRequest();
        request.setAttribute("book",book1);
        if (book1 != null){
            forward="success";
        }else{
            forward = "fail";
        }
        return forward;
    }

    @Action(value = "/deleteBook")
    public void delete(){
        int  re = bookService.deleteBook(bookId);
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain;charset=UTF-8");
        try {
            response.getWriter().print(re);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    @Action(
            value = "insertBook",
            results = {
                    @Result(name = "success",location = "/book/manage_add.jsp",type = "dispatcher"),
                    @Result(name = "fail",location = "/error.jsp",type = "dispatcher"),
            }
    )
    public String insertBook(){
        String forward = null;
        int re = bookService.insertBook(book);
        if (re == 1){
            forward="success";
        }else{
            forward = "fail";
        }
        return forward;
    }


    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
