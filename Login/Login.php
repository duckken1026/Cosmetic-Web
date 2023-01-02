<!--login會員登入-->

<head>
  <title>我的帳號: 登入-COSMETIC.COM</title>
</head>

<body>
  <div id="out_block">
    <div id="fixed_block">

    </div>
  </div>

  <nav class="navbar">
    <a href="../Homepage/index.php"><img class="nav-brand" src="../img/icon(title).png" alt=""></a>
    <div class=" nav-list">
      <div class="Headee" id="Homepage"><a href="../Homepage/index.php"><b>首頁</b></a></div>
      <div class="Headee" id="Popular"><a href="#"><b>流行</b></a></div>
      <div class="Headee" id="Recommendation"><a href="#"><b>推薦</b></a></div>
    </div>
    </div>
  </nav>

  <form class="login" action="Login2.php" method="post">
    <div id="left" class="one-thirds">
      <div class="companyIcon">
        <img src="../img/icon(title).png" alt="icon" width="550px" height="420px">
      </div>
    </div>
    <!--one-thirds-->
    <div id="right" class="two-thirds">
      <fieldset>
        <!--<div class="fie">-->
        <h1 class="lgd">登入帳號</h1>
        <p>直接輸入您的會員帳號密碼登入</p>
        <!--1--> <input type="username" id="username" class="username_email" name="username" placeholder="電子郵件地址或手機號碼" required>
        <!--2--> <input type="password" id="password" class="password1" name="password" placeholder="密碼" required>
        <!--3--> <input type="submit" value="登入" class="btn" id="submit" />
        <div id="anotherWay">
          <div class="forgetPassword">
            <a href="javascript:;" id="member_btn">忘記密碼</a>
          </div>
          <div id="sign">
            <a href="./Register/index.php" id="register">註冊</a>
          </div>
      </fieldset>
    </div>
    <!--two-thirds-->
  </form>

</body>
<style media="screen">
  @import url(Login.css);
</style>
