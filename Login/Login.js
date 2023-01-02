'use strict';

//會員登入------------------
var attempt = 3; // 可變數來計算嘗試次數。
function myFormCheck(){// 以下功能單擊登錄按鈕執行。
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if ( username === "0" && password === "00"){
        alert ("Login successfully");
        window.location = "../Homepage/index.html"; // 重定向到其他頁面。
        return false;

    }
    else{
        attempt --;// 減少一個。
        alert("You have left "+attempt+" attempt;\nPlease try again.");
    }
}


    document.querySelector('.btn').addEventListener('click',
      function () {
        const value = document.querySelector('.text').value
        alert(value)
      }
    )


// store a session value/object
Session.set(name, object);

// retreive a session value/object
Session.get(name);

// clear all session data
Session.clear();

// dump session data
Session.dump();
