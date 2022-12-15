<?php
    $TestLink = mysqli_connect("localhost","root","","cosmetic");
    if(!$TestLink){
	die(" 連線失敗");
    }
    echo "連線成功<br>" ;   
    $sql = "SELECT `ID`, `FirstName`, `LastName`, `Phone No`, `NickName`, `E-mail`, `Password` FROM `member` WHERE 1";
    $sql1 = "SELECT * FROM `cake`"; 
    $sql2 = "SELECT * FROM `product`";
    $result = mysqli_query($TestLink,$sql);
    $result1 = mysqli_query($TestLink,$sql1);
    $result2 = mysqli_query($TestLink,$sql2);
    if ($result->num_rows > 0) {
    // 输出数据
    while($row = $result->fetch_assoc()) {
        echo "id: " . $row["ID"]. "<br>";
	    echo " Name: ". $row["FirstName"]. " " . $row["LastName"]. "<br>";
	    echo " Phone No: "  . $row["Phone No"]. "<br>";
    }
    } else {
    echo "0 结果";
    }

    echo "<br>";
    $update = "UPDATE cake SET mocha = 3 WHERE chocolate = 8";
    if ($TestLink->query($update) === TRUE) {
        echo "Record updated successfully.<br>";
      } else {
        echo "Error updating record: " . $TestLink->error;
    }

    if ($result1->num_rows > 0) {
        // 输出数据
        while($row = $result1->fetch_assoc()) {
            echo "chocolate: " . $row["chocolate"]. "<br>";
            echo "strawberry: ". $row["strawberry"]. "<br>";
            echo "butter: " . $row["butter"]. "<br>";
            echo "salty:" . $row["salty"]. "<br>";
            echo "mocha:" . $row["mocha"]. "<br>";
            echo "-----------------<br>";
        }
    } else {
        echo "0 结果";
    }

    echo "<br>";

    if ($result2->num_rows > 0) {
        // 输出数据
        while($row = $result2->fetch_assoc()) {
            echo "ID: " . $row["ID"]. "<br>";
            echo "NAME: ". $row["Name"]. "<br>";
            echo "PRICE: " . $row["Price"]. "<br>";
            echo "STOCK:" . $row["Stock"]. "<br>";
            echo "image:" . $row["image_src"]. "<br>";
            echo "Detail:" . $row["detail"]. "<br>";
            echo "-----------------<br>";
        }
    } else {
        echo "0 结果";
    }

    mysqli_close($TestLink);
?>