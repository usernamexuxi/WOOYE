package com.wooye.user.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.wooye.user.UserVO;

public class UserRowMapper implements RowMapper<UserVO> {
		public UserVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			UserVO users = new UserVO();
			users.setId(rs.getString("ID"));
			users.setPassword(rs.getString("PASSWORD"));
			users.setName(rs.getString("NAME"));
			users.setNickname(rs.getString("NICKNAME"));
			users.setBirth(rs.getString("BIRTH"));
			users.setNumber(rs.getString("NUMBER"));
			users.setBirth(rs.getString("BIRTH"));
			return users;
		}
	}
