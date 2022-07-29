package com.dto;

public class CouponDTO {
	
	private String coupon_id;
	private String coupon_userid;
	private String coupon_gendate;
	private String coupon_usedate;
	private double coupon_disper;
	private String coupon_name;
	private boolean coupon_isusable;
	
	public CouponDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CouponDTO(String coupon_id, String coupon_userid, String coupon_gendate, String coupon_usedate,
			double coupon_disper, String coupon_name, boolean coupon_isusable) {
		super();
		this.coupon_id = coupon_id;
		this.coupon_userid = coupon_userid;
		this.coupon_gendate = coupon_gendate;
		this.coupon_usedate = coupon_usedate;
		this.coupon_disper = coupon_disper;
		this.coupon_name = coupon_name;
		this.coupon_isusable = coupon_isusable;
	}

	public String getCoupon_id() {
		return coupon_id;
	}

	public void setCoupon_id(String coupon_id) {
		this.coupon_id = coupon_id;
	}

	public String getCoupon_userid() {
		return coupon_userid;
	}

	public void setCoupon_userid(String coupon_userid) {
		this.coupon_userid = coupon_userid;
	}

	public String getCoupon_gendate() {
		return coupon_gendate;
	}

	public void setCoupon_gendate(String coupon_gendate) {
		this.coupon_gendate = coupon_gendate;
	}

	public String getCoupon_usedate() {
		return coupon_usedate;
	}

	public void setCoupon_usedate(String coupon_usedate) {
		this.coupon_usedate = coupon_usedate;
	}

	public double getCoupon_disper() {
		return coupon_disper;
	}

	public void setCoupon_disper(double coupon_disper) {
		this.coupon_disper = coupon_disper;
	}

	public String getCoupon_name() {
		return coupon_name;
	}

	public void setCoupon_name(String coupon_name) {
		this.coupon_name = coupon_name;
	}

	public boolean isCoupon_isusable() {
		return coupon_isusable;
	}

	public void setCoupon_isusable(boolean coupon_isusable) {
		this.coupon_isusable = coupon_isusable;
	}

	@Override
	public String toString() {
		return "CouponDTO [coupon_id=" + coupon_id + ", coupon_userid=" + coupon_userid + ", coupon_gendate="
				+ coupon_gendate + ", coupon_usedate=" + coupon_usedate + ", coupon_disper=" + coupon_disper
				+ ", coupon_name=" + coupon_name + ", coupon_isusable=" + coupon_isusable + "]";
	}
	
}
