package com.wooye.ott.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;
import com.wooye.ott.OttVO;
import com.wooye.ott.UserOttVO;
import com.wooye.ott.CoinVO;
import com.wooye.common.JDBCUtil;

//DAO(Data Access Object)
@Repository("CoinDAO")
public class CoinDAO {
	// JDBC ���� ����
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL ��ɾ��
	private final String COIN_DEFAULT = "INSERT INTO cash(id, cash_get) values (?, ?)";
	private final String COIN_INSERT = "UPDATE cash SET cash_get = cash_get + ? WHERE id=? ";
	private final String COIN_MY = "select cash_get from cash where id=?";
	private final String F_DELETE = "delete from cash where id=?";

	// CRUD ����� �޼ҵ� ����
	// DB ���

	// ���� �ʱ� ����
	public void defaultcoin(String id) {
		System.out.println("===> JDBC�� defalutcoin() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COIN_DEFAULT);
			stmt.setString(1, id);
			stmt.setInt(2, 0);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ���� ����
	public void insertcoin(String id, int coin) {
		System.out.println("===> JDBC�� insertcoin() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COIN_INSERT);
			stmt.setInt(1, coin);
			stmt.setString(2, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ���̵�� ���� ���� Ȯ�� getMyCoin
	// ott �� ��ȸ
	public int getMyCoin(String id) {
		System.out.println("===> JDBC�� getMyCoin() ��� ó��");
		int coin = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(COIN_MY);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				coin = rs.getInt("cash_get");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return coin;
	}

	// Ż�� ȸ�� ���� ����
	public void dCoin(String id) {
		System.out.println("===> JDBC�� dCoin() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(F_DELETE);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

}