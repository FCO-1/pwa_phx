miStorage = window.localStorage;

localStorage.setItem('Color','Negro');
console.log(localStorage.getItem('Color'));


function store(){
    var inputEmail= document.getElementById("email");
    var inputPWD= document.getElementById("password");
    localStorage.setItem("email", inputEmail.value);
    localStorage.setItem("password", inputPWD.value);

    console.log(localStorage.getItem("email"))
   }

window.onload(

    console.log(localStorage.getItem("email"))
)