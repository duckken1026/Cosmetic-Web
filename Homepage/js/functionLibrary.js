function myFormCheck(){// 以下功能單擊登錄按鈕執行。
/*
    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    if ( username === "0" && password === "00"){
        alert ("Login successfully");
        window.location = "../Homepage/index.html"; // 重定向到其他頁面。
        return false;

    }
    else{
        alert("You have left "+" attempt;\nPlease try again.");
    }
    */
}

document.querySelector('.btn').addEventListener('click',
  function () {
    const value = document.querySelector('.Headee').value
    localStorage.setItem('text', value)
  }
)
// You can try this one to show/hide div element.
//var t = document.getElementById('Login');//选取id为Login的div元素
//t.style.visibility = 'hidden';// 隐藏元素
//t.style.visibility = 'visible';// 显示元素
