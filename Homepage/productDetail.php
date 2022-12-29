<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>Shop Around</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--[if lte IE 6]><link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" /><![endif]-->
<script src="js/jquery-1.4.1.min.js" type="text/javascript"></script>
<script src="js/jquery.jcarousel.pack.js" type="text/javascript"></script>
<script src="js/jquery-func.js" type="text/javascript"></script>
<script src="js/functionLibrary.js" type="text/javascript"></script>
</head>

<body style>
<!-- Shell -->
<nav class="navbar">
  <a href="../Homepage/index.php"><img class="nav-brand" src="../img/icon(title).png" alt=""></a>
  <div class=" nav-list">
    <div class = "Headee" id = "Homepage" ><a href="index.php"><b>首頁</b></a></div>
    <div class = "Headee" id = "Popular" ><a href="./popular.html"><b>流行</b></a></div>
    <div class = "Headee" id = "Recommendation"><a href="./anime.html"><b>推薦</b></a></div>
    <div class = "Headee" id = "AllIn">  <a href="./about.html"><b>儲值</b></a></div>
    <div class = "Headee" id = "Login"><a href="../Login/Login.html"><b>登入</b></a></div>
    <a href="#" class="cart-link">Your Shopping Cart</a>
  </div>
</nav>
<div class="shell">
  <!-- Header -->
  <br>  <br>  <br>  <br>
  <div>
    <!-- Cart -->
      <div class="cl">&nbsp;</div>
    <!-- End Cart -->
    <!-- Navigation -->
    <!-- End Navigation -->
  </div>
  <!-- End Header -->
  <!-- Main -->
  <div id="main">
    <input type ="button" onclick="javascript:location.href='index.php'" value="回上頁" ></input>
    <?php 
        $id = $_GET['id'];
        session_start();
        $count = $_SESSION['count']; 
        echo "<br>";
    ?>
    <?php
            // include('../partial/head.php');
            // include('../partial/navbar.php');
            include('../config/connect.php');
            $sql = "SELECT * FROM product Where ID = $id";
            $count = 0;
            $_SESSION['count'] = 0;
            $line = false;
            $res = mysqli_query($conn, $sql) or die(mysqli_error($link));
            $_SESSION['img'] = array();//存照片的陣列 
            if ($res == True) {

              while ($rows = mysqli_fetch_assoc($res)) {
                $id = $rows['ID'];
                $name = $rows['Name'];
                $price = $rows['Price'];
                $stock = $rows['Stock'];
                $detail = $rows['detail'];
                $_SESSION['image_src'] = $rows['image_src'];
                $_SESSION['count'] += 1;
                array_push($_SESSION['img'], $_SESSION['image_src']);//存入照片
                if ($count % 3 == 0) {
                  $line = true;
                }
                // else if ($count == 3)
                //     continue;
                else {
                  $line = false;
                }
                ?>
                
                <img style="margin-bottom:30px; "src=<?php echo $_SESSION['image_src'] ?> alt="" width="500px" height="500px" />
                <p style="font-size:40px; "><?php echo $name ?></p></br></br>
                <p style="font-size:30px; ">價格:<?php echo $price ?></p></br></br>
                <p style="font-size:30px; ">商品敘述:<p></br>
                <p style="font-size:30px; line-height:35px"><?php echo $detail ?><p></br></br></br>
              <?php
              }
              
            }

            ?>

     
  </div> 
  
</div>
  
</body>

</html>