<%@page import="com.codebook.admin.adminDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="java.sql.*"%>
<%
    String email=request.getParameter("email");
    String password=request.getParameter("password");
    String query="SELECT * FROM admin WHERE email='"+email+"' && password='"+password+"'";
    ResultSet rs=adminDao.Retrieve(query);
    if(rs.next()){
        request.getSession();
    session.setAttribute("success", "Login Successful!");
    response.sendRedirect("police/police-dashboard.jsp");
    }else{
        request.getSession();
    session.setAttribute("failed", "Login Failed!");
    response.sendRedirect("police-login.jsp");
        out.println("Failed");
    }
%>
