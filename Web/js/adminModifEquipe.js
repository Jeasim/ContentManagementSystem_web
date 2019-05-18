let btnModifier 		= null;
let btnSupprimer 		= null;
let nodeListeEmployes 	= null;


window.onload = () =>{
	console.log("ici");

	btnModifier = document.getElementById("btn-modifier");
	btnSupprimer = document.getElementById("btn-supprimer");
	nodeListeEmployes = document.querySelector(".liste-employes");
}

const formulaireModifier = (employeID) =>{
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
	ajouterBoutons(infosEmploye["ID"]);
}

const creerNouveauChamp = (nomChamp, attribut, nomInput) =>{
	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel(nomChamp));
	nodeChamp.appendChild(creerInput(attribut, nomInput));

	return nodeChamp;
}

const creerLabel = (nomChamp, nomInput) =>{
	let nodeLabel = document.createElement("div");
	nodeLabel.setAttribute("class", "form-info-label");
	nodeLabel.innerHTML = nomChamp;

	return nodeLabel;
}

const creerInput = (info, nomInput) =>{
	let nodeInput = document.createElement("input");
	nodeInput.setAttribute("class", "form-info-input");
	nodeInput.setAttribute("name", nomInput);

	console.log(nodeInput);


	if(infoVide(info)){
		info = "";
	}

	nodeInput.value = info;

	return nodeInput;
}

const infoVide = (info) =>{
	return (info === null | info === undefined);
}



const ajouterTitre = () =>{
	let nodeTitreForm = document.createElement("h2");
	nodeTitreForm.innerHTML = "Modification d'un employé";
	nodeListeEmployes.appendChild(nodeTitreForm);
}

const ajouterChamps = (infosEmploye) =>{
	let champs = [];
	champs.push(creerNouveauChamp("Nom:", infosEmploye["NOM"], "NOM"));
	champs.push(creerNouveauChamp("Poste:", infosEmploye["POSTE"], "POSTE"));
	champs.push(creerNouveauChamp("Département:", infosEmploye["DEPARTEMENT"], "DEPARTEMENT"));
	champs.push(creerNouveauChamp("Addresse courriel:", infosEmploye["COURRIEL"], "COURRIEL"));
	champs.push(creerNouveauChamp("Numéro de téléphone:", infosEmploye["NUMTEL"], "NUMTEL"));

	if(!infoVide(infosEmploye["INFOS"])){
		champs.push(creerNouveauChamp("Information supplémentaire:", infosEmploye["INFOS"].INFO, "INFOS"));
	}
	else{
		champs.push(creerNouveauChamp("Information supplémentaire:", ""));
	}

	ajouterNodesFormulaire(champs);
}

const ajouterBoutons = (employeID) =>{
	let btnGroupModifier = document.createElement("div");
	btnGroupModifier.setAttribute("class", "btn-group");
	let btnConfimer = creerBouton("Modifier", btnGroupModifier, "btn-red");
	let btnAnnuler = creerBouton("Annuler", btnGroupModifier, "btn-green");
	btnAnnuler.addEventListener("click", ()=>location.reload());
	btnConfimer.addEventListener("click", ()=>modifierEmploye(employeID))

	nodeListeEmployes.appendChild(btnGroupModifier);
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
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerEmploye(employeID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
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

const modifierEmploye = (employeIDParam) =>{
	$.ajax({
        url : "modifierEmploye.php",
        type: "POST",
        data: {
			employeID : 	employeIDParam,
			nom : 			document.querySelector("input[name = 'NOM']").value,
			poste : 		document.querySelector("input[name = 'POSTE']").value,
			courriel :		document.querySelector("input[name = 'COURRIEL']").value,
			numTel : 		document.querySelector("input[name = 'NUMTEL']").value,
			infoSup : 		"oui",
			// infoSup : 		document.querySelector("input[name = 'INFOS']").value,
			departement : 	document.querySelector("input[name = 'DEPARTEMENT']").value
		}
    })
    .done(response => {
		message = JSON.parse(response);
		location.reload();
	});
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