let btnModifier 		= null;
let btnSupprimer 		= null;
let nodeListeEmployes 	= null;


window.onload = () =>{
	btnModifier = document.getElementById("btn-modifier");
	btnSupprimer = document.getElementById("btn-supprimer");
	nodeListeEmployes = document.querySelector(".liste-employes");
}



const modifierEmploye = (employeID) =>{
	viderNode(nodeListeEmployes);
	infosEmploye = fetchInfoEmploye(employeID);
}

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}

const creerFormulaire = (infosEmploye) =>{
	ajouterTitre();
	ajouterChamps(infosEmploye);
}

const creerNouveauChamp = (nomChamp, attribut, infosEmploye) =>{
	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel(nomChamp));
	nodeChamp.appendChild(creerInput(attribut, infosEmploye));

	return nodeChamp;
}

const creerLabel = (nomChamp) =>{
	let nodeLabel = document.createElement("div");
	nodeLabel.setAttribute("class", "form-info-label")
	nodeLabel.innerHTML = nomChamp;

	return nodeLabel;
}

const creerInput = (info) =>{
	let nodeInput = document.createElement("input");
	nodeInput.setAttribute("class", "form-info-input")

	if(infoVide(info)){
		info = "";
	}

	nodeInput.value = info;

	return nodeInput;
}

const infoVide = (info) =>{
	return (info === null | info === undefined);
}

const fetchInfoEmploye = (employeIDParam) =>{

	$.ajax({
        url : "fetchInfosEmploye.php",
        type: "POST",
        data: {
			employeID : employeIDParam
		}
    })
    .done(response => {
		infos = JSON.parse(response);
		creerFormulaire(infos);
	});
}

const ajouterTitre = () =>{
	let nodeTitreForm = document.createElement("h2");
	nodeTitreForm.innerHTML = "Modification d'un employé";
	nodeListeEmployes.appendChild(nodeTitreForm);
}

const ajouterChamps = (infosEmploye) =>{

	let champs = [];
	champs.push(creerNouveauChamp("Nom:", infosEmploye["NOM"]));
	champs.push(creerNouveauChamp("Poste:", infosEmploye["POSTE"]));
	champs.push(creerNouveauChamp("Département:", infosEmploye["DEPARTEMENT"]));
	champs.push(creerNouveauChamp("Addresse courriel:", infosEmploye["COURRIEL"]));
	champs.push(creerNouveauChamp("Numéro de téléphone:", infosEmploye["NUMTEL"]));

	if(!infoVide(infosEmploye["INFOS"])){
		champs.push(creerNouveauChamp("Information supplémentaire:", infosEmploye["INFOS"].INFO));
	}
	else{
		champs.push(creerNouveauChamp("Information supplémentaire:", ""));
	}

	ajouterNodesFormulaire(champs);
}

const ajouterNodesFormulaire = (champs) =>{
	champs.forEach(champ => {
		nodeListeEmployes.appendChild(champ);
	});
}

const mettreSelectionActive = (node) => {
	node.style.backgroundColor = "#ec284a";
}

const creerBouton = (texte, parent, couleur) =>{
	let nodeBouton = document.createElement("div");
	nodeBouton.setAttribute("class", "single-btn btn "+ couleur);
	nodeBouton.innerHTML = texte;
	nodeBouton.style.backgroundColor = couleur;
	parent.appendChild(nodeBouton);

	return nodeBouton;
}

const confimerSupression = (node, employeID) =>{
	// location.reload();
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerEmploye(employeID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
}

const supprimerEmploye = (employeIDParam) =>{
	$.ajax({
        url : "supprimerEmploye.php",
        type: "POST",
        data: {
			employeID : employeIDParam
		}
    })
    .done(response => {
		message = JSON.parse(response);
		location.reload();
	});
}