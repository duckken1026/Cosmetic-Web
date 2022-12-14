<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="./style.css">
    <link rel="stylesheet" href="./Register.css">
    <script src="https://cdn.staticfile.org/vue/2.6.9/vue.js"></script>
    <script src="Register.js"></script>
</head>

<body>
    <nav class="navbar">
        <a href="../../Homepage/index.php"><img class="nav-brand" src="../../img/icon(title).png" alt=""></a>
        <div class=" nav-list">
          <div class = "Headee" id = "Homepage" ><a href="../../Homepage/index.php"><b>首頁</b></a></div>
          <div class = "Headee" id = "Popular" ><a href="../../Homepage/popular.php"><b>流行</b></a></div>
          <div class = "Headee" id = "Recommendation"><a href="../../Homepage/recom.php"><b>推薦</b></a></div>
          <div class = "Headee" id = "Login"><a href="../Login.php"><b>登入</b></a></div>
        </div>
      </nav>
    <div id='app' class="container">
        <img src="./bg.jpg" />
        <div class="panel">
            <div class="content login">
                <div class='form' id="fromLogin">
                        <span style="font-size: 30px;">註冊帳號</span>
                        <div class="input"><input :class='{ hasValue: registerForm.email }' v-model='registerForm.email' type="text" name="email" id='email' /><label for="email">電子信箱</label></div>
                        <div class="input"><input :class='{ hasValue: registerForm.FirstName }' v-model='registerForm.FirstName' type="text" name="FirstName" id="FirstName" /><label for="FirstName">姓</label></div>
                        <div class="input"><input :class='{ hasValue: registerForm.EndName }' v-model='registerForm.EndName' type="text" name="EndName" id="EndName" /><label for="EndName">名字</label></div>
                        <div class="input"><input :class='{ hasValue: registerForm.Password }' v-model='registerForm.Password' type="password" name="Password" id="Password" /><label for="Password">密碼</label></div>
                        <div class="input"><input :class='{ hasValue: registerForm.repeat }' v-model='registerForm.repeat' type="password" name="repeat" id="Passwordrepeat" /><label for="Passwordrepeat">重複密碼</label></div>
                    <button type="submit" @click='submit'>註冊</button>

                  <!-- <span style="font-size: 30px;">註冊帳號</span>
                  <div class="input"><input :class='{ hasValue: registerForm.email }' v-model='registerForm.email' type="text" name="email" id='email' /><label for="email">電子信箱</label></div>
                  <div class="input"><input :class='{ hasValue: registerForm.Username }' v-model='registerForm.Username' type="text" name="Username" id="username" /><label for="username">用戶名</label></div>
                  <div class = "input-container">
                    <div class = "input-group">
                      <div class="input"><input :class='{ hasValue: registerForm.Password }' v-model='registerForm.Password' type="password" name="Password" id="Password" /><label for="Password">密碼</label></div>
                        <span class="toggle"></span>
                        <span class = ripple></span>
                    </div>
                    <div class = "pass-strength">
                      <div class = "strength-percent"></span></div>
                        <span class = "strength-lable">Strength</span>
                    </div>
                    </div>
                  <div class="input"><input :class='{ hasValue: registerForm.repeat }' v-model='registerForm.repeat' type="password" name="repeat" id="Passwordrepeat" /><label for="Passwordrepeat">重複密碼</label></div>
                  <button type="submit" @click='submit'>註冊</button> -->
                </div>
            </div>
        </div>
    </div>
    <?php
            include('../../config/connect.php');
    ?>
</body>

<script>
var vue = new Vue({
    el: '#app',
    data: {
        active: 'register',
        registerForm: { email: '', FirstName: '', EndName: '', Password: '', repeat: '', },
        loginForm: { Username: '', Password: '', },
    },
    methods: {
        go (type) {
            this.active = type
        },
        submit() {
            console.log('register', this.registerForm)
            if(this.registerForm.Password == this.registerForm.repeat){
                alert("success")
                window.location = "../Login.php"
            }
        }
    },
    beforeMount () {}
})
</script>
</html>