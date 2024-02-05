<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.bean.Bean"%>
<%
    String rating=request.getParameter("star1");
    String feedback=request.getParameter("feedback");
    String email=(String)session.getAttribute("email");
    Bean b=new Bean();
    b.setEmail(email);
    b.setName(rating);
    b.setMobile(feedback);
    String query="INSERT INTO feedback (email,rating,feedback) VALUES (?,?,?)";
    int rowCount=userDao.Feedback(b, query);
    if(rowCount>0){
     request.getSession();
            session.setAttribute("success", "Feedback Submitted Successfully!");
    response.sendRedirect("userfeedback.jsp");
    }else{
         request.getSession();
            session.setAttribute("failed", "Failed to Submit Feedback!");
            response.sendRedirect("userfeedback.jsp");
    }
%>
