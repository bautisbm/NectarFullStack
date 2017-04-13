package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 * Query - This class will validate and process user input. It will 
 *         manage and handle running specified SQL queries on the 
 *         Nectar database.
 * 
 * @version 4/10/2017 
 * @author Andrew Fuller, Brandon Bautista, Mike Bittner, Connor Fowler
 */
public class Query {

    public int div_numStem;
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
        if (parseStr(request, "subject").equals("ALL")) {
            div_numStem = 7;
            div_num = 1;
            subject = "MATH";
        } else {
            div_numStem = parseInt(request, "div_numStem");
            div_num = parseInt(request, "div_num");
            subject = parseStr(request, "subject");
        }
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
    
    /**
     * getStemData - This method returns data related to STEM schools
     *               in Virginia.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getStemData() {

        data = new ArrayList();

        String sql = "SELECT sch_year, sch_name, avg_score FROM highschscores_per_stemdiv(?, ?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_numStem);
            st.setString(2, subject);

            ResultSet rs;
            rs = st.executeQuery();

            // propagate data to ArrayList (data)
            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getString(3));
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
        return data;
    }

    /**
     * getNonStemData - This method returns data related to schools
     *                  in Virginia that are not associated with STEM schools.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getNonStemData() {

        data = new ArrayList();

        String sql = "SELECT sch_year, sch_name, avg_score FROM highschscores_per_nonstemdiv(?, ?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);
            st.setString(2, subject);


            ResultSet rs;
            rs = st.executeQuery();

            // propagate data to ArrayList (data)
            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getString(3));
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
        return data;
    }
    
    /**
     * getAVGNonStemData - This method returns average test score data related 
     *                     to STEM schools in Virginia.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getAVGNonStemData() {

        data = new ArrayList();

        String sql = "SELECT * FROM normDiv_solSubResultavgs(?, ?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);
            st.setString(2, subject);

            ResultSet rs;
            rs = st.executeQuery();
            
            // propagate data to ArrayList (data)
            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getLong(3));
            }

            // close database resources
            rs.close();
            st.close();
            db.close();
            
        } catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
        return data;
    }

    /**
     * getAVGStemData - This method returns average test score data related 
     *                  to schools in Virginia that are not associated with 
     *                  STEM schools.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getAvgStemData() {
        
        data = new ArrayList();
        
        String sql = "SELECT * FROM average_stem_sol(?, ?)";
   
        try {
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_numStem);
            st.setString(2, subject);

            ResultSet rs;
            rs = st.executeQuery();

            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getString(2));
                data.add(rs.getLong(3));
            }

            rs.close();
            st.close();
            db.close();
        } 
        catch (SQLException exc) {
            throw new RuntimeException(exc);
        }
        return data;
    }

}
