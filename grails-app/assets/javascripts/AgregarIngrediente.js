window.onload = init;

var button;
var button2;
var buttonD;
var buttonD2;
var ingredients;
var instructions;
var ingNum;
var insNum;
var ingDiv;
var insDiv;

function init(){
    button = document.getElementById("add_ingredient");
    button2 = document.getElementById("add_instruction");
    ingredients = document.getElementById("ingredientes");
    instructions = document.getElementById("instructions");
    ingNum = document.getElementById("ingNum");
    insNum = document.getElementById("insNum");
    ingDiv = document.getElementById("ingDiv");
    insDiv = document.getElementById("insDiv");
    button.onclick = addIngredientToDOM;
    button2.onclick = addInstructionToDOM;
}

function addIngredientToDOM() {

    var li = document.createElement("li");
    li.setAttribute("id", "ingLi" + button.value);

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
    input.setAttribute("required", "true");

    var input2 = document.createElement("input");
    input2.setAttribute("class", "form-control campo publicar");
    input2.setAttribute("aria-describedby", "basic-addon1");
    input2.setAttribute("placeholder", "100 gramos");
    input2.setAttribute("type", "text");
    input2.setAttribute("id", "quantity" + button.value);
    input2.setAttribute("name", "quantity" + button.value);
    input2.setAttribute("required", "true");

    var aux = parseInt(button.value);

    if(aux == 2){
        buttonD = document.createElement("button");
        buttonD.setAttribute("class", "btn btn-primary btn-xs center-block botones b2 publicarB");
        buttonD.setAttribute("type", "button");
        buttonD.setAttribute("id", "del1");
        buttonD.setAttribute("name", "del1");
        buttonD.textContent = 'quitar';
        buttonD.onclick = removeIngFromDOM;
        ingDiv.appendChild(buttonD)
    }

    ingNum.value = aux;
    button.value = aux + 1;

    div.appendChild(input);
    div2.appendChild(input2);
    li.appendChild(div);
    li.appendChild(div2);
    ingredients.appendChild(li);
}

function addInstructionToDOM() {

    var li = document.createElement("li");
    li.setAttribute("id", "insLi" + button2.value);

    var div = document.createElement("div");
    div.setAttribute("class", "col-sm-6");

    var div2 = document.createElement("div");
    div2.setAttribute("class", "col-sm-6");

    var input = document.createElement("textarea");
    input.setAttribute("class", "campo textarea");
    input.setAttribute("rows", "2");
    input.setAttribute("id", "des" + button2.value);
    input.setAttribute("name", "des" + button2.value);
    input.setAttribute("required", "true");

    var photo = document.createElement("input");
    photo.setAttribute("type", "file");
    photo.setAttribute("accept", "image/*");
    photo.setAttribute("id", "photo" + button2.value);
    photo.setAttribute("name", "photo" + button2.value);

    var aux = parseInt(button2.value);

    if(aux == 2){
        buttonD2 = document.createElement("button");
        buttonD2.setAttribute("class", "btn btn-primary btn-xs center-block botones b2 publicarB");
        buttonD2.setAttribute("type", "button");
        buttonD2.setAttribute("id", "del1");
        buttonD2.setAttribute("name", "del1");
        buttonD2.textContent = 'quitar';
        buttonD2.onclick = removeInsFromDOM;
        insDiv.appendChild(buttonD2)
    }

    insNum.value = aux;
    button2.value = aux + 1;

    div.appendChild(input);
    div2.appendChild(photo);
    li.appendChild(div);
    li.appendChild(div2);
    instructions.appendChild(li);
}

function removeIngFromDOM() {
    var ing = document.getElementById("ingLi" + ingNum.value);
    ingredients.removeChild(ing);
    var aux = parseInt(ingNum.value);
    ingNum.value = aux -1;
    button.value = aux;
    if(aux == 2){
        ingDiv.removeChild(buttonD);
        buttonD = null;
    }
}

function removeInsFromDOM() {
    var ins = document.getElementById("insLi" + insNum.value);
    instructions.removeChild(ins);
    var aux = parseInt(insNum.value);
    insNum.value = aux -1;
    button2.value = aux;
    if(aux == 2){
        insDiv.removeChild(buttonD2);
        buttonD2 = null;
    }
}