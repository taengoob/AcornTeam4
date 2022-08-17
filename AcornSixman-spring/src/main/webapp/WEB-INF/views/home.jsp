<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Spring boot sample</title>
	</head>
	<body>
		<c:forEach items="${nameList}" var = "name">
			<div>Hello <c:out value="${name}" /></div>
		</c:forEach>
		<div><c:out value="${currentTime}" /></div>
		
		<%-- <div>Hello <%=request.getAttribute("name")%></div>
		sun.boot.class.path : <%= System.getProperty("sun.boot.class.path") %>
		<br>
		sun.boot.library.path : <%= System.getProperty("sun.boot.library.path") %>
		<br>
		java.library.path : <%= System.getProperty("java.library.path") %>
		<br>
		java.class.path : <%= System.getProperty("java.class.path") %>
		<br>
		getClassLoader() : <%= this.getClass().getClassLoader() %>
		<br>
		DocumentBuilderFactory : <%= javax.xml.parsers.DocumentBuilderFactory.newInstance() %>
		<br>
		/javax/xml.parsers/DocumentBuilderFactory.class : <%= this.getClass().getResource("/javax/xml.parsers/DocumentBuilderFactory.class") %>
		<br>
		SAXParserFactory : <%= javax.xml.parsers.SAXParserFactory.newInstance() %>
		<br>
		/javax/xml/parsers/SAXParserFactory.class : <%= this.getClass().getResource("/javax/xml/parsers/SAXParserFactory.class") %>
		<br>
		TransformerFactory : <%= javax.xml.transform.TransformerFactory.newInstance() %>
		<br>
		/javax/xml/transform/TransformerFactory.class : <%= this.getClass().getResource("/javax/xml/transform/TransformerFactory.class") %>
		<hr>
		Servlet : <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %>
		<br>
		JSP : <%= javax.servlet.jsp.JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %>
		<br>
		ServerInfo : <%= application.getServerInfo() %>
		<br>
		RealPath : <%= application.getRealPath("/") %>
		<br>
		ContextPath : <%= request.getContextPath()%>
		<hr>
		totalMemory : <%= Runtime.getRuntime().totalMemory() %>
		<br>
		maxMemory : <%= Runtime.getRuntime().maxMemory() %>
		<br>
		freeMemory : <%= Runtime.getRuntime().freeMemory() %>
		<hr> --%>
	</body>
</html>
