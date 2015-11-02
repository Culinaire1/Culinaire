var password = document.getElementById("password")
    , confirm_password = document.getElementById("password2");

function validatePassword(){
    if(password.value != confirm_password.value) {
        confirm_password.setCustomValidity("Las contraseñas no coinciden");
    } else {
        confirm_password.setCustomValidity('');
    }
}

password.onchange = validatePassword;
confirm_password.onkeyup = validatePassword;

var passwordR = document.getElementById("passwordR")
    , confirm_passwordR = document.getElementById("password2R");

function validatePassword2(){
    if(passwordR.value != confirm_passwordR.value) {
        confirm_passwordR.setCustomValidity("Las contraseñas no coinciden");
    } else {
        confirm_passwordR.setCustomValidity('');
    }
}

passwordR.onchange = validatePassword2;
confirm_passwordR.onkeyup = validatePassword2;