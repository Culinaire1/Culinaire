var passwordR = document.getElementById("passwordR")
    , confirm_passwordR = document.getElementById("password2R");

function validatePassword2(){
    if(passwordR.value != confirm_passwordR.value) {
        confirm_passwordR.setCustomValidity("Las contrase�as no coinciden");
    } else {
        confirm_passwordR.setCustomValidity('');
    }
}

passwordR.onchange = validatePassword2;
confirm_passwordR.onkeyup = validatePassword2;

