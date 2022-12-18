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
