window.onload = init;

var button;
var platesNum;
var form;

function init() {
    button = document.getElementById("add");
    platesNum = document.getElementById("platesNum");
    form = document.getElementById("form");
    button.onclick = addPlateToDom;
}

function addPlateToDom(){
    var div1 = document.createElement("div");
    div1.setAttribute("id", "plateDiv"+ button.value);
    form.appendChild(div1);

    var nameDiv = document.createElement("div");
    nameDiv.setAttribute("class", "input-group");
    div1.appendChild(nameDiv);

    var colDiv = document.createElement("div");
    colDiv.setAttribute("class", "col-sm-5");
    nameDiv.appendChild(colDiv);

    var nameSpan = document.createElement("span");
    nameSpan.setAttribute("class", "input-group-addon");
    nameSpan.textContent = "Nombre*";
    colDiv.appendChild(nameSpan);

    var plateTextDiv = document.createElement("div");
    plateTextDiv.setAttribute("class", "col-sm-7");
    nameDiv.appendChild(plateTextDiv);

    var plateInput = document.createElement("input");
    plateInput.setAttribute("class", "form-control campo");
    plateInput.setAttribute("type", "text");
    plateInput.setAttribute("aria-describedby", "basic-addon1");
    plateInput.setAttribute("id", "plate" + button.value);
    plateInput.setAttribute("name", "plate" + button.value);
    plateInput.setAttribute("required", "true");
    plateTextDiv.appendChild(plateInput);

    var aux = parseInt(button.value);
    button.value = aux+1;
    platesNum.value = aux;
}
