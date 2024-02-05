package com.codebook.user;

import com.codebook.Connections.ConnectionFactory;
import com.codebook.bean.Bean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

public class userDao {
    
    
    
   public static int Registration(Bean b, String query) {
    int rowCount = 0;

    try {
        ConnectionFactory.BuildConnection();
        Connection connection = ConnectionFactory.getConnection();

        // Use Statement to execute SET GLOBAL if needed
        try (Statement statement = connection.createStatement()) {
            statement.execute("SET GLOBAL max_allowed_packet=16777216"); // Adjust the size as needed
        }

        // Now create the PreparedStatement
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, b.getName());
            ps.setString(2, b.getEmail());
            ps.setString(3, b.getMobile());
            ps.setString(4, b.getGender());
            ps.setString(5, b.getAddress());
            ps.setString(6, b.getDob());
            ps.setString(7, b.getPassword());
            ps.setString(8, b.getCpassword());
            ps.setBlob(9, b.getBlob());

            rowCount = ps.executeUpdate();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return rowCount;
}



    
    public static ResultSet Retrieve(String query){
        ResultSet rs=null;
        try{
            ConnectionFactory.BuildConnection();
            Connection connection=ConnectionFactory.getConnection();
            PreparedStatement ps=connection.prepareStatement(query);
            rs=ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    
     public static int UpdateProfile(Bean b,String query){
        int rowCount=0;
        Connection connection=null;
        try{
             ConnectionFactory.BuildConnection();
            connection=ConnectionFactory.getConnection();
       PreparedStatement ps=connection.prepareStatement(query);
       ps.setString(1, b.getName());
       ps.setString(2, b.getEmail());
       ps.setString(3, b.getMobile());
       ps.setString(4, b.getGender());
       ps.setString(5, b.getDob());
       ps.setString(6, b.getAddress());
       if(b.getBlob().length()==0){
           String query1="SELECT * from user WHERE email='"+b.getEmail()+"'";
           ResultSet rs=userDao.Retrieve(query1);
           if(rs.next()){
           b.setBlob(rs.getBlob("image"));
           }
       }
       ps.setBlob(7, b.getBlob());
       rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
       return rowCount;
    }
     
    public static int ComplaintReg(Bean b,String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getEmail());
        ps.setString(2,b.getName() );
        ps.setString(3, b.getMobile());
        ps.setString(4, b.getDob());
        ps.setBlob(5, b.getBlob());
        ps.setString(6, b.getAddress());
        ps.setString(7, b.getDistName());
        ps.setString(8, b.getFlag());
        ps.setString(9, b.getTemp());
        ps.setString(10, b.getOrder());
        ps.setString(11, b.getCpassword());
        ps.setString(12, b.getPassword());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
    
      public static String ComplaintReg1(Bean b,String query){
        int rowCount=0;String status="";
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getEmail());
        ps.setString(2,b.getName() );
        ps.setString(3, b.getMobile());
        ps.setString(4, b.getDob());
        ps.setBlob(5, b.getBlob());
        ps.setString(6, b.getAddress());
        ps.setString(7, b.getDistName());
        ps.setString(8, b.getFlag());
        ps.setString(9, b.getTemp());
        ps.setString(10, b.getOrder());
        ps.setString(11, b.getCpassword());
        ps.setString(12, b.getPassword());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            status=e.getMessage();
        }
        return status;
    }
    
    public static int Feedback(Bean b,String query){
        int rowCount=0;
        try{
            ConnectionFactory.BuildConnection();
        Connection connection=ConnectionFactory.getConnection();
        PreparedStatement ps=connection.prepareStatement(query);
        ps.setString(1, b.getEmail());
        ps.setString(2,b.getName() );
        ps.setString(3, b.getMobile());
        rowCount=ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rowCount;
    }
      
}
