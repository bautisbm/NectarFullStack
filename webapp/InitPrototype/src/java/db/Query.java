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
    public int div_numStem;
    public int div_num;
    public String subject;
    public String race;
    public String gender;
    public String disabil;
    public String lep;
    public String disadva;

    public ArrayList data;
    //public ArrayList data2;
    public int rowTotal;

    public Query(HttpServletRequest request) {
        //div_num = parseInt(request, "div_num");
        div_numStem = parseInt(request, "div_numStem");
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
    
     public ArrayList getStemData() {
       // return cached copy if exists
        data = new ArrayList();
//        if (data != null) {
//            return data;
//        }
        
        String sql = "SELECT sch_year, sch_name, avg_score FROM highschscores_per_stemdiv(?, ?, ?, ?, ?, ?, ?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_numStem);
            st.setString(2, subject);
            st.setString(3, race);
            st.setString(4, gender);
            st.setString(5, disabil);
            st.setString(6, lep);
            st.setString(7, disadva);
            
            ResultSet rs;
            rs = st.executeQuery();
            

            while(rs.next())
            {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getString(3));
            }


            
            // close database resources
            rs.close();
            st.close();
            db.close();
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        return data;
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
            

            while(rs.next())
            {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getString(3));
            }


            
            // close database resources
            rs.close();
            st.close();
            db.close();
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        return data;
    }
}
