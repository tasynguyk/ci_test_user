<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Sutrixmedia | Edit</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="<?php echo base_url().'public/'; ?>assets/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<?php echo base_url().'public/'; ?>assets/css/bootstrap-responsive.css" rel="stylesheet">
<link href="<?php echo base_url().'public/'; ?>assets/css/prettify.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(document).ready(function (e) {
	$("#uploadForm").on('submit',(function(e) {
		e.preventDefault();
		$.ajax({
        	url: "<?php echo base_url().'index.php/ajax/ajax/xuly';?>",
			type: "POST",
			data:  new FormData(this),
			contentType: false,
    	    cache: false,
			processData:false,
			success: function(data)
		    {
			$("#targetLayer").html(data);
		    },
		  	error: function() 
	    	{
	    	} 	        
	   });
	}));
});
</script>

<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php echo base_url().'public/'; ?>assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php echo base_url().'public/'; ?>assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php echo base_url().'public/'; ?>assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="<?php echo base_url().'public/'; ?>assets/ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> <a class="brand" href="javascript:void(0)">Sutrixmedia <span>Admin Panel</span></a>
      <div class="btn-group pull-right"> <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <i class="icon-user icon-white"></i> <?php echo $this->session->userdata('username');?> <span class="caret"></span> </a>
        <ul class="dropdown-menu">
          <li><a href="<?php echo base_url().'index.php/login/log/profile';?>">Profile</a></li>
          <li class="divider"></li>
          <li><a href="<?php echo base_url().'index.php/login/log/logout'; ?>">Sign Out</a></li>
        </ul>
      </div>
      <ul class="nav pull-right">
        <li class="dropdown"> <a href="javascipt:void(0)" class="dropdown-toggle" data-toggle="dropdown">Dashboard<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="javascipt:void(0)">Update profile</a></li>
            <?php if($this->session->userdata("permission")!=0)
            {
                
                ?>
                <li class="nav-header">Admin Dashboard</li>
                <li><a href="<?php echo base_url().'index.php/admin/create';?>">Create user</a></li>
                <li><a href="<?php echo base_url().'index.php/manage/manage/index';?>">Manage user</a></li>
                <?php
            }?>
          </ul>
        </li>
      </ul>
    </div>
  </div>
</div>
<div class="container">
<div class="row">
  <div class="span12">
    <h1>Dashboard<small> Welcome to Sutrixmedia Panel</small></h1>
    <hr/>
    
    <hr/>
  </div>
  </div>
  <h2>Upload Image</h2>
  <form class="form-horizontal well" method="post" action="" id="uploadForm">
    <fieldset>
        <?php
            echo validation_errors();
            if(isset($error))
            {
              echo '<br />'.$error;
            }
        ?>
        
        <div class="control-group">
        <label class="control-label" for="fileInput">File input</label>
        <div class="controls">
          <input class="input-file" id="userImage" type="file" name="userImage">
        </div>
        
      </div>
        <div class="control-group">
        <label class="control-label"></label>
        <div class="controls">
            <div id="targetLayer">No Image</div>
      </div>
        
      </div>
        <div class="form-actions">
            <input type="submit" value="Upload" class="btnSubmit" id="upload" />
            <input type="submit" value="Change" class="btnSubmit" name="change"/>
      </div>
    </fieldset>
  </form>
  <hr/>
  <footer>
    <p>&copy; SutrixMedia 2012</p>
  </footer>
</div>
<!-- Le javascript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> 
<script src="<?php echo base_url().'public/'; ?>assets/js/bootstrap.min.js"></script> 
<script src="<?php echo base_url().'public/'; ?>assets/js/prettify.js"></script>
</body>
</html>