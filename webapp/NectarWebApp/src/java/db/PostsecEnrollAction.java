package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 * PostsecEnrollAction - This class holds methods that will query the nectar 
 *         database to get the count of students enrolled in postsecondary 
 *         education from schools in STEM divisions and from schools not in
 *         STEM divisions.
 * 
 * @version 4/14/2017 
 * @author Andrew Fuller, Brandon Bautista, Mike Bittner, Connor Fowler
 */
public class PostsecEnrollAction {

    //public int div_num;
    public int div_numStem;
    public int div_num;
    public ArrayList data;
    public int rowTotal;

    public PostsecEnrollAction(HttpServletRequest request) {
        if ((parseInt(request, "div_numStem") == 0)) {
            div_numStem = 7;
            div_num = 1;
        } else {
            div_numStem = parseInt(request, "div_numStem");
            div_num = parseInt(request, "div_num");
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
     * getStemData - This method returns postsecondary enrollment data 
     *               related to schools in Virginia that are associated 
     *               with STEM schools.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getStemData() {

        data = new ArrayList();

        String sql = "SELECT * FROM postsec_enroll_per_stemschool(?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_numStem);

            ResultSet rs;
            rs = st.executeQuery();

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
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        return data;
    }

    /**
     * getNonStemData - This method returns postsecondary enrollment data 
     *                  related to schools in Virginia that are not associated 
     *                  with STEM schools.
     * 
     * @return - an ArrayList containing data returned from a SQL query 
     */
    public ArrayList getNonStemData() {

        data = new ArrayList();

        String sql = "SELECT * FROM postsec_enroll_per_school(?)";

        try {
            // set the query parameters
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);

            ResultSet rs;
            rs = st.executeQuery();

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
            // lazy hack to simplify hw5
            throw new RuntimeException(exc);
        }
        return data;
    }
    
    
    
    public ArrayList getAvgStemData() {
        
        data = new ArrayList();
        
        String sql = "SELECT * FROM stem_post_percentage(?)";
   
        try {
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_numStem);

            ResultSet rs;
            rs = st.executeQuery();

            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getLong(2));
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
        
        
    public ArrayList getAvgNonStemData() {
        
        data = new ArrayList();
        
        String sql = "SELECT * FROM non_stem_post_percentage(?)";
   
        try {
            Connection db = Database.open();
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt(1, div_num);

            ResultSet rs;
            rs = st.executeQuery();

            while (rs.next()) {
                data.add(rs.getString(1));
                data.add(rs.getLong(2));
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
