package com.fid.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.fid.beans.Project;

@Repository
public class ProjectDetailsDAO implements ProjectDetailDAOInteface {

private JdbcTemplate jdbcTemplate;

@Autowired
public void setDataSource(DataSource dataSource) {
    this.jdbcTemplate = new JdbcTemplate(dataSource);
}
	public List<Project> getProjectDetails(String username)
	{
		String sql="select * from project p where p.username = ?";
		return this.jdbcTemplate.query(sql,new Object[] {username},new ProjectDetailsMapper());
	}
	
	private class ProjectDetailsMapper implements RowMapper<Project>
	{

		@Override
		public Project mapRow(ResultSet rs, int count)
				throws SQLException {
			Project projectDetails=new Project();
			projectDetails.setpName(rs.getString(1));
			projectDetails.setProjectDesc(rs.getString(4));
			projectDetails.setStartDate(rs.getDate(5));
			projectDetails.setEndDate(rs.getDate(6));
			projectDetails.setStatus(rs.getInt(7));
			return projectDetails;
		}
		
	}
}
