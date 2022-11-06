package com.wooye.board.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.wooye.board.CleanBoardVO;

public class CleanBoardRowMapper implements RowMapper<CleanBoardVO> {
	public CleanBoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CleanBoardVO cleanb = new CleanBoardVO();
		cleanb.setId(rs.getString("id"));
		cleanb.setBoard_num(rs.getInt("board_num"));
		cleanb.setBoard_writer(rs.getString("board_writer"));
		cleanb.setBoard_title(rs.getString("board_title"));
		return cleanb;
	}
}
