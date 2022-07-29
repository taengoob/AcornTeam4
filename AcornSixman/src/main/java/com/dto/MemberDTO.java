package com.dto;

public class MemberDTO {
	private String accountId;
	private String accountPasswd;
	private String accountName;
	private String accountEmailId;
	private String accountPhone;
	private String accountAddressNumber;
	private String accountIsSeller;
	private String accountJoinDate;
	private String accountAddressLoad;
	private String accountEmailDomain;

	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}


	public MemberDTO(String accountId, String accountPasswd, String accountName, String accountAddressNumber,
			String accountAddressLoad, String accountPhone, String accountEmailId, String accountEmailDomain,
			String accountIsSeller) {
		super();
		this.accountId = accountId;
		this.accountPasswd = accountPasswd;
		this.accountName = accountName;
		this.accountEmailId = accountEmailId;
		this.accountPhone = accountPhone;
		this.accountAddressNumber = accountAddressNumber;
		this.accountIsSeller = accountIsSeller;
		this.accountJoinDate = accountJoinDate;
		this.accountAddressLoad = accountAddressLoad;
		this.accountEmailDomain = accountEmailDomain;
	}


	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getAccountPasswd() {
		return accountPasswd;
	}

	public void setAccountPasswd(String accountPasswd) {
		this.accountPasswd = accountPasswd;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getAccountEmailId() {
		return accountEmailId;
	}

	public void setAccountEmailId(String accountEmailId) {
		this.accountEmailId = accountEmailId;
	}

	public String getAccountPhone() {
		return accountPhone;
	}

	public void setAccountPhone(String accountPhone) {
		this.accountPhone = accountPhone;
	}

	public String getAccountAddressNumber() {
		return accountAddressNumber;
	}

	public void setAccountAddressNumber(String accountAddressNumber) {
		this.accountAddressNumber = accountAddressNumber;
	}

	public String getAccountIsSeller() {
		return accountIsSeller;
	}

	public void setAccountIsSeller(String accountIsSeller) {
		this.accountIsSeller = accountIsSeller;
	}

	public String getAccountJoinDate() {
		return accountJoinDate;
	}

	public void setAccountJoinDate(String accountJoinDate) {
		this.accountJoinDate = accountJoinDate;
	}

	public String getAccountAddressLoad() {
		return accountAddressLoad;
	}

	public void setAccountAddressLoad(String accountAddressLoad) {
		this.accountAddressLoad = accountAddressLoad;
	}

	public String getAccountEmailDomain() {
		return accountEmailDomain;
	}

	public void setAccountEmailDomain(String accountEmailDomain) {
		this.accountEmailDomain = accountEmailDomain;
	}

	@Override
	public String toString() {
		return "TestDTO [accountId=" + accountId + ", accountPasswd=" + accountPasswd + ", accountName=" + accountName
				+ ", accountEmailId=" + accountEmailId + ", accountPhone=" + accountPhone + ", accountAddressNumber="
				+ accountAddressNumber + ", accountIsSeller=" + accountIsSeller + ", accountJoinDate=" + accountJoinDate
				+ ", accountAddressLoad=" + accountAddressLoad + ", accountEmailDomain=" + accountEmailDomain + "]";
	}

}
