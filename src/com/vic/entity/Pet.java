package com.vic.entity;
/**
 * 宠物类
 * @author Liang
 */
public class Pet {
	private String strain;//品种
	private String nick;//昵称
	private int age;//年龄
	/**
	 * 无参构造
	 */
	public Pet() {
		super();
	}
	/**
	 * 有参构造
	 * @param strain 宠物品种
	 * @param nick 宠物昵称
	 * @param age 宠物年龄
	 */
	public Pet(String strain, String nick, int age) {
		super();
		this.strain = strain;
		this.nick = nick;
		this.age = age;
	}
	/**
	 * getter和setter方法
	 */
	public String getStrain() {
		return strain;
	}
	public void setStrain(String strain) {
		this.strain = strain;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
}
