import java.sql.*;
import java.util.*;

public class MySqlResultQuery {
    public static List<Map<String, Object>> getQueryResult(String url, String user, String pass, String query) {
        List<Map<String, Object>> resultList = new ArrayList<>();
        try {
            Connection conn = MySqlConnection.getConnection(url, user, pass);
            ResultSet rs = MySqlConnection.getResultQuery(query);
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();

            while (rs.next()) {
                Map<String, Object> row = new LinkedHashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.put(metaData.getColumnName(i), rs.getObject(i));
                }
                resultList.add(row);
            }

            MySqlConnection.closeConnection();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultList;
    }
}
