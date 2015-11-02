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

var emailR = document.getElementById("emailR")
    , confirm_emailR= document.getElementById("email2R");

function validatePassword2(){
    if(emailR.value != confirm_emailR.value) {
        confirm_emailR.setCustomValidity("Los correos no coinciden");
    } else {
        confirm_emailR.setCustomValidity('');
    }
}

emailR.onchange = validatePassword2;
confirm_emailR.onkeyup = validatePassword2;