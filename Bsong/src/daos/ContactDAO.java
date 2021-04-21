package daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Category;
import model.Contact;
import model.Song;
import utils.ConnectDBUtils;
import utils.DefineUtil;

public class ContactDAO {
	private Connection conn;
	
	private Statement st;
	
	private PreparedStatement pst;
	
	private ResultSet rs;
	
	public List<Contact> getAll (){
		String sql = "SELECT * FROM contacts ORDER BY id DESC";
		List<Contact> contact = new ArrayList<>();
		conn = ConnectDBUtils.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while (rs.next()) {
				Contact contacts =new Contact(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("website"), 
						rs.getString("message"));
				contact.add(contacts);
			
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBUtils.close(st,rs,conn);
		}
		return contact;
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
		String sql = "DELETE FROM contacts WHERE id = ?";
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

	public int addItem(Contact item) {
		String sql = "INSERT INTO contacts(name, email, website, message) VALUES(?, ?,?,?)";
		int result=0;
		conn = ConnectDBUtils.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, item.getName());
			pst.setString(2, item.getEmail());
			pst.setString(3, item.getWebsite());
			pst.setString(4, item.getMessage());
			result = pst.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBUtils.close(pst,conn);
		}
		return result;
	}

	public int numberOfItem() {
		String sql = "SELECT COUNT(*) AS count FROM contacts";
		conn = ConnectDBUtils.getConnection();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
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

	public List<Contact> getAllPagination(int offset) {
		String sql = "SELECT * FROM contacts ORDER BY id DESC LIMIT ?,?";
		List<Contact> contact = new ArrayList<>();
		conn = ConnectDBUtils.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setInt(1, offset);
			pst.setInt(2, DefineUtil.NUMBER_PER_PAGE);
			rs = pst.executeQuery();
			while (rs.next()) {
				Contact contacts =new Contact(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("website"), 
						rs.getString("message"));
				contact.add(contacts);
			
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBUtils.close(st,rs,conn);
		}
		return contact;
		
	}

	public List<Contact> findAllByNameOderByNewName(Contact contactSearch) {
		String sql = "SELECT * FROM contacts WHERE 1";
		if(!"".equals(contactSearch.getName())) {
			sql += " AND name LIKE ?";
		}
		List<Contact> contact = new ArrayList<>();
		conn = ConnectDBUtils.getConnection();
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, "%" + contactSearch.getName() + "%");
			rs = pst.executeQuery();
			while (rs.next()) {
				Contact contacts =new Contact(rs.getInt("id"),
						rs.getString("name"),
						rs.getString("email"),
						rs.getString("website"), 
						rs.getString("message"));
				contact.add(contacts);
			
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			ConnectDBUtils.close(st,rs,conn);
		}
		return contact;
			}
}
