const passInput = document.querySelector(".input-group .input input");
const toggleIcon = document.querySelector(".input-group .toggle");
const ripple = document.querySelector(".input-group .ripple");
const percentBar = document.querySelector(".strength-percent span");
const passLable = document.querySelector(".strength-lable");

function handlePassInput(e){
  if(passInput.value.length === 0){
    passLable.innerHTML = "Strength";
    addClass();
  }
  else if(passInput.value.length<=4){
    passLable.innerHTML="Weak";
    addClass("weak");
  }
  else if(passInput.value.length<=7){
    passLable.innerHTML - "Medium";
    addClass("average");
  }
  else{
    passLable.innerHTML("Strong");
    addClass("strong");
  }
}

function togglePassInput(e){
  const type = passInput.getAttribute("type");
  if(type === "password"){
    passInput.setAttribute("type","text");
    toggleIcon.innerHTML = "a";
    ripple.style.cssText = `
    boder-radius:4px;
    width:100%;
    heigth:35px;
    width:35px;
    rigth:10px;
    z-index:1;
    `;
    passInput.style.color = #fff;
    passInput.style.background = "#112d37";
  }
}

passInput.addEventListener("input",handlePassInput);
toggleIcon.addEventListener("click",togglePassInput);

function addClass(className){
  percentBar.classList.remove("weak");
  percentBar.classList.remove("average");
  percentBar.classList.remove("strong");
  if(className){
    percentBar.classList.add(className);
  }
}
