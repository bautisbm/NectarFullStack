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
    public String div_nameNonStem;
    public String subject;
    public String race;
    public String gender;
    public String disabil;
    public String lep;
    public String disadva;

    private int[][] data;

    public Query(HttpServletRequest request) {
        //div_num = parseInt(request, "div_num");
        div_nameStem = parseStr(request, "div_nameStem");
        div_nameNonStem = parseStr(request, "div_nameNonStem");
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
    

    public int[][] getNonStemData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        
        String sql = "SELECT sch_year, sch_name, avg_score FROM highschscores_per_nonstemdiv(?,?,?,?,?,?,?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setString(1, div_nameNonStem);
            st.setString(2, subject);
            st.setString(3, race);
            st.setString(4, gender);
            st.setString(5, disabil);
            st.setString(6, lep);
            st.setString(7, disadva);
            

            ResultSet rs = st.executeQuery();
            
            rs.last();
            int rowTotal = rs.getRow();
            rs.beforeFirst();
            
            data = new int[rowTotal][3];
            for (int row = 0; row < rowTotal; row++) {
                data[row][0] = 2006 + row;  // school year
                for (int col = 1; col < 3; col++) {
                    rs.next();
                    data[row][col] = rs.getInt(3);  // sol score
                }
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            return data;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }
    
    public int[][] getStemData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        
        String sql = "{ ? = call highschscores_per_stemdiv(?,?) }";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setString(1, div_nameStem);
            st.setString(2, subject);

            ResultSet rs = st.executeQuery();
            data = new int[9][6];
            for (int row = 0; row < 9; row++) {
                data[row][0] = 2006 + row;  // school year
                for (int col = 1; col < 6; col++) {
                    rs.next();
                    data[row][col] = rs.getInt(3);  // sol score
                }
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            return data;
        } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
    }

}
