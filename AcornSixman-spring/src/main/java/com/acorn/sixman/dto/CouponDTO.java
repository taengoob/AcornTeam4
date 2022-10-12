package com.acorn.sixman.dto;

public class CouponDTO {

	private String couponId;
	private String couponuserId;
	private String couponGendate;
	private String couponUsedate;
	private double couponDisper;
	private String couponName;
	private boolean couponIsusable;

	public CouponDTO() {
		super();
	}

	public CouponDTO(String couponId, String couponuserId, String couponGendate, String couponUsedate,
			double couponDisper, String couponName, boolean couponIsusable) {
		super();
		this.couponId = couponId;
		this.couponuserId = couponuserId;
		this.couponGendate = couponGendate;
		this.couponUsedate = couponUsedate;
		this.couponDisper = couponDisper;
		this.couponName = couponName;
		this.couponIsusable = couponIsusable;
	}

	public String getCouponId() {
		return couponId;
	}

	public void setCouponId(String couponId) {
		this.couponId = couponId;
	}

	public String getCouponuserId() {
		return couponuserId;
	}

	public void setCouponuserId(String couponuserId) {
		this.couponuserId = couponuserId;
	}

	public String getCouponGendate() {
		return couponGendate;
	}

	public void setCouponGendate(String couponGendate) {
		this.couponGendate = couponGendate;
	}

	public String getCouponUsedate() {
		return couponUsedate;
	}

	public void setCouponUsedate(String couponUsedate) {
		this.couponUsedate = couponUsedate;
	}

	public double getCouponDisper() {
		return couponDisper;
	}

	public void setCouponDisper(double couponDisper) {
		this.couponDisper = couponDisper;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public boolean isCouponIsusable() {
		return couponIsusable;
	}

	public void setCouponIsusable(boolean couponIsusable) {
		this.couponIsusable = couponIsusable;
	}

	@Override
	public String toString() {
		return "CouponDTO [couponId=" + couponId + ", couponuserId=" + couponuserId + ", couponGendate=" + couponGendate
				+ ", couponUsedate=" + couponUsedate + ", couponDisper=" + couponDisper + ", couponName=" + couponName
				+ ", couponIsusable=" + couponIsusable + "]";
	}

}
