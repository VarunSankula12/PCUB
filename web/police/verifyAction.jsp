<%@page import="com.codebook.admin.Block"%>
<%@page import="java.util.LinkedList"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%@page import="java.net.URLEncoder"%>
<%@ page import="java.util.Arrays" %>


<%
    String[] encrypted=new String[5];
    byte[] encrImg=null;
    Blob decrImg=null;
    String[] decrypted=new String[5];
    String location=request.getParameter("location");
    String name=request.getParameter("susname");
    String type=request.getParameter("type");
    String date=request.getParameter("date");
    String current=name+type+location+date;
    String prev="";String complaintHash="";
    String query="SELECT * FROM complaints WHERE sus_name='"+name+"' && date='"+date+"' && category='"+type+"'&& incident='"+location+"'";
    ResultSet rs=adminDao.Retrieve(query);
    String q1="";
    if(rs.next()){
    prev=rs.getString("previousHash");
    complaintHash=rs.getString("complaintHash");
    }
    
    Block bc=new Block(current,prev);
    String locationhash=bc.calculateHash();
    
    
   
    if(locationhash.equals(complaintHash)){
        q1="UPDATE complaints SET status='In Process' WHERE sus_name='"+name+"' && date='"+date+"' && category='"+type+"'&& incident='"+location+"'";
        int rowCount=adminDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Complaint has been Verified using Blockchain Successfully!");
            response.sendRedirect("verifyComplaint.jsp?name="+name+"&category="+type+"&location="+location+"&date="+date);
        }
        
    }else{
        request.getSession();
            session.setAttribute("failed", "Complaint has been Tampered!");
            response.sendRedirect("viewComplaints.jsp");
        out.println("Complaint has been Tampered");
    }
%>
