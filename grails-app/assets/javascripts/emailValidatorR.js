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

