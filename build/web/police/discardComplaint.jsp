<%@page import="com.codebook.admin.adminDao,java.sql.*"%>
<%
    String location=request.getParameter("location");
    String name=request.getParameter("susname");
    String type=request.getParameter("type");
    String date=request.getParameter("date");
    String query="SELECT * FROM complaints WHERE sus_name='"+name+"' && date='"+date+"' && category='"+type+"'&& incident='"+location+"'";
    ResultSet rs=adminDao.Retrieve(query);
    String q1="";
    if(rs.next()){
        q1="UPDATE complaints SET status='Discarded' WHERE sus_name='"+name+"' && date='"+date+"' && category='"+type+"'&& incident='"+location+"'";
        int rowCount=adminDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Complaint Discarded Successfully!");
            response.sendRedirect("viewComplaints.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to discard complaint!");
            response.sendRedirect("viewComplaints.jsp");
        }
    }
%>
