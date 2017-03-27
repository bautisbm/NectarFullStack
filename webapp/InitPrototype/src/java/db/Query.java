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

    public String div_name;
    public String subject;
    public String race;
    public String gender;
    public String disabil;
    public String lep;
    public String disadva;

    private int[][] data;
    private ArrayList<String> divNames;

    public Query(HttpServletRequest request) {
        div_name = parseStr(request, "div_num");
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
    
    public ArrayList<String> getDivisions() {
        if(divNames != null) {
            return divNames;
        }
        
        String sql = "SELECT DISTINCT div_name "
                + "FROM non_stem_schools "
                + "ORDER BY div_name";
        
        try {
            Connection db = Database.open();
            PreparedStatement st;
            st = db.prepareStatement(sql);
            
            ResultSet rs;
            rs = st.executeQuery();
            
            while(rs.next()) {
                divNames.add(rs.getString(div_name));
            }
            
            for(String s : divNames) {
                System.out.println(s.toString());
            }
            
            // close database resources
            rs.close();
            st.close();
            db.close();
            
            } catch (SQLException exc) {
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        
        return null;
        //String sql = "SELECT "
    }

    public int[][] getData() {
        // return cached copy if exists
        if (data != null) {
            return data;
        }
        

        
        /*
        // TODO Step 3: Execute SQL
        String sql = "SELECT * FROM highSchScores_per_StemDiv(?, ?, ?, ?, ?, ?, ?)";
        try {
            
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st;
            st = db.prepareStatement(sql);
            st.setString(1, div_name);
            st.setString(2, subject);
            st.setString(3, race);
            st.setString(4, gender);
            st.setString(5, disabil);
            st.setString(6, lep);
            st.setString(7, disadva);
            
            // execute query, save results
            ResultSet rs;
            rs = st.executeQuery();
            
            //data = new ArrayList<>();
            
            data = new int[9][6];
            
            for(int x = 0; x < 9 && rs.next(); x++)
            {
                data[x][0] = rs.getInt(1);
                data[x][1] = rs.getInt(3);
                for(int y = 2; y < 6 && rs.next(); y++)
                {
                    data[x][y] = rs.getInt(3);
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
        */
        return null;
    }

}
