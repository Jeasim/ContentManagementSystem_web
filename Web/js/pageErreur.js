let opaciteLoupe 				= null;
let imageLoupe 	 				= null;
let idIntervalOpaciteLoupe	 	= null;
let idIntervalDeplacmentLoupe 	= null;
let posXLoupe					= null;
let posYLoupe					= null;
let vitesseXLoupe 				= 0.3;
let vitesseYLoupe 				= 0.3;

window.onload = () =>{
	opaciteLoupe = 0;
	imageLoupe = document.getElementById("loupe");
	posXLoupe = 37;
	posYLoupe = 30;
}


const animationLoupe = () =>{
	idIntervalOpaciteLoupe = setInterval(() => { fadeInImageLoupe()}, 100);
}

const fadeInImageLoupe = () =>{

	if(opaciteLoupe <= 1){
		opaciteLoupe += 0.08;
	}
	else{
		opaciteLoupe = 1;
		clearInterval(idIntervalOpaciteLoupe);
		idIntervalDeplacmentLoupe = setInterval(() => { deplacementLoupe() }, 30);
		document.querySelector(".texte-erreur").style.display = "block";
	}

	imageLoupe.style.opacity = opaciteLoupe;
}


const deplacementLoupe = () =>{

	posXLoupe += vitesseXLoupe;
	posYLoupe += vitesseYLoupe;

	if(posXLoupe >= 65 || posXLoupe <= 5){
		vitesseXLoupe *= -1;
	}
	if(posYLoupe >= 65 || posYLoupe <= 5){
		vitesseYLoupe *= -1;
	}

	imageLoupe.style.left = posXLoupe + "%";
	imageLoupe.style.top = posYLoupe + "%";


	console.log(posXLoupe);

}