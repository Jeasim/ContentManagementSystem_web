let listeProjets	 = null;
let projet 		 	 = null;
let nodeInfosSup	 = null;

window.onload = () =>{
	listeProjets = document.getElementById("liste-projets");
	projet = document.getElementById("projet");
}

const afficherProjet = (projetID) =>{
	viderNode(listeProjets);
	fetchProjet(projetID);
}

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}

const remplirTemplateProjet = (infosProjet) =>{
	let charHTML = document.getElementById("template-projet").innerHTML;

	let node = document.createElement("div");
	node.innerHTML = charHTML;

	node.querySelector(".nom-projet").innerHTML = infosProjet.NOM;
	node.querySelector(".contenu-projet").innerHTML = infosProjet.CONTENU;

	nodeInfosSup = node.querySelector("#infos-sup-projet");
	fetchInfosSup(infosProjet.ID, node);

	projet.appendChild(node);
}

const remplirDivsInfosSup = (infosSup, nodeParent) =>{

	let charHTML = document.getElementById("template-info-projet").innerHTML;

	infosSup.forEach(infoSup => {
		let node = document.createElement("div");
		node.innerHTML = charHTML;

		node.querySelector(".champ-projet").innerHTML = infoSup.CHAMP;
		node.querySelector(".info-projet").innerHTML = infoSup.INFO;

		nodeInfosSup.appendChild(node);
	});
}

const fetchProjet = (projetIDParam) =>{
	$.ajax({
		url : "fetchProjet.php",
        type: "POST",
        data: {
			projetID : projetIDParam
		}
    })
    .done(result => {
		console.log(result);

		infosProjet = JSON.parse(result);
		remplirTemplateProjet(infosProjet)
	});
}

const fetchInfosSup = (projetIDParam, nodeParent) => {
	$.ajax({
		url : "fetchInfosSupProjet.php",
        type: "POST",
        data: {
			projetID : projetIDParam
		}
    })
    .done(response => {
		infosSupProjet = JSON.parse(response);
		remplirDivsInfosSup(infosSupProjet, nodeParent);
	});
}