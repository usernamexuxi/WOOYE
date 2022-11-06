package com.wooye.board.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;
import com.wooye.board.CleanCommentVO;

public class CleanBoardCommentRowMapper implements RowMapper<CleanCommentVO> {
	public CleanCommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CleanCommentVO cleanc = new CleanCommentVO();
		cleanc.setId(rs.getString("id"));
		cleanc.setBoard_num(rs.getInt("board_num"));
		cleanc.setComment_num(rs.getInt("comment_num"));
		cleanc.setComment_writer(rs.getString("comment_writer"));
		cleanc.setComment_content(rs.getString("comment_content"));
		return cleanc;
	}
}
