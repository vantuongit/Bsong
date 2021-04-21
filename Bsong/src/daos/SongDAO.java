package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import model.Category;
import model.Song;
import utils.ConnectDBUtils;
import utils.DefineUtil;

public class SongDAO {

		private Connection conn;
		
		private Statement st;
		
		private PreparedStatement pst;
		
		private ResultSet rs;
		
		public List<Song> getAllPagina (int offset){
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s INNER JOIN categories AS c ON s.cat_id = c.id ORDER BY s.id DESC LIMIT ?,?";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, offset);
				pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,rs,conn);
			}
			return songs;
		}
		public List<Song> getAll (int num){
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s INNER JOIN categories AS c ON s.cat_id = c.id ORDER BY s.id DESC LIMIT ?  ";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, num);
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public List<Song> getSearchSong (String search){
			String sql = "SELECT * FROM songs WHERE name LIKE ?";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, "'% search '%");
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public int add(Song song){
			String sql = "INSERT INTO songs (name, preview_text, detail_text,picture,cat_id) VALUES(?,?,?,?,?)";
			int result=0;
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, song.getName());
				pst.setString(2, song.getPreview_text());
				pst.setString(3, song.getDetail_text());
				pst.setString(4, song.getPicture());
				pst.setInt(5, song.getCategory().getId());
				result = pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,conn);
			}
			return result;
		}
		
		public int del (int id){
			String sql = "DELETE FROM songs WHERE id = ?";
			int result=0;
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1,id);
				result = pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,conn);
			}
			return result;
		}

		public Song getById(int id) {
			String sql = "SELECT name, preview_text, detail_text,picture,cat_id FROM songs WHERE id = ?";
			Song songs = null;
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				rs = pst.executeQuery();
				if (rs.next()) {
					songs =new Song(rs.getString("name"), rs.getString("preview_text"),rs.getString("detail_text"), rs.getString("picture"), new Category(rs.getInt("cat_id")));
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public int update (Song songs){
			String sql = "UPDATE songs SET name = ?, preview_text=?, detail_text = ?,cat_id = ?, picture = ? WHERE id = ?";
			int result=0;
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, songs.getName());
				pst.setString(2, songs.getPreview_text());
				pst.setString(3, songs.getDetail_text());
				pst.setInt(4, songs.getCategory().getId());
				pst.setString(5, songs.getPicture());
				pst.setInt(6, songs.getId());
				result = pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,conn);
			}
			return result;
		}
		public List<Song> getAllByCategory(int catId) {
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s INNER JOIN "
					+ "categories AS c ON s.cat_id = c.id "
					+ "WHERE cat_id = ? ORDER BY s.id DESC ";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, catId);
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public Song getSongDetail(int id) {
			String sql = "SELECT * FROM songs WHERE id = ?";
			Song songs = null;
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				rs = pst.executeQuery();
				if (rs.next()) {
					songs =new Song(rs.getInt("id"), rs.getString( "name"),rs.getString("preview_text"),rs.getString("detail_text") ,rs.getTimestamp("date_create"),rs.getString("picture"),rs.getInt("counter"),new Category(rs.getInt("cat_id")));
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public List<Song> getRelatedSong(Song song, int number) {
			List<Song> songs = new ArrayList<>();
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s INNER JOIN "
					+ "categories AS c ON s.cat_id = c.id "
					+ "WHERE cat_id = ? && s.id != ? ORDER BY s.id DESC LIMIT ?	 ";
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, song.getCategory().getId());
				pst.setInt(2, song.getId());
				pst.setInt(3, number);
				rs = pst.executeQuery();
			
				while (rs.next()) {
					Song songss =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(songss);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs; 
		}
		public void counterView(int id) {
			String sql = "UPDATE songs SET counter = counter + 1 WHERE id = ?";
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, id);
				pst.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,conn);
			}
		}
		public  int numberOfItems() {
			String sql = "SELECT COUNT(*) AS count FROM songs";
			conn = ConnectDBUtils.getConnection();
			try {
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				if (rs.next()) {
					int count = rs.getInt("count");
					return count;
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return 0;
		}
		public List<Song> getAllPagination(int offset) {
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s INNER JOIN "
					+ "categories AS c ON s.cat_id = c.id ORDER BY s.id DESC LIMIT ?,?  "; //(offdet, row_count)
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, offset);
				pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return songs;
		}
		public int numberOfItem(int catId) {
			String sql = "SELECT COUNT(*) AS count FROM songs WHERE cat_id = ?";
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, catId);
				rs = pst.executeQuery();
				while (rs.next()) {
					int count = rs.getInt("count");
					return count;
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return 0;
		}
		public List<Song> getAllByCategoryPagination(int offset, int catId) {
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s "
					+ "INNER JOIN categories AS c ON s.cat_id = c.id "
					+ "WHERE cat_id = ? ORDER BY s.id DESC LIMIT ?,?  ";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, catId);
				pst.setInt(2, offset);
				pst.setInt(3, DefineUtil.NUMBER_PER_PAGE);
				
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,rs,conn);
			}
			return songs;
		}
		public int numberOfItemSong() {
			String sql = "SELECT COUNT(*) AS count FROM songs";
			conn = ConnectDBUtils.getConnection();
			try {
				st = conn.createStatement();
				rs = st.executeQuery(sql);
				if (rs.next()) {
					int count = rs.getInt("count");
					return count;
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(st,rs,conn);
			}
			return 0;
			
		}
		public List<Song> getAllPaginations(int offset) {
			String sql = "SELECT * FROM songs BY id DESC LIMIR ?,? ";
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setInt(1, offset);
				pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
				
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,rs,conn);
			}
			return songs;
		}
		public List<Song> findAllByNameOderByNewName(Song songSearch) {
			String sql = "SELECT s.*, c.name AS catName FROM songs AS s"
					+ " INNER JOIN categories AS c ON "
					+ "s.cat_id = c.id WHERE 1 ";
					if(!"".equals(songSearch.getName())) {
						sql += " AND s.name LIKE ?";
					}
			List<Song> songs = new ArrayList<>();
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				if(!"".equals(songSearch.getName())) {
					pst.setString(1,"%"+songSearch.getName() +"%");
				}
				rs = pst.executeQuery();
				while (rs.next()) {
					Song song =new Song(rs.getInt("id"),
							rs.getString("name"),
							rs.getString("preview_text"),
							rs.getString("detail_text"), 
							rs.getTimestamp("date_create"),
							rs.getString("picture"), 
							rs.getInt("counter"), 
							new Category(rs.getInt("id"), rs.getString("catName")));
					songs.add(song);
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,rs,conn);
			}
			return songs;
		 }
		public boolean hasSong(String name) {
			String sql = "SELECT * FROM songs WHERE name = ?";
			conn = ConnectDBUtils.getConnection();
			try {
				pst = conn.prepareStatement(sql);
				pst.setString(1, name);
				rs = pst.executeQuery();
				if (rs.next()) {
					return true;
				}
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				ConnectDBUtils.close(pst,rs,conn);
			}
			return false;
			
		}
		
		
}
