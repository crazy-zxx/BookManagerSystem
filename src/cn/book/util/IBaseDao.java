package cn.book.util;

import java.util.List;

public interface IBaseDao<T> {
	public int insert(T o); // 将对象o,添加到数据库内

	public int insertList(List<T> list); // 将对象集合,添加到数据库内

	public int update(T o); // 利用对象o，修改当前记录

	public int deleteList(Class<T> c, int... ids); // 利用id的集合,删除该集合中对应id的记录。

	public int delete(T o);// 从数据库中删除一个记录o

	public int delete(Class<T> c, int id);// 利用关键字id 从数据库中删除一个记录

	public T findById(Class<T> c, int id); // 利用id,查找一条记录

	public T findOne(String hql, Object[] param); // 查询单条记录

	public List<T> find(String hql, Object[] param); // 按条件查找多条记录

	public List<T> findPage(String hql, String[] param, int page, int size); // 分页查找所有对象

	public int getCount(String hql, String[] pras);// 返回数据个数

	public List<T> findByFields(String hql, String fields[], String condition); //单字段模糊查找满足条件的所有对象

}
