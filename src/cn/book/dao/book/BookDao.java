package cn.book.dao.book;

import cn.book.dao.DaoHibernate;
import cn.book.entity.Book;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository("bookDao")
public class BookDao extends DaoHibernate<Book> {



    // 获得所有的图书信息
    public List<Book>  selectAllBook() {
        List<Book> books = new ArrayList<Book>();
        String hql = "from Book";
        books = this.find(hql,null);
        return books;
    }

    // 获得单个图书信息
    public Book selectOneBook(int bid) {
        String hql = "from Book where bid = ?0";
        Book book = new Book();
        Object[] params = {bid};
        book = this.findOne(hql,params);
        return book;
    }


    // / 模糊查询书籍信息
    public List<Book>  selectBookLike(String name) {
        List<Book> books = new ArrayList<Book>();
        String hql = "from Book where bname like '%" + name + "%'";
        books = this.find(hql,null);
        return books;
    }


    //查询用户所借书籍
    public List<Book>  selectUserBook(int stuid) {
        List<Book> books = new ArrayList<Book>();
        String hql = "from Book where bstuid = ?0";
        Object[] params = {stuid};
        books = this.find(hql,params);
        return books;
    }


    // 修改用户值(借书)
    public int updateBook(Book book) {
        int row = 0;

//        //获取原本的其他值,避免更新时默认置零
//        String hql = "from Book where bid = ?";
//        Object[] params = {bookId};
//        Book book1 = new Book();
//        book1 = this.findOne(hql,params);
//
//        User user = (User)ActionContext.getContext().getSession().get(USER_SESSION);
//        Book book = new Book();
//        book.setStuId(user.getStuid());
//        book.setId(bookId);
//        book.setPrice(book1.getPrice());
//        book.setAuthor(book1.getAuthor());
//        book.setName(book1.getName());
//        book.setComment(book1.getComment());
        row = this.update(book);
        return row;
    }

    // 修改用户值(还书)
    public int revertBook(Book book) {
        int row = 0;
//        //获取原本的其他值,避免更新时默认置零
//        String hql = "from Book where bid = ?";
//        Object[] params = {bookId};
//        Book book1 = new Book();
//        book1 = this.findOne(hql,params);
//
//        Book book = new Book();
//        book.setStuId(0);
//        book.setId(bookId);
//        book.setPrice(book1.getPrice());
//        book.setAuthor(book1.getAuthor());
//        book.setName(book1.getName());
//        book.setComment(book1.getComment());
        row = this.update(book);
        return row;
    }

    // 修改书籍信息
    public int updateBookInfo(Book book2) {
        int row = 0;
        row = this.update(book2);
        return row;
    }

    // 删除书籍
    public int deleteBook(int bookId) {
        int row = 0;
        Book book = new Book();
        book.setId(bookId);
        row = this.delete(book);
        return row;
    }


    // 增加书籍信息
    public int insertBook(Book book) {
        int row = 0;
        row = this.insert(book);
        return row;
    }

}
