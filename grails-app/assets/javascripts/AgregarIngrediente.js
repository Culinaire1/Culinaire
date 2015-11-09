window.onload = init;

var button;
var button2;
var ingredients;
var instructions;
var ingNum;
var insNum;

function init(){
    button = document.getElementById("add_ingredient");
    button2 = document.getElementById("add_instruction");
    ingredients = document.getElementById("ingredientes");
    instructions = document.getElementById("instructions");
    ingNum = document.getElementById("ingNum");
    insNum = document.getElementById("insNum");
    button.onclick = addIngredientToDOM;
    button2.onclick = addInstructionToDOM;
}

function addIngredientToDOM() {

    var li = document.createElement("li");
    var div = document.createElement("div");
    div.setAttribute("class", "col-sm-6");

    var div2 = document.createElement("div");
    div2.setAttribute("class", "col-sm-6");

    var input = document.createElement("input");
    input.setAttribute("class", "form-control campo publicar");
    input.setAttribute("type", "text");
    input.setAttribute("aria-describedby", "basic-addon1");
    input.setAttribute("id", "ing" + button.value);
    input.setAttribute("name", "ing" + button.value);

    var input2 = document.createElement("input");
    input2.setAttribute("class", "form-control campo publicar");
    input2.setAttribute("aria-describedby", "basic-addon1");
    input2.setAttribute("placeholder", "100 gramos");
    input2.setAttribute("type", "text");
    input2.setAttribute("id", "quantity" + button.value);
    input2.setAttribute("name", "quantity" + button.value);

    ingNum.value = parseInt(button.value);
    button.value = parseInt(button.value) + 1;

    div.appendChild(input);
    div2.appendChild(input2);
    li.appendChild(div);
    li.appendChild(div2);
    ingredients.appendChild(li);
}

function addInstructionToDOM() {

    var li = document.createElement("li");

    var div = document.createElement("div");
    div.setAttribute("class", "col-sm-6");

    var div2 = document.createElement("div");
    div2.setAttribute("class", "col-sm-6");

    var input = document.createElement("textarea");
    input.setAttribute("class", "campo textarea");
    input.setAttribute("rows", "2");
    input.setAttribute("id", "des" + button2.value);
    input.setAttribute("name", "des" + button2.value);

    var photo = document.createElement("input");
    photo.setAttribute("type", "file");
    photo.setAttribute("accept", "image/*");
    photo.setAttribute("id", "photo" + button2.value);
    photo.setAttribute("name", "photo" + button2.value);

    insNum.value = parseInt(button2.value);
    button2.value = parseInt(button2.value) + 1;

    div.appendChild(input);
    div2.appendChild(photo);
    li.appendChild(div);
    li.appendChild(div2);
    instructions.appendChild(li);
}
