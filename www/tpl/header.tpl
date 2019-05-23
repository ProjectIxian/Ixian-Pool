<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Ixian Mining Pool</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<meta name="description" content="Ixian mining pool">
<meta name="keywords" content="ixian, ixian mining, cryptocurrency">
<meta name="author" content="ixian.io">
    
<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
<link rel="manifest" href="site.webmanifest">
<link rel="mask-icon" href="safari-pinned-tab.svg" color="#5bbad5">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
    
<link rel="stylesheet" href="components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="components/font-awesome/css/all.min.css">
<link rel="stylesheet" href="components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet" href="dist/css/AdminLTE.css">
<link rel="stylesheet" href="dist/css/skins/skin-green-light.css">

<script src="components/jquery/dist/jquery.min.js"></script>
<script src="components/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="dist/js/adminlte.min.js"></script>
    

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet"> 

</head>

<body class="hold-transition skin-green-light layout-top-nav">
<div class="wrapper">
  <header class="main-header">
    <nav class="navbar navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <a href="index.php" class="navbar-brand"><b>Ixian</b>pool</a>
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
            <i class="fa fa-bars"></i>
          </button>
        </div>

        <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
            
          <form class="navbar-form navbar-left" role="search" action="index.php" method="get">

                <div class="input-group">
                    <input type="hidden" name="p" value="address">
                    <input type="text" name="id" class="form-control" placeholder="Address...">
                    <span class="input-group-btn">
                        <button type="submit" id="search-btn" class="btn btn-outline">
                        <i class="fa fa-search"></i>
                        </button>
                    </span>
                </div>
          </form>
            
          <ul class="nav navbar-nav">
            <li><a href="?p=miners">Miners</a></li>
            <li><a target="_blank" href="https://www.ixian.io/?page=downloads">Downloads</a></li>
            <li><a target="_blank" href="https://explorer.ixian.io">Explorer</a></li>
            <li><a target="_blank" href="https://ixian.io">Ixian.io</a></li>
              
          </ul>
        </div>


      </div>

    </nav>
  </header>
    
<div class="content-wrapper">

    
