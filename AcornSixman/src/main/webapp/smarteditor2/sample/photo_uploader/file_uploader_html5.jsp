<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.UUID"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>

<%@page import="com.service.BoardService" %>


<%

	String sFileInfo = "";
	
	//파일명 - 싱글파일업로드와 다르게 멀티파일업로드는 HEADER로 넘어옴 
	
	String name = request.getHeader("file-name");
	
	String ext = name.substring(name.lastIndexOf(".")+1);
	
	//파일 기본경로
	
	String defaultPath = request.getServletContext().getRealPath("/");
	
	//파일 기본경로 _ 상세경로 (서버에 저장)
	//String path = defaultPath + "upload" + File.separator; //(기본 설정값)
	String path = defaultPath + "upload" + File.separator;
	
	String path2 = "C://Users/ejm5/Desktop/project/AcornTeam4/AcornSixman/src/main/webapp/upload/";
	//로컬 저장 위치, 톰캣 server.xml 에서 해당 로컬주소를 /AcornTeam4/upload 폴더로 인식하도록 mapping 해야함

	
	File file = new File(path);
	
	if(!file.exists()) {//해당 폴더가 없을경우 폴더 생성
	
	 file.mkdirs();
	
	}
	
	String realname = UUID.randomUUID().toString() + "." + ext;
	
	InputStream is = request.getInputStream();
	
	String storedFileName = path + realname; //서버 주소 + 파일명
	String storedFileName2 = path2 + realname; //로컬 주소 + 파일명
	
	OutputStream os=new FileOutputStream(storedFileName);
	OutputStream os2=new FileOutputStream(storedFileName2);
	
	int numRead;
	
	//파일쓰기
	
	byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	
	while((numRead = is.read(b,0,b.length)) != -1){
	
	 os.write(b,0,numRead);//서버에 파일 생성(서버 초기화시 war이 배포되면서 사라짐)
	 os2.write(b,0,numRead);//로컬에 파일 생성
	
	}
	
	if(is != null) {
	
	 is.close();
	
	}
	
	os.flush();
	os.close();
	os2.flush();
	os2.close();
	
	//서버 주소 받아오기
	String root = request.getContextPath();
	
	
	//기본값
	//sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL=" + root + "/boardimage/"+realname;
	sFileInfo += "&bNewLine=true&sFileName="+ name+"&sFileURL=" +"/AcornSixman/upload/"+realname;
	
	BoardService service = new BoardService();
	String ContentId = request.getParameter("ContentId");
	String img = "/AcornSixman/upload/"+realname;
	service.showImg(img, ContentId);
	
	out.println(sFileInfo);

%>

