<%@page import="com.codebook.admin.adminDao"%>
<%@page import="java.sql.*"%>
<%
     String name=request.getParameter("name");
    String category=request.getParameter("category");
    String location=request.getParameter("location");
    String date=request.getParameter("date");
    String query = "SELECT * FROM complaints WHERE sus_name='" + name + "' && date='" + date + "' && category='" + category + "'&& incident='" + location + "'";
    ResultSet rs=adminDao.Retrieve(query);
    if(rs.next()){
        String q1="UPDATE complaints SET status='Completed' WHERE sus_name='" + name + "' && date='" + date + "' && category='" + category + "'&& incident='" + location + "'";
        int rowCount=adminDao.UpdateComplaint(q1);
        if(rowCount>0){
            request.getSession();
            session.setAttribute("success", "Successfully Marked as Complete!");
            response.sendRedirect("updateComplaints.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Mark as Complete!");
            response.sendRedirect("updateComplaints.jsp");
        }
    }else{
        request.getSession();
            session.setAttribute("failed", "Complaint not Exists!");
            response.sendRedirect("updateComplaints.jsp");
    }
%>
