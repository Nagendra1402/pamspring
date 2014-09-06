package com.fid.dao;

import java.util.List;

import com.fid.beans.Project;

public interface ProjectDetailDAOInteface {

	public List<Project> getProjectDetails(String name);
}
