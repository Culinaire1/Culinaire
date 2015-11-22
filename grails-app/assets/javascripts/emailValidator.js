var email = document.getElementById("email")
    , confirm_email= document.getElementById("email2");

function validatePassword(){
    if(email.value != confirm_email.value) {
        confirm_email.setCustomValidity("Los correos no coinciden");
    } else {
        confirm_email.setCustomValidity('');
    }
}

email.onchange = validatePassword;
confirm_email.onkeyup = validatePassword;
