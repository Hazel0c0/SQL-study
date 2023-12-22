import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JdbcExample {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            // 1. 데이터베이스 연결
            String url = "jdbc:mysql://localhost:3306/mydatabase";
            String user = "username";
            String password = "password";
            connection = DriverManager.getConnection(url, user, password);

            // 2. SQL 쿼리 실행
            String sql = "SELECT * FROM users WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, 1);  // 첫 번째 파라미터 설정

            // 3. 결과 처리
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                // 결과 출력 또는 다른 처리
                System.out.println("Name: " + name + ", Email: " + email);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 4. 자원 해제
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}

/* JDBC(Java Database Connectivity) 단점
모든 세부 사항을 직접 관리해야 한다.
데이터베이스를 열고 닫고, 예외처리, 결과 집합 처리 등 모든 것을 직접!
=> 이는 코드의 복잡성 증가
 */
