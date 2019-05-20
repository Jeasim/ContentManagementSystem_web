let listeProjets = null;
let projet 		 = null;

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

	fetchInfosSup(infosProjet.ID, node);

	projet.appendChild(node);
}

const remplirDivsInfosSup = (infosSup, nodeParent) =>{
	infosSup.forEach(infoSup => {
		let nodeInfoSup = document.createElement("div");
		nodeInfoSup.setAttribute("class", "col-sm-12");
		let nodeNomChamp = document.createElement("h6");
		nodeNomChamp.innerHTML = infoSup.CHAMP;
		let nodeInfo = document.createElement("div");
		nodeInfo.innerHTML = infoSup.INFO;
		nodeInfoSup.appendChild(nodeNomChamp);
		nodeInfoSup.appendChild(nodeInfo);
		nodeParent.appendChild(nodeInfoSup);
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
    .done(response => {
		infosProjet = JSON.parse(response);
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