window.onload = init;

var button;

function init(){
    button = document.getElementById("add");
    button.onclick = addIngredientToDOM;
}

function addIngredientToDOM() {

    var ingredients = document.getElementById("ingredientes");

    var li = document.createElement("li");
    var div = document.createElement("div");
    div.setAttribute("class", "col-sm-6");

    var div2 = document.createElement("div");
    div2.setAttribute("class", "col-sm-6");

    var input = document.createElement("input");
    input.setAttribute("class", "form-control campo publicar");
    input.setAttribute("type", "text");
    input.setAttribute("aria-describedby", "basic-addon1");
    input.setAttribute("placeholder", "");

    var input2 = document.createElement("input");
    input2.setAttribute("class", "form-control campo publicar");
    input2.setAttribute("aria-describedby", "basic-addon1");
    input2.setAttribute("placeholder", "100 gramos de ...");
    input2.setAttribute("type", "text");

    div.appendChild(input);
    div2.appendChild(input2);
    li.appendChild(div);
    li.appendChild(div2);
    ingredients.appendChild(li);
}
