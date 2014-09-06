<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<head>
<title>Home</title>
<script src="<c:url value="/resources/js//jquery-1.10.2.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/pam.css"/>"  type="text/css"/>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap-select.js"/>"></script>
<script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/css/jquery-ui.css"/>">
<link rel="stylesheet" href="<c:url value="/resources/css/jquery.ui.theme.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap-select.css"/>">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.css" />">
<script src="<c:url value="/resources/js/bootstrap.js"/>"></script>
<script src="<c:url value="/resources/js/project.js"/>"></script>
</head>
<body>
<div class="âcontainerâ">
 <h3 class="title">Project Management tool</h3>
 </div>
  <div class="navbar">
              <div class="navbar-inner">
                <div class="container">
                      
					   <div class="btn-group">
					   <a class="btn btn-primary" href="#"><i class="icon-home icon-white"></i>Home</a>
					   </div>
					   <div class="btn-group">
					     
                        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-pencil icon-white"></i>Project&nbsp;&nbsp;&nbsp;<span class="caret"></span></a>
						  <ul class="dropdown-menu">
                            <li><a href="#" id="create"><i class="icon-pencil"></i>Create</a></li>
                            <li><a href="#" id="edit"><i class="icon-edit"></i> Edit</a></li>
                            <li><a href="#"><i class="icon-trash"></i>Delete</a></li>
                            <li class="divider"></li>
                          </ul>
						  </div>
						  
						  <div class="btn-group">
						  <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-tasks icon-white"></i>Tasks&nbsp;&nbsp;&nbsp;<span class="caret"></span></a>
						  <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-pencil"></i>Create Task</a></li>
                            <li><a href="#"><i class="icon-edit"></i> Edit Task</a></li>
                            <li><a href="#"><i class="icon-trash"></i>Delete Task</a></li>
                            <li class="divider"></li>
                          </ul>
					      </div>
						  <div class="btn-group">
						  <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-user icon-white"></i>Resource List&nbsp;&nbsp;&nbsp;<span class="caret"></span></a>
						  <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-search"></i>Search by Name</a></li>
                            <li><a href="#"><i class="icon-search"></i>Search by Skill</a></li>
                            <li class="divider"></li>
                          </ul>
					      </div>
				          <div class="btn-group">
						  <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#"><i class="icon-print icon-white"></i>Report&nbsp;&nbsp;&nbsp;<span class="caret"></span></a>
						  <ul class="dropdown-menu">
                            <li><a href="#"><i class="icon-file"></i>Project Report</a></li>
                            <li><a href="#"><i class="icon-file"></i>Task Report</a></li>
                            <li class="divider"></li>
                          </ul>
					      </div>
						  <div class="btn-group" id="signout">
						  <a class="btn btn-primary"  href="<c:url value="/j_spring_security_logout" />"><i class="icon-user icon-white"></i>Sign Out</a>
						  </div>

                </div>
              </div>
     </div>
 <div class="hero-unit" id="project-table">
	 <table class="table" id="projectable">
<thead>
<tr >
<th>Project Name</th>
<th>Description</th>
<th>Start Date</th>
<th>End Date</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<c:forEach items="${details}" var="project">
<tr>
<td>${project.pName}</td>
<td style="width:40%;">${project.projectDesc}</td>
<td>${project.startDate}</td>
<td>${project.endDate}</td>
<td>
<div class="progress" id="progress">
  <div class="bar" role="progressbar" style="width: 20%;">
  <div>${project.status}</div>
  </div>
</div>
</td>
<td><a href="#" onclick="EditRow(this)"><i class="icon-edit"></i>Edit</a>
<a href="#" onclick="deleteRow(this)" id="btnDelete"><i class="icon-trash"></i>Delete</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>	 
<div id="newproject">
<form id="creatproject">
<table>
<tr><td><label>Project Name</label></td><td>
   <input type="text" id="pname" placeholder="Enter the project name"/></td></tr>
<tr><td><label>Business Unit</label></td><td>
     <select class="selectpicker dropup show-tick show-menu-arrow" data-live-search="true" data-size="auto" id="bu" multiple title="Choose one of the following">
      <option>FIT</option>
      <option>FIMT</option>
      <option>FTEC</option>
	  <option>ICATS</option>
	  <option>FITG</option>
	</select>
	</td></tr>
<tr><td><label>Group</label></td><td>
     <select class="selectpicker dropup show-tick show-menu-arrow" data-live-search="true" data-size="auto" id="grp">
      <option>Capital Markets</option>
      <option>NF</option>
      <option>ICS</option>
	</select>
	</td></tr>
<tr><td><label>StartDate</label></td><td>
   <input type="text" id="startdate" placeholder="Select Start Date"/>
 </td></tr>
 <tr><td><label>EndDate</label></td><td>
   <input type="text" id="enddate" placeholder="Select End Date"/>
 </td></tr>
 <tr><td><label>Project Description</label></td><td>
  <textarea rows="4" cols="50" id="pdesc">
  </textarea>
 </td></tr>
 <tr><td><label>Status</label></td><td>
   <input type="text" id="status"/>
 </td></tr>
 <tr id="projectbutton"><td id="submit"> <a href="#"  class="btn btn-medium btn-success"></i> Submit <i class="icon-circle-arrow-right"></a></td>
 <td id="cancel"><a href="#"  class="btn btn-medium btn-danger"></i> Cancel <i class="icon-remove-circle"></a></td></tr>
</table>
</form>
</div>
<div id="editproject">
<form id="editform">
<table>
   <tr><td><label>Business Unit</label></td><td>
     <select class="selectpicker dropup show-tick show-menu-arrow" data-live-search="true" data-size="auto" id="buedit">
      <option>FIT</option>
      <option>FIMT</option>
      <option>FTEC</option>
	  <option>ICATS</option>
	  <option>FITG</option>
	</select>
	</td></tr>
	<tr><td><label>Group</label></td><td>
     <select class="selectpicker dropup show-tick show-menu-arrow" data-live-search="true" data-size="auto" id="grpedit">
      <option>Capital Markets</option>
      <option>NF</option>
      <option>ICS</option>
	</select>
	</td></tr>
	<tr><td><label>Project</label></td><td>
     <select class="selectpicker dropup show-tick show-menu-arrow" data-live-search="true" data-size="auto" id="prtedit">
      <option>PBO</option>
      <option>CAT-P</option>
      <option>API</option>
	</select>
	</td></tr>
	 <tr id="eprojectbutton"><td id="esubmit"><a href="#"  class="btn btn-medium btn-success"></i>Submit<i class="icon-circle-arrow-right"></a></td>
     <td id="ecancel"><a href="#"  class="btn btn-medium btn-danger"></i> Cancel <i class="icon-remove-circle"></a></td></tr>
	 </table>
</form>
</div>
</body>

</html>
