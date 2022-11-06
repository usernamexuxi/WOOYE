package com.wooye.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
   public static Connection getConnection() {
      try {
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Class.forName("org.gjt.mm.mysql.Driver");
        //return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/wooyedb?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=utf-8","root","root");
        return DriverManager.getConnection("jdbc:mysql://wooyeweb-db.ciltk7evuwgz.us-east-1.rds.amazonaws.com/wooyedb?serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=utf-8","WooyeAdmin","wooyeadmin_admin");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return null;
   }

   public static void close(PreparedStatement stmt, Connection conn) {
      if (stmt != null) {
         try {
            if (!stmt.isClosed())
               stmt.close();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            stmt = null;
         }
      }
      if (conn != null) {
         try {
            if (!conn.isClosed())
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            conn = null;
         }
      }
   }

   public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
      if (rs != null) {
         try {
            if (!rs.isClosed())
               rs.close();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            rs = null;
         }
      }
      if (stmt != null) {
         try {
            if (!stmt.isClosed())
               stmt.close();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            stmt = null;
         }
      }
      if (conn != null) {
         try {
            if (!conn.isClosed())
               conn.close();
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            conn = null;
         }
      }
   }
}