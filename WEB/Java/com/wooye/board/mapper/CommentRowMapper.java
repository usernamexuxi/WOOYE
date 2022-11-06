package com.wooye.board.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.wooye.board.CommentVO;

public class CommentRowMapper {
	public CommentVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		CommentVO comment = new CommentVO();
		comment.setComment_num(rs.getInt("comment_num"));
		comment.setComment_content(rs.getString("comment_content"));
		comment.setBoard_num(rs.getInt("board_num"));
		comment.setId(rs.getString("id"));
		comment.setComment_date(rs.getString("comment_date"));
		return comment;
	}
}
