package cn.book.service.book;

import cn.book.entity.Book;

import java.util.List;

public interface BookService {

    List<Book> getAllBook();

    Book getOneBook(int bid);

    List<Book> getBookLike(String name);

    List<Book> getUserBook(int stuid);

    int borrowBook(Book book);

    int revertBook(Book book);

    int updateBookInfo(Book book);

    int deleteBook(int bookId);

    int insertBook(Book book);
}
