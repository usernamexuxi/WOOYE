package com.wooye.user.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;
import com.wooye.ott.CoinVO;
import com.wooye.user.UserVO;

public class OttRowMapper implements RowMapper<CoinVO> {
	public CoinVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CoinVO coin = new CoinVO();
		coin.setId(rs.getString("id"));
		coin.setCash_get(rs.getInt("cash_get"));
		return coin;
	}
}