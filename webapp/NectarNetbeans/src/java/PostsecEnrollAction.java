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
public class PostsecEnrollAction {

    //public int div_num;
    public int div_numStem;
    public int div_num;
    public ArrayList data;
    public int rowTotal;

    public PostsecEnrollAction(HttpServletRequest request) {
        //div_num = parseInt(request, "div_num");
        div_numStem = parseInt(request, "div_numStem");
        div_num = parseInt(request, "div_num");
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

    public ArrayList getNonStemData() {
        // return cached copy if exists
        data = new ArrayList();
//        if (data != null) {
//            return data;
//        }

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

}
