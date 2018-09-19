package cn.book.service.book;

import cn.book.dao.book.BookDao;
import cn.book.entity.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Resource
    BookDao bookDao;

    public List<Book> getAllBook(){
        return bookDao.selectAllBook();
    }

    public Book getOneBook(int bid){
        return bookDao.selectOneBook(bid);
    }

    public List<Book> getBookLike(String name){
        return bookDao.selectBookLike(name);
    }

    public List<Book> getUserBook(int stuid){
        return bookDao.selectUserBook(stuid);
    }

    public int borrowBook(Book book){
        return bookDao.updateBook(book);
    }

    public int revertBook(Book book){
        return bookDao.revertBook(book);
    }

    public int updateBookInfo(Book book){
        return bookDao.updateBookInfo(book);
    }

    public int deleteBook(int bookId){
        return bookDao.deleteBook(bookId);
    }

    public int insertBook(Book book){
        return bookDao.insertBook(book);
    }
}
