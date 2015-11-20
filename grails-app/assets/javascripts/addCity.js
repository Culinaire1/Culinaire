window.onload = init;

var button;
var cities;
var instructions;
var citiesNum;

function init(){
    button = document.getElementById("add_city");
    var addDir = document.getElementById("add_dir1");
    addDir.onclick = addDirToDom;
    cities = document.getElementById("cities");
    citiesNum = document.getElementById("citiesNum");
    button.onclick = addCityToDOM;
}

function addCityToDOM() {

    var div1 = document.createElement("div");
    div1.setAttribute("id", "cityDiv"+ button.value);

    var cityDiv = document.createElement("div");
    cityDiv.setAttribute("class", "input-group");
    var br = document.createElement("br");
    cityDiv.appendChild(br);
    div1.appendChild(cityDiv);

    var colDiv = document.createElement("div");
    colDiv.setAttribute("class", "col-sm-5");
    cityDiv.appendChild(colDiv);

    var citySpan = document.createElement("span");
    citySpan.setAttribute("class", "input-group-addon");
    citySpan.textContent = "Ciudad*";
    colDiv.appendChild(citySpan);

    var cityTextDiv = document.createElement("div");
    cityTextDiv.setAttribute("class", "col-sm-7");
    cityDiv.appendChild(cityTextDiv);

    var cityInput = document.createElement("input");
    cityInput.setAttribute("class", "form-control campo");
    cityInput.setAttribute("type", "text");
    cityInput.setAttribute("aria-describedby", "basic-addon1");
    cityInput.setAttribute("id", "city" + button.value);
    cityInput.setAttribute("name", "city" + button.value);
    cityInput.setAttribute("required", "true");
    cityTextDiv.appendChild(cityInput);

    var dirDiv = document.createElement("div");
    dirDiv.setAttribute("class", "input-group");
    div1.appendChild(dirDiv);

    cities.appendChild(div1);

    var dirColDiv = document.createElement("div");
    dirColDiv.setAttribute("class", "col-sm-5");
    dirDiv.appendChild(dirColDiv);

    var dirSpan = document.createElement("span");
    dirSpan.setAttribute("class", "input-group-addon");
    dirSpan.textContent = "Direcciones*";
    dirColDiv.appendChild(dirSpan);

    var dirTextDiv = document.createElement("div");
    dirTextDiv.setAttribute("class", "col-sm-7 addDir");
    dirTextDiv.setAttribute("id", "directions"+button.value);
    dirDiv.appendChild(dirTextDiv);

    var dirInput = document.createElement("input");
    dirInput.setAttribute("class", "form-control campo");
    dirInput.setAttribute("type", "text");
    dirInput.setAttribute("aria-describedby", "basic-addon1");
    dirInput.setAttribute("required", "true");
    dirInput.setAttribute("id", "city" + button.value + "dir1");
    dirInput.setAttribute("name", "city" + button.value + "dir1");
    dirTextDiv.appendChild(dirInput);

    var rowDiv = document.createElement("div");
    rowDiv.setAttribute("class", "row addDir");
    rowDiv.setAttribute("align", "right");
    dirDiv.appendChild(rowDiv);

    var addDir = document.createElement("button");
    addDir.setAttribute("type", "button");
    addDir.setAttribute("class", "btn btn-primary btn-xs botones b2 publicarB");
    addDir.textContent = "Agregar Direccion";
    addDir.setAttribute("id", "add_dir"+button.value);
    addDir.value = button.value;
    rowDiv.appendChild(addDir);


    var dirNum = document.createElement("input");
    dirNum.value = 1;
    dirNum.setAttribute("id", "cityDirNum"+button.value);
    dirNum.setAttribute("name", "cityDirNum"+button.value);
    dirNum.setAttribute("hidden", "true");
    rowDiv.appendChild(dirNum);

    var aux = parseInt(button.value);
    citiesNum.value = aux;
    button.value = aux + 1;

    addDir.onclick = addDirToDom;

    if(aux == 2){
        var p = document.getElementById("delDiv");
        var button2 = document.createElement("button");
        button2.setAttribute("class", "btn btn-primary btn-xs botones b2 publicarB");
        button2.setAttribute("type", "button");
        button2.setAttribute("id", "delcity");
        button2.setAttribute("name", "delcity");
        button2.textContent = 'Quitar';
        button2.onclick = removeCityFromDom;
        p.appendChild(button2);
    }
}

function addDirToDom(e){
    var key = e.target.value;
    var num = document.getElementById("cityDirNum"+key);

    var aux = parseInt(num.value);
    num.value = aux + 1;

    var div = document.getElementById("directions" + key);

    var dirInput = document.createElement("input");
    dirInput.setAttribute("class", "form-control campo direccion");
    dirInput.setAttribute("type", "text");
    dirInput.setAttribute("aria-describedby", "basic-addon1");
    dirInput.setAttribute("required", "true");
    dirInput.setAttribute("id", "city" + key + "dir"+ num.value);
    dirInput.setAttribute("name", "city" + key + "dir"+ num.value);
    div.appendChild(dirInput);

    if((aux + 1) == 2){
        var p = e.target.parentNode;
        var button2 = document.createElement("button");
        button2.setAttribute("class", "btn btn-primary btn-xs botones b2 publicarB");
        button2.setAttribute("type", "button");
        button2.setAttribute("id", "del"+key);
        button2.setAttribute("name", "del"+key);
        button2.textContent = 'Quitar';
        button2.onclick = removeDirFromDom;
        button2.value = key;
        p.appendChild(button2);
    }
}

function removeDirFromDom(e){
    var key = e.target.value;
    var num = document.getElementById("cityDirNum"+key);
    var aux = parseInt(num.value);

    var div = document.getElementById("directions" + key);
    var dirInput = document.getElementById("city" + key + "dir"+ num.value);

    div.removeChild(dirInput);

    if(aux == 2){
        var p = e.target.parentNode;
        var button2 = document.getElementById("del"+key);
        p.removeChild(button2)
    }

    num.value = aux - 1;
}

function removeCityFromDom(){
    var key = parseInt(citiesNum.value);

    var div = document.getElementById("cityDiv"+ key);

    cities.removeChild(div);

    var aux = parseInt(key);

    if(aux == 2){
        var p = document.getElementById("delDiv");
        var button2 = document.getElementById("delcity");
        p.removeChild(button2)
    }

    citiesNum.value = aux - 1;
    button.value = aux;
}