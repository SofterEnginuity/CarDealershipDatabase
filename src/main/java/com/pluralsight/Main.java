package com.pluralsight;

import java.sql.*;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.println("Hello, World!");

        Class.forName("com.mysql.cj.jdbc.Driver");

        Connection connection;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cardealership", "root", "P@ssw0rd");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        Statement statement = connection.createStatement();

        String query = """
        SELECT ProductID, ProductName, UnitPrice, UnitsInStock  FROM northwind.products""";
        ResultSet results = statement.executeQuery(query);
        while (results.next()){
            System.out.println("Printing things");
//            String productName = results.getString("ProductName");
//            System.out.println("ProductID: " + productID);

        }



        connection.close();

    }
}