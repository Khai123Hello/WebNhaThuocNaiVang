/**
*Project name: ShopBanHang
*Version : 1.0
*Created date : 12 thg 3, 2019
*Description: Create by MyPC
*Copyright (c) 2019 by TeddyShoes. All rights reserved.
*/
package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author MyPC
 *
 */
public class DBConnect {
	public Connection cn;
	public void KetNoi() throws Exception{
		String hostName = "localhost";
		String database = "WebBanHang";
		String userName = "thanhhoa";
		String password = "123";
		// Xac dinh he quan tri co so du lieu
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			cn = DriverManager.getConnection("jdbc:sqlserver://"+hostName+":1433;databaseName="+database+";user="+userName+";password="+password);
	}
	public static void main(String[] args) throws Exception {
		DBConnect  c = new DBConnect();
		c.KetNoi();
		System.out.println("ok");
	}

}
