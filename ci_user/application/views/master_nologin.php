<?php
    $this->load->library('Acl');
    if($this->session->userdata('lang'))
    {
        $lang_use = $this->session->userdata('lang');
        $this->lang->load('form',$lang_use);
    }
    else
    {
        $this->session->set_userdata('lang','english');
        $this->lang->load('form','english');
    }
    if($this->session->userdata('theme'))
    {
        $theme_use = 'public/assets/'.$this->session->userdata('theme').'_theme/';
    }
    else
    {
        $theme_use = 'public/assets/default_theme/';
    }
    $this->session->set_userdata('cur_url',current_url());
    if($this->session->userdata('islogin'))
    {
        $id = $this->session->userdata('id');
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title><?php echo isset($page_title)?$page_title:''; ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="<?php echo base_url().$theme_use; ?>css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}
.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<?php echo base_url().$theme_use; ?>css/bootstrap-responsive.css" rel="stylesheet">
<link href="<?php echo base_url().$theme_use; ?>css/prettify.css" rel="stylesheet">
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

<!-- Le fav and touch icons -->
<?php echo isset($page_css)?$page_css:''; ?>
<?php echo isset($page_js)?$page_js:''; ?>
<link rel="shortcut icon" href="assets/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144" href="<?php echo base_url().$theme_use; ?>ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114" href="<?php echo base_url().$theme_use; ?>ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72" href="<?php echo base_url().$theme_use; ?>ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed" href="<?php echo base_url().$theme_use; ?>ico/apple-touch-icon-57-precomposed.png">
</head>
<body>
<div class="navbar navbar-fixed-top">
  <div class="navbar-inner">
    <div class="container-fluid"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> <a class="brand" href="javascript:void(0)">Sutrixmedia <span>Admin Panel</span></a>
      <div class="btn-group pull-right"> <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="javascript:void(0)"> <i class="icon-user icon-white"></i> <?php echo $this->session->userdata('username');?> <span class="caret"></span> </a>
        <ul class="dropdown-menu">
          <li><a href="<?php echo base_url().'index.php/login/log/';?>"><?php echo $this->lang->line('login'); ?></a></li>
          <li class="divider"></li>
          </ul>
      </div>
      <ul class="nav pull-right">
        
        <li class="dropdown"> <a href="javascipt:void(0)" class="dropdown-toggle" data-toggle="dropdown"><?php echo $this->lang->line('news'); ?><b class="caret"></b></a>
          <ul class="dropdown-menu">
                <li><a href="<?php echo base_url().'index.php/front/news/index'; ?>"><?php echo $this->lang->line('read'); ?></a></li>
          </ul>
        </li>
        <li class="dropdown"> <a href="javascipt:void(0)" class="dropdown-toggle" data-toggle="dropdown"><?php echo $this->lang->line('lang'); ?><b class="caret"></b></a>
          <ul class="dropdown-menu">
              <?php
                $q = $this->db->get("language");
                foreach ($q->result() as $l )
                {
                    ?>
                        <li><a href="<?php echo base_url().'index.php/change/lang/index/'.$l->code; ?>"><?php echo $l->name; ?></a></li>
                    <?php
                }
              ?>
                
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
  <h2><?php echo isset($page_sub_title)?$page_sub_title:''; ?></h2>
    <fieldset>
        <?php echo isset($page_content)?$page_content:''; ?>
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