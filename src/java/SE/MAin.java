/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SE;

import Data_access.DB_controller;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 *
 * @author moahmed A.Radwan
 */
public class MAin{
    
     

    public static void main(String[] args) throws SQLException, ParseException {
       DB_controller Db =DB_controller.Get_DB_controller();
       Db.Connect();
       
       System.err.println("mohamedsalah");
       System_manage sys = System_manage.Get_System_manage();
           ArrayList<Massage> list ;
             list = sys.getAllMessage(1);
             
            sys.Get_All_Device_Option();
             int messageId = list.get(0).getId();
             int senderId = list.get(0).getSenderId();
             int dateId = list.get(0).getDate_id();
             String Time = list.get(0).getTime();
             //String content = list.get(4).getContent();
             
            
             String senderName = sys.getSenderMessage(senderId);
             String dateMessage = sys.getDateMessage(dateId);
    
          
     for(int i = 0; i < list.size(); i++) {
       
              String content = list.get(i).getContent();                 
       //System.out.println("jj "+content);
    }
   User u ;
   Massage message = new Massage();
   message.setContent("heheheheheehe");
   message.setReciver(2);
   message.setSenderId(1);
   
   //sys.ReplyMessage(message);

 }
}

 


