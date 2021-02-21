/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Data_access;

import SE.General_massge;
import SE.Massage;
import SE.System_manage;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohamed Salah
 */
public class DB_controller {

    private Connection DB_controller;
    private static DB_controller Controller = null;
    
    
    private DB_controller()
    {
    }
    
    public static DB_controller Get_DB_controller()
    {
        if(Controller == null)
            Controller = new DB_controller();
        return Controller;
    }

    public void Connect() {
        try {
              if(DB_controller == null || DB_controller.isClosed())
              {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                DB_controller = DriverManager.getConnection("jdbc:mysql://localhost:3306/dp_phase2?zeroDateTimeBehavior=convertToNull", "root", "");
                System.out.println("Done");
              }
         } catch (Exception x) {
             System.err.println(x.getMessage());
         }
    }

    public  void Close() {
        try {
            if(!DB_controller.isClosed())
            {
                DB_controller.close();
                System.out.println("CloseDB Done");
            }
        } catch (SQLException ex) {
            System.out.println("Eror in function close DB");
        }
    }
   //sala7
    public  ResultSet Select(String FieldName, String TableName, String Condetion) {
        String Query="SELECT " +FieldName+ " FROM "+ TableName+ " WHERE " +Condetion;
         System.out.println(Query);
        try
        {
            PreparedStatement pre=DB_controller.prepareStatement(Query);
            ResultSet result=pre.executeQuery();
            return result;
        }
        
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
       
        return null;
    }
    
     public HashMap<String, String> SelectStatement(String FieldName, String TableName, String Condetion) {
        HashMap<String,String> Result=null;
        String Query = "SELECT " + FieldName + " FROM " + TableName + " WHERE " + Condetion;
        System.out.println(Query);
        try {
            PreparedStatement pre = DB_controller.prepareStatement(Query);
            ResultSet ResultSet = pre.executeQuery();
            while (ResultSet.next()) {
                Result=new HashMap<>();
                ResultSetMetaData r = ResultSet.getMetaData();
                for (int i = 1; i <= r.getColumnCount(); i++)
                {
                    Result.put(r.getColumnName(i), ResultSet.getString(i));
                }
            }
            return Result;
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }
  
    
       public int SelectCount( String TableName, String IDNAME , String condition) {
      
        String Query = "SELECT COUNT("+IDNAME+") FROM " + TableName + "WHERE" + condition;
        try
        {
            PreparedStatement pre=DB_controller.prepareStatement(Query);
            ResultSet result=pre.executeQuery();
            while(result.next())
            {
            return result.getInt(1);
            }
        }
        catch(Exception e)
        {
            System.out.println(e.getMessage());
        }
        return 0;
    } 
    
    //sala7

    public int Login(String email , String Password)
    {
        try {
            String ss = "SELECT User_id FROM user WHERE Email=? and Password = ?" ;
            PreparedStatement pre = DB_controller.prepareStatement(ss);
            pre.setString(1, email);
            pre.setString(2, Password);
            ResultSet res = pre.executeQuery();
            int id = -1;
            while(res.next())
            {
                id = res.getInt("User_id");
            }
            return id;
        } catch (SQLException ex) {
            Logger.getLogger(DB_controller.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    
    //sala7
   public  ResultSet Select_BY_Like_Statement(String FieldName, String TableName, String pattern) {
           String Query="SELECT " +FieldName+ " FROM "+ TableName+ " WHERE " + pattern;
       try
       {
           PreparedStatement pre=DB_controller.prepareStatement(Query);
           ResultSet result=pre.executeQuery();
           return result;
       }
       catch(Exception e)
       {
           System.out.println(e.getMessage());
       }
       return null;
   }
    
   
   
   //sala7
    public  boolean Delete(String TableName, String condition) {
        String Query = "DELETE FROM " + TableName + " WHERE " + condition;
        try {
            PreparedStatement pre = DB_controller.prepareStatement(Query);
            pre.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }
    }
    //sala7
    public  boolean Update(String TableName, String FieldName, String Condition) {
        String Query = "UPDATE " + TableName + " set " + FieldName + " WHERE " + Condition;
        try {
            PreparedStatement pre = DB_controller.prepareStatement(Query);
            pre.executeUpdate();
            return true;
        } catch (SQLException ex) {
            System.err.println(ex.getMessage());
            return false;
        }
    }

  
    
     //Emad
    public int Insert(String TableName, HashMap<String, String> values) {
        String key = "";
        String value = "";
        ResultSet rs = null;
        for (Map.Entry<String, String> entry : values.entrySet()) {
            key += entry.getKey() + ",";
            value += "?" + ",";
        }
        String Attributes = "";
        String Values = "";
        for (int i = 0; i < key.length() - 1; i++) {
            Attributes += key.charAt(i);
        }
        for (int i = 0; i < value.length() - 1; i++) {
            Values += value.charAt(i);
        }
        Attributes = "(" + Attributes + ")";
        Values = "(" + Values + ")";
        String Query = "INSERT INTO " + TableName + " " + Attributes + " VALUES " + Values + " ";
        System.out.println(Query);
        try {
            PreparedStatement pre = DB_controller.prepareStatement(Query, Statement.RETURN_GENERATED_KEYS);
            int counter=0;
        for (Map.Entry<String, String> entry : values.entrySet()) {
            pre.setString(++counter, entry.getValue());
        }
        
            pre.executeUpdate();
            rs = pre.getGeneratedKeys();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException ex) {
            System.out.println("Error in Insert Function" + ex);
        }
        return -1;
    }
    
    
}
