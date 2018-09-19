package cn.book.entity;


public class User {

    private int stuid;
    private String password;
    private int power;
    private int count;

    public User(){}
    public User(int stuid, String password, int power, int count) {
        this.stuid = stuid;
        this.password = password;
        this.power = power;
        this.count = count;
    }

    @Override
    public String toString() {
        return "User{" +
                "stuid=" + stuid +
                ", password='" + password + '\'' +
                ", power=" + power +
                ", count=" + count +
                '}';
    }

    public int getStuid() {
        return stuid;
    }

    public void setStuid(int stuid) {
        this.stuid = stuid;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}
