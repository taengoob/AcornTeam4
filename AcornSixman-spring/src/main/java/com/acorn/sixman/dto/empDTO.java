package com.acorn.sixman.dto;

public class empDTO {
    private String empNo;
    private String empName;

    public String getEmpNo() {
        return empNo;
    }

    public void setEmpNo(String empNo) {
        this.empNo = empNo;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public empDTO() {
    }

    public empDTO(String empNo, String empName) {
        this.empNo = empNo;
        this.empName = empName;
    }

    @Override
    public String toString() {
        return "empDTO [empName=" + empName + ", empNo=" + empNo + "]";
    }
}
