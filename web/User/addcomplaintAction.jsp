
<%@page import="com.codebook.admin.Block"%>
<%@page import="com.codebook.admin.Blockchain"%>
<%@page import="com.codebook.user.userDao"%>
<%@page import="com.codebook.Connections.DynamicImage"%>
<%@page import="com.codebook.bean.Bean"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.sql.*"%>
<%
    Bean b=new Bean();
    String email=(String)session.getAttribute("email");
    b.setEmail(email);
     boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        DiskFileItemFactory factory = new DiskFileItemFactory();
       
        ServletFileUpload upload = new ServletFileUpload(factory);
        List<FileItem> items = upload.parseRequest(request);
        
     for(FileItem item: items){
        String fieldName=item.getFieldName();
        String fieldValue = item.getString();
         if (fieldName.equals("file")) {
         Blob img=DynamicImage.getBlobProfile(item);
            b.setBlob(img);
            
    }
            if (fieldName.equals("name")) {
                b.setName(fieldValue);
            } else if (fieldName.equals("complaint")) {
                b.setMobile(fieldValue);
            } else if (fieldName.equals("date")) {
                b.setDob(fieldValue);
            }  else if (fieldName.equals("incident")) {
                b.setAddress(fieldValue);
            }  
        }
  
   
    String mail=(String)session.getAttribute("email");
    
    Blockchain myDataBlockchain = (Blockchain) application.getAttribute("myDataBlockchain");

if (myDataBlockchain == null) {
    myDataBlockchain = new Blockchain();
    application.setAttribute("myDataBlockchain", myDataBlockchain);
}

// Assuming your blockchain stores data as name, complaint, location, and date
myDataBlockchain.addBlock(b.getName() + b.getMobile() + b.getAddress() + b.getDob());
String total="";
Block latestBlock = myDataBlockchain.getLatestBlock();
if (latestBlock != null) {
    b.setDistName(latestBlock.calculateHashForField("name"));
    b.setFlag(latestBlock.calculateHashForField("complaint"));
    b.setTemp(latestBlock.calculateHashForField("date"));
    b.setOrder(latestBlock.calculateHashForField("location"));
    b.setCpassword(latestBlock.getHash());
    b.setPassword(latestBlock.getPreviousHash());
}else {
        request.getSession();
            session.setAttribute("failed", "Blockchain is empty.!");
            response.sendRedirect("add-complaint.jsp");
    }

        String query="INSERT INTO complaints (user_email,sus_name,category,date,evidence,incident,nameHash,categoryHash,dateHash,incidentHash,complaintHash,previousHash) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        int rowCount=userDao.ComplaintReg(b, query);
        if(rowCount>0){
         request.getSession();
              session.setAttribute("success", "Complaint Registered Successfully!");
            response.sendRedirect("add-complaint.jsp");
        }else{
            request.getSession();
            session.setAttribute("failed", "Failed to Register Complaint!");
            response.sendRedirect("add-complaint.jsp");
        }
    } 
  
%>