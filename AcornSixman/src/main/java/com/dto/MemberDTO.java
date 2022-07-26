package com.dto;

public class MemberDTO {
	private String userid;
	private String passwd;
	private String username;
	private String post;
	private String addr1;
	private String addr2;
	private String phone;
	private String email01;
	private String email02;
	private String seller_YN;
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MemberDTO(String userid, String passwd, String username, String post, String addr1, String addr2,
			String phone, String email01, String email02, String seller_YN) {
		super();
		this.userid = userid;
		this.passwd = passwd;
		this.username = username;
		this.post = post;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.phone = phone;
		this.email01 = email01;
		this.email02 = email02;
		this.seller_YN = seller_YN;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail01() {
		return email01;
	}
	public void setEmail01(String email01) {
		this.email01 = email01;
	}
	public String getEmail02() {
		return email02;
	}
	public void setEmail02(String email02) {
		this.email02 = email02;
	}
	public String getSeller_YN() {
		return seller_YN;
	}
	public void setSeller_YN(String seller_YN) {
		this.seller_YN = seller_YN;
	}
	@Override
	public String toString() {
		return "MemberDTO [userid=" + userid + ", passwd=" + passwd + ", username=" + username + ", post=" + post
				+ ", addr1=" + addr1 + ", addr2=" + addr2 + ", phone=" + phone + ", email01=" + email01 + ", email02="
				+ email02 + ", seller_YN=" + seller_YN + "]";
	}
	

}
