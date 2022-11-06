package com.wooye.join.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Repository;

import com.wooye.board.BoardVO;
import com.wooye.common.JDBCUtil;
import com.wooye.join.JoinArtVO;
import com.wooye.join.JoinArtistVO;
import com.wooye.join.JoinClassicVO;
import com.wooye.join.JoinEraVO;
import com.wooye.join.JoinMusicianVO;

@Repository("JoinTasteDAO")
public class JoinTasteDAO {
	// JDBC ���� ����
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	// SQL ��ɾ��
	private final String MYERA_INSERT = "insert into my_era(seq, id, title) values((select IFNULL(max(seq), 0)+1 from my_era ALIAS_FOR_SUBQUERY),?,?)";
	private final String MYARTIST_INSERT = "insert into my_artist(seq, id, title) values((select IFNULL(max(seq), 0)+1 from my_artist ALIAS_FOR_SUBQUERY),?,?)";
	private final String MYMUSICIAN_INSERT = "insert into my_musician(seq, id, title) values((select IFNULL(max(seq), 0)+1 from my_musician ALIAS_FOR_SUBQUERY),?,?)";
	private final String MYART_INSERT = "insert into my_art(seq, id, title) values((select IFNULL(max(seq), 0)+1 from my_art ALIAS_FOR_SUBQUERY),?,?)";
	private final String MYCLASSIC_INSERT = "insert into my_classic(seq, id, title) values((select IFNULL(max(seq), 0)+1 from my_classic ALIAS_FOR_SUBQUERY),?,?)";
	private final String MYERA_LIST = "select title from my_era where id=?";
	private final String MYARTIST_LIST = "select title from my_artist where id=?";
	private final String MYMUSICIAN_LIST = "select title from my_musician where id=?";
	private final String MYART_LIST = "select title from my_art where id=?";
	private final String MYCLASSIC_LIST = "select title from my_classic where id=?";
	private final String MYERA_D = "delete from my_era where id=?";
	private final String MYARTIST_D = "delete from my_artist where id=?";
	private final String MYMUSICIAN_D = "delete from my_musician where id=?";
	private final String MYART_D = "delete from my_art where id=?";
	private final String MYCLASSIC_D = "delete from my_classic where id=?";
	private final String TEST_ID_I = "insert into test_id(id) values(?)";
	private final String TEST_ID_D = "delete from test_id";

	// CRUD ����� �޼ҵ� ����
	// DB ���

	// �ô� ���� ����
	public void insert_era(String id, String title) {
		System.out.println("===> JDBC�� insert_era() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYERA_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ȭ�� ���� ����
	public void insert_artist(String id, String title) {
		System.out.println("===> JDBC�� insert_artist() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYARTIST_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ���ǰ� ���� ����
	public void insert_musician(String id, String title) {
		System.out.println("===> JDBC�� insert_musician() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYMUSICIAN_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ��ȭ ���� ����
	public void insert_art(String id, String title) {
		System.out.println("===> JDBC�� insert_art() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYART_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// Ŭ���� ���� ����
	public void insert_classic(String id, String title) {
		System.out.println("===> JDBC�� insert_classic() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYCLASSIC_INSERT);
			stmt.setString(1, id);
			stmt.setString(2, title);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// �Է��� �ô� ����Ʈ ��������
	public List<JoinEraVO> EraList(String id) {
		System.out.println("===> JDBC�� EraList() ��� ó��");
		List<JoinEraVO> eraList = new ArrayList<JoinEraVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYERA_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JoinEraVO era = new JoinEraVO();
				era.setTitle(rs.getString("TITLE"));
				eraList.add(era);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return eraList;
	}

	// �Է��� ȭ�� ����Ʈ ��������
	public List<JoinArtistVO> ArtistList(String id) {
		System.out.println("===> JDBC�� ArtistList() ��� ó��");
		List<JoinArtistVO> artistList = new ArrayList<JoinArtistVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYARTIST_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JoinArtistVO artist = new JoinArtistVO();
				artist.setTitle(rs.getString("TITLE"));
				artistList.add(artist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return artistList;
	}

	// �Է��� ���ǰ� ����Ʈ ��������
	public List<JoinMusicianVO> MusicianList(String id) {
		System.out.println("===> JDBC�� MusicianList() ��� ó��");
		List<JoinMusicianVO> musicianList = new ArrayList<JoinMusicianVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYMUSICIAN_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JoinMusicianVO musician = new JoinMusicianVO();
				musician.setTitle(rs.getString("TITLE"));
				musicianList.add(musician);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return musicianList;
	}

	// �Է��� ��ȭ ����Ʈ ��������
	public List<JoinArtVO> ArtList(String id) {
		System.out.println("===> JDBC�� ArtList() ��� ó��");
		List<JoinArtVO> artList = new ArrayList<JoinArtVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYART_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JoinArtVO art = new JoinArtVO();
				art.setTitle(rs.getString("TITLE"));
				artList.add(art);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return artList;
	}

	// �Է��� Ŭ���� ����Ʈ ��������
	public List<JoinClassicVO> ClassicList(String id) {
		System.out.println("===> JDBC�� ClassicList() ��� ó��");
		List<JoinClassicVO> classicList = new ArrayList<JoinClassicVO>();
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYCLASSIC_LIST);
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			while (rs.next()) {
				JoinClassicVO classic = new JoinClassicVO();
				classic.setTitle(rs.getString("TITLE"));
				classicList.add(classic);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return classicList;
	}

	// �ô� ���� ������ �� ����
	public void deleteMyEra(String id) {
		System.out.println("===> JDBC�� deleteMyEra() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYERA_D);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ������(ȭ��) ���� ������ �� ����
	public void deleteMyAritist(String id) {
		System.out.println("===> JDBC�� deleteMyAritist() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYARTIST_D);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ���ǰ� ���� ������ �� ����
	public void deleteMyMusician(String id) {
		System.out.println("===> JDBC�� deleteMyMusician() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYMUSICIAN_D);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// ��ȭ ���� ������ �� ����
	public void deleteMyArt(String id) {
		System.out.println("===> JDBC�� deleteMyArt() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYART_D);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// Ŭ���� ���� ������ �� ����
	public void deleteMyClassic(String id) {
		System.out.println("===> JDBC�� deleteMyClassic() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MYCLASSIC_D);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// �ӽ� ��� : �׽�Ʈ ���̵� �ֱ�
	public void testid(String id) {
		System.out.println("===> JDBC�� testid() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEST_ID_I);
			stmt.setString(1, id);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}

	// �ӽ� ��� : �׽�Ʈ ���̵� ���� �� ����
	public void testid_d(String id) {
		System.out.println("===> JDBC�� testid_d() ��� ó��");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(TEST_ID_D);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}
