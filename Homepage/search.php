<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <title>Shop Around</title>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
    <link rel="stylesheet" href="css/ie6.css" type="text/css" media="all" />
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
            <div class="Headee" id="Homepage"><a href="index.php"><b>首頁</b></a></div>
            <div class="Headee" id="Popular"><a href="./popular.html"><b>流行</b></a></div>
            <div class="Headee" id="Recommendation"><a href="./anime.html"><b>推薦</b></a></div>
            <div class="Headee" id="Login"><a href="../Login/Login.php"><b>登入</b></a></div>
            <a href="#" class="cart-link">Your Shopping Cart</a>
        </div>
    </nav>
    <div class="shell">
        <!-- Header -->
        <br> <br> <br> <br>
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
                        $line = false;
                        $count = 0;
                        $_SESSION['count'] = 0;
                        require("../config/connect.php");
                        $keywords = $_POST['keywords'];
                        $sql = "select * from product where Name like '%" . $keywords . "%'";
                        $result = mysqli_query($conn, $sql);
                        if (!$result) {
                            die('無法讀取' . mysqli_error($conn));
                        }
                        if (mysqli_num_rows($result) == 0)
                            echo "<h1>無此商品</h1>";
                        while ($row = mysqli_fetch_array($result)) {
                            $image = $row['image_src'];
                            $name = $row['Name'];
                            $price = $row['Price'];
                            $stock = $row['Stock'];
                            $_SESSION['count'] += 1;
                            if ($count % 3 == 0) {
                                $line = true;
                            } else {
                                $line = false;
                            }
                            if ($line == true)
                                echo "<li class='last'>";
                            else
                                echo "<li>";
                        ?>
                            <a href="productDetail.php">
                                <img src=<?php echo $image ?> alt="" width="231px" height="200px" />
                            </a>
                            <div class="product-info">
                                <div class="product-desc">
                                    <!-- <h4>WOMEN’S</h4> -->
                                    <p><?php echo $name ?></p>
                                    <strong class="price">$<?php echo $price ?></strong>
                                </div>
                            </div>
                            </li>
                        <?php
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
                        <form action="./search.php" method="post">
                            <label>Keyword</label>
                            <input type="text" class="field" name="keywords" />
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
                        <?php
                        $sql = "SELECT * FROM product";
                        $count = 0;
                        $last = false;
                        $res = mysqli_query($conn, $sql) or die(mysqli_error($link));
                        while ($rows = mysqli_fetch_assoc($res)) {
                            $id = $rows['ID'];
                            $name = $rows['Name'];
                            $price = $rows['Price'];
                            $stock = $rows['Stock'];
                            $image_src = $rows['image_src'];
                            $count += 1;

                            if ($count >= 7) {
                                $out = true;
                            } else if ($count == 17) {
                                $last = true;
                            } else {
                                $out = false;
                                continue;
                            }
                        ?>
                            <li><a href="#"><img src=<?php if ($out) echo $image_src ?> alt="" width="100px" height="100px" /></a></li>
                        <?php
                            if ($last) echo "<li class='last'><a href='#'><img src='css/images/small7.jpg' alt='' /></a></li>";
                        }
                        ?>
                    </ul>
                </div>
                <div class="more-nav"> <a href="#" class="prev">previous</a> <a href="#" class="next">next</a> </div>
            </div>
            <!-- End More Products -->
            <!-- Text Cols -->
            <div class="cols">
                <div class="cl">&nbsp;</div>
                <div class="col">
                    <h3 class="ico ico1">Jimbo</h3>
                    <p>這是我們網頁Develpers之一，下面是他的github</p>
                    <p class="more"><a href="https://github.com/JimboMachine" class="bul">JimboMachine</a></p>
                </div>
                <div class="col">
                    <h3 class="ico ico1">DuckKen</h3>
                    <p>這是我們網頁Develpers之一，下面是他的github</p>
                    <p class="more"><a href="https://github.com/duckken1026" class="bul">duckken1026</a></p>
                </div>
                <div class="col">
                    <h3 class="ico ico1">Donec imperdiet</h3>
                    <p>這是我們網頁Develpers之一，下面是他的github</p>
                    <p class="more"><a href="https://github.com/YenChieh0716" class="bul">YenChieh0716</a></p>
                </div>
                <div class="col col-last">
                    <h3 class="ico ico1">Donec imperdiet</h3>
                    <p>這是我們想做蝦皮這類型的網站，根據上學期APP的美妝程式，延伸出來的，根據各組員的</p>
                    <p class="more"><a href="#" class="bul">Lorem ipsum</a></p>
                </div>
                <div class="cl">&nbsp;</div>
            </div>
            <!-- End Text Cols -->
        </div>
        <!-- End Side Full -->
        <!-- Footer -->
        <div id="footer">
            <p class="left"> <a href="#">About us</a> <span>|</span> <a href="#">Help</a> <span>|</span> <a href="#">Our
                    Github</a> <span>|</span><a href="#">Contact us</a> </p>
            <p class="right">Cosmetic1.0.2v</p>
        </div>
        <!-- End Footer -->
    </div>
    <!-- End Shell -->
</body>

</html>