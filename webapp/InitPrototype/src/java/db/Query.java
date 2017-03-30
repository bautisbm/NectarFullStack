package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 * CS 474 HW5: Dynamic Charts
 *
 * @author Andrew Fuller
 */
public class Query {

    //public int div_num;
    public String div_nameStem;
    public int div_num;
    public String subject;
    public String race;
    public String gender;
    public String disabil;
    public String lep;
    public String disadva;

    public ArrayList data;
    public int rowTotal;

    public Query(HttpServletRequest request) {
        //div_num = parseInt(request, "div_num");
        //div_nameStem = parseStr(request, "div_nameStem");
        div_num = parseInt(request, "div_num");
        subject = parseStr(request, "subject");
        race = parseStr(request, "race");
        gender = parseStr(request, "gender");
        disabil = parseStr(request, "disabil");
        lep = parseStr(request, "lep");
        disadva = parseStr(request, "disadva");
    }

    private int parseInt(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        try {
            return Integer.parseInt(str);
        } catch (NumberFormatException exc) {
            return 0;
        }
    }

    private String parseStr(HttpServletRequest request, String name) {
        String str = request.getParameter(name);
        if (str != null) {
            return str;
        } else {
            return "ALL";
        }
    }
    

    public ArrayList getNonStemData() {
        // return cached copy if exists
        data = new ArrayList();
//        if (data != null) {
//            return data;
//        }
        
        String sql = "SELECT sch_year, sch_name, avg_score FROM highschscores_per_nonstemdiv(?, ?, ?, ?, ?, ?, ?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);
            st.setString(2, subject);
            st.setString(3, race);
            st.setString(4, gender);
            st.setString(5, disabil);
            st.setString(6, lep);
            st.setString(7, disadva);
            
            ResultSet rs;
            rs = st.executeQuery();
            
////            rs.last();
////            rowTotal = rs.getRow();
////            rs.beforeFirst();
//            
////            data = new int[5][5];
////            for (int row = 0; row < 5; row++) {
////                data[row][0] = 2006 + row;  // school year
////                for (int col = 1; col < 5; col++) {
////                    rs.next();
////                    data[row][col] = rs.getInt(3);  // sol score
////                }
////            }
//
     
//
////            data = new int[9][3];
////            
//            for(int x = 0; x < 9 && rs.next(); x++)
//            {
//                data[x][0] = rs.getInt(1);
//                data[x][1] = rs.getInt(3);
//                for(int y = 2; y < 3 && rs.next(); y++)
//                {
//                    data[x][y] = rs.getInt(3);
//                }
//            }
            while(rs.next())
            {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getString(3));
            }


//            
//            // close database resources
            rs.close();
            st.close();
            db.close();
//            return data;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        return data;
    }
    
//    public int[][] getStemData() {
//        // return cached copy if exists
//        if (data != null) {
//            return data;
//        }
//        
//        String sql = "{ ? = call highschscores_per_stemdiv(?,?) }";
//
//        try {
//            // set the query parameters
//            Connection db = Database.open();
//            PreparedStatement st = db.prepareStatement(sql);
//            st.setString(1, div_nameStem);
//            st.setString(2, subject);
//
//            ResultSet rs = st.executeQuery();
//            data = new int[9][6];
//            for (int row = 0; row < 9; row++) {
//                data[row][0] = 2006 + row;  // school year
//                for (int col = 1; col < 6; col++) {
//                    rs.next();
//                    data[row][col] = rs.getInt(3);  // sol score
//                }
//            }
//
//            // close database resources
//            rs.close();
//            st.close();
//            db.close();
//            return data;
//        } catch (SQLException exc) {
//            // lazy hack to simplify hw5
//            throw new RuntimeException(exc);
//        }
//    }
//    
//        public int[][] getData() {
//        // return cached copy if exists
//        if (data != null) {
//            return data;
//        }
//        
//
//        
//        
//        // TODO Step 3: Execute SQL
//        String sql = "SELECT * FROM hw5sol(?, ?, ?, ?, ?, ?, ?)";
//        try {
//            
//            // set the query parameters
//            Connection db = Database.open();
//            PreparedStatement st;
//            st = db.prepareStatement(sql);
//            st.setString(1, div_nameStem);
//            st.setString(2, subject);
//            st.setString(3, race);
//            st.setString(4, gender);
//            st.setString(5, disabil);
//            st.setString(6, lep);
//            st.setString(7, disadva);
//            
//            // execute query, save results
//            ResultSet rs;
//            rs = st.executeQuery();
//            
//            data = new int[9][6];
//            
//            for(int x = 0; x < 9 && rs.next(); x++)
//            {
//                data[x][0] = rs.getInt(1);
//                data[x][1] = rs.getInt(3);
//                for(int y = 2; y < 6 && rs.next(); y++)
//                {
//                    data[x][y] = rs.getInt(3);
//                }
//            }
//            // close database resources
//            rs.close();
//            st.close();
//            db.close();
//            
//            return data;
//        } catch (SQLException exc) {
//            // lazy hack to simplify hw5
//            throw new RuntimeException(exc);
//        }
//    }

}
