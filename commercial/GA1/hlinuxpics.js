
var divs=document.getElementsByClassName("imgs");
for (var i=1; i<divs.length+1; i++){
var theDiv=document.getElementById("div" + i);
theDiv.addEventListener("click", show);
box.addEventListener("click", hide);
}

//put backgroun image name as style and change it


function show(){

//box.style.top="190px";
//box.style.left="290px";
box.style.visibility="visible";
box.style.height="600px";

var diagram=this.getAttribute("data-img");
box.style.backgroundImage = "url('" + diagram + "')";
}

function hide(){

document.getElementById("box").style.height="0px";
document.getElementById("box").style.visibility="hidden";

}

