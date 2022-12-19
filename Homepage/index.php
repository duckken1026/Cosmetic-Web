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

<body>
<!-- Shell -->
<nav class="navbar">
  <a href="../Homepage/index.html"><img class="nav-brand" src="../img/icon(title).png" alt=""></a>
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
    <div class="cl">&nbsp;</div>
    <!-- Content -->
    <div id="content">
      <!-- Content Slider -->
      <div id="slider" class="box">
        <div id="slider-holder">
          <ul>
            <li><a href="#"><img src="css/images/Brand_remove_makeup.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/MockUp.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/BBCream.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/Lipstick.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div id="slider-nav"> <a href="#" class="active">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> </div>
      </div>
      <!-- End Content Slider -->
    </div>
  </div>
</div>
  <div class="shell">

    <!-- Main -->
    <div id="main">
      <div class="cl">&nbsp;</div>
      <!-- Content -->
      <div id="content">
        <!-- Products -->
        <div class="products">
          <div class="cl">&nbsp;</div>
          <ul>
            <?php
            // include('../partial/head.php');
            // include('../partial/navbar.php');
            include('../config/connect.php');
            $sql = "SELECT * FROM product";
            $count = 0;
            $line = false;
            $res = mysqli_query($conn, $sql) or die(mysqli_error($link));
            if ($res == True) {

              while ($rows = mysqli_fetch_assoc($res)) {
                $id = $rows['ID'];
                $name = $rows['Name'];
                $price = $rows['Price'];
                $stock = $rows['Stock'];
                $image_src = $rows['image_src'];
                $count += 1;
                if ($count % 2 == 0) {
                  $line = true;
                }
                // else if ($count == 3)
                //     continue;
                else {
                  $line = false;
                }
                

            ?>
                <?php if ($line)
                  echo "<li class='last'>";
                else
                  echo "<li>";
                ?>
                <a href="#">
                  <img src=<?php echo $image_src ?> alt="" width="231px" height="383px" />
                </a>
                <div class="product-info">
                  <h3><?php echo $id?></h3>
                  <div class="product-desc">
                    <h4>WOMEN’S</h4>
                    <p>Lorem ipsum dolor sit<br />
                      amet</p>
                    <strong class="price">$58.99</strong>
                  </div>
                </div>
                </li>
                <!-- <?php if ($line == True) echo "<br>"; ?> -->
                <!-- <li> <a href="#"><img src="css/images/big1.jpg" alt="" /></a>
                  <div class="product-info">
                    <h3>LOREM IPSUM</h3>
                    <div class="product-desc">
                      <h4>WOMEN’S</h4>
                      <p>Lorem ipsum dolor sit<br />
                        amet</p>
                      <strong class="price">$58.99</strong>
                    </div>
                  </div>
                </li>
                <li class="last"> <a href="#"><img src="css/images/big1.jpg" alt="" /></a>
                  <div class="product-info">
                    <h3>LOREM IPSUM</h3>
                    <div class="product-desc">
                      <h4>WOMEN’S</h4>
                      <p>Lorem ipsum dolor sit<br />
                        amet</p>
                      <strong class="price">$58.99</strong>
                    </div>
                  </div>
                </li> -->
            <?php
              }
            }
            ?>
          </ul>
          <div class="cl">&nbsp;</div>
        </div>
        <!-- End Products -->
      </div>
      <!-- End Content -->
      <!-- Sidebar -->
      <div id="sidebar">
        <!-- Search -->
        <div class="box search">
          <h2>Search by <span></span></h2>
          <div class="box-content">
            <form action="#" method="post">
              <label>Keyword</label>
              <input type="text" class="field" />
              <label>Category</label>
              <select class="field">
                <option value="">-- Select Category --</option>
              </select>
              <div class="inline-field">
                <label>Price</label>
                <select class="field small-field">
                  <option value="">$10</option>
                </select>
                <label>to:</label>
                <select class="field small-field">
                  <option value="">$50</option>
                </select>
              </div>
              <input type="submit" class="search-submit" value="Search" />
              <p> <a href="#" class="bul">Advanced search</a><br />
                <a href="#" class="bul">Contact Customer Support</a>
              </p>
            </form>
          </div>
        </div>
        <!-- End Search -->
        <!-- Categories -->
        <div class="box categories">
          <h2>Categories <span></span></h2>
          <div class="box-content">
            <ul>
              <li><a href="#">Category 1</a></li>
              <li><a href="#">Category 2</a></li>
              <li><a href="#">Category 3</a></li>
              <li><a href="#">Category 4</a></li>
              <li><a href="#">Category 5</a></li>
              <li><a href="#">Category 6</a></li>
              <li><a href="#">Category 7</a></li>
              <li><a href="#">Category 8</a></li>
              <li><a href="#">Category 9</a></li>
              <li><a href="#">Category 10</a></li>
              <li><a href="#">Category 11</a></li>
              <li><a href="#">Category 12</a></li>
              <li class="last"><a href="#">Category 13</a></li>
            </ul>
          </div>
        </div>
        <!-- End Categories -->
      </div>
      <!-- End Sidebar -->
      <div class="cl">&nbsp;</div>
    </div>
    <!-- End Main -->
    <!-- Side Full -->
    <div class="side-full">
      <!-- More Products -->
      <div class="more-products">
        <div class="more-products-holder">
          <ul>
            <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small1.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small2.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small3.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small4.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small5.jpg" alt="" /></a></li>
            <li><a href="#"><img src="css/images/small6.jpg" alt="" /></a></li>
            <li class="last"><a href="#"><img src="css/images/small7.jpg" alt="" /></a></li>
          </ul>
        </div>
        <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
      </div>
      <!-- End More Products -->
      <!-- Text Cols -->
      <div class="cols">
        <div class="cl">&nbsp;</div>
        <div class="col">
          <h3 class="ico ico1">Donec imperdiet</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor, arcu
            felis ornare dui.</p>
          <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
        </div>
        <div class="col">
          <h3 class="ico ico2">Donec imperdiet</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor, arcu
            felis ornare dui.</p>
          <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
        </div>
        <div class="col">
          <h3 class="ico ico3">Donec imperdiet</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor, arcu
            felis ornare dui.</p>
          <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
        </div>
        <div class="col col-last">
          <h3 class="ico ico4">Donec imperdiet</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec imperdiet, metus ac cursus auctor, arcu
            felis ornare dui.</p>
          <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
        </div>
        <div class="cl">&nbsp;</div>
      </div>
      <!-- End Text Cols -->
    </div>
    <!-- End Side Full -->
    <!-- Footer -->
    <div id="footer">
      <p class="left"> <a href="#">Home</a> <span>|</span> <a href="#">Support</a> <span>|</span> <a href="#">My
          Account</a> <span>|</span> <a href="#">The Store</a> <span>|</span> <a href="#">Contact</a> </p>
      <p class="right"> &copy; 2010 Shop Around. Design by <a href="http://chocotemplates.com">Chocotemplates.com</a>
      </p>
    </div>
    <!-- End Footer -->
  </div>
  <!-- End Shell -->
</body>

</html>