package com.wooye.excon.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

import com.wooye.excon.ExconVO;

public class ExconRowMapper implements RowMapper<ExconVO>{
	public ExconVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ExconVO excon = new ExconVO();
		excon.setSeq(rs.getInt("seq"));
		excon.setUser_id(rs.getString("user_id"));
		excon.setExcon_seq(rs.getString("excon_seq"));
		excon.setExcon_name(rs.getString("excon_name"));
		excon.setStart_date(rs.getString("start_date"));
		excon.setEnd_date(rs.getString("end_date"));
		excon.setPlace(rs.getString("place"));
		excon.setGenre(rs.getString("genre"));
		return excon;
	}
}