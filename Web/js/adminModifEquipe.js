let nodeListeEmployes 	= null;

window.onload = () =>{
	nodeListeEmployes = document.querySelector(".liste-employes");
}


const formulaireModifier = (employeID) =>{
	viderNode(nodeListeEmployes);
	creerFormulaireEmploye("Modifier un employé", "Modifier");
	remplirChampsInfosEmploye(employeID);
	(document.getElementById("btn-ajouter")).style.display = "none";
	(document.getElementById("Modifier")).addEventListener("click", ()=>modifierEmploye(employeID));
}

const formulaireAjouter = (departement) =>{
	viderNode(nodeListeEmployes);
	creerFormulaireEmploye("Ajouter un employé", "Ajouter");
	document.querySelector("input[name = 'DEPARTEMENT']").value = departement;
	document.getElementById("Ajouter").addEventListener("click", ajouterEmploye);
	(document.getElementById("btn-ajouter")).style.display = "none";
}

const formulaireModifDept = () => {
	viderNode(nodeListeEmployes);
	creerFormulaireDepartements();
}

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}

const confimerSupression = (node, employeID) =>{
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerEmploye(employeID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
}

const champsObligatoiresRemplis = () =>{
	return ((document.querySelector("input[name = 'NOM']").value != "") && (document.querySelector("input[name = 'POSTE']").value != "") && (document.querySelector("input[name = 'DEPARTEMENT']").value != ""));
}


//  ------ Fonctions d'appels AJAX
const remplirChampsInfosEmploye = (employeIDParam) =>{

	$.ajax({
        url : "fetchInfosEmploye.php",
        type: "POST",
        data: {
			employeID : employeIDParam
		}
    })
    .done(response => {
		infosEmploye = JSON.parse(response);
		document.querySelector("input[name = 'NOM']").value 		= infosEmploye["NOM"];
		document.querySelector("input[name = 'POSTE']").value 		= infosEmploye["POSTE"];
		document.querySelector("input[name = 'COURRIEL']").value 	= infosEmploye["COURRIEL"];
		document.querySelector("input[name = 'NUMTEL']").value 		= infosEmploye["NUMTEL"];
		document.querySelector("input[name = 'INFO_SUP1']").value 	= infosEmploye["INFO_SUP1"];
		document.querySelector("input[name = 'INFO_SUP2']").value 	= infosEmploye["INFO_SUP2"];
		document.querySelector("input[name = 'DEPARTEMENT']").value = infosEmploye["DEPARTEMENT"];
	});
}

const modifierEmploye = (employeIDParam) =>{

	if(champsObligatoiresRemplis()){
		$.ajax({
			url : "modifierEmploye.php",
			type: "POST",
			data: {
				employeID : 	employeIDParam,
				nom : 			document.querySelector("input[name = 'NOM']").value,
				poste : 		document.querySelector("input[name = 'POSTE']").value,
				courriel :		document.querySelector("input[name = 'COURRIEL']").value,
				numTel : 		document.querySelector("input[name = 'NUMTEL']").value,
				infoSup1 : 		document.querySelector("input[name = 'INFO_SUP1']").value,
				infoSup2 : 		document.querySelector("input[name = 'INFO_SUP2']").value,
				departement : 	document.querySelector("input[name = 'DEPARTEMENT']").value
			}
		})
		.done(response => {
			message = JSON.parse(response);
			location.reload();
		});
	}
	else{
		alert("Les champs 'nom', 'poste' et 'département doivent être remplis'")
	}

}

const ajouterEmploye = () =>{

	console.log("eill");

	if(champsObligatoiresRemplis()){
		$.ajax({
			url : "ajouterEmploye.php",
			type: "POST",
			data: {
				nom : 			document.querySelector("input[name = 'NOM']").value,
				poste : 		document.querySelector("input[name = 'POSTE']").value,
				courriel :		document.querySelector("input[name = 'COURRIEL']").value,
				numTel : 		document.querySelector("input[name = 'NUMTEL']").value,
				infoSup1 : 		document.querySelector("input[name = 'INFO_SUP1']").value,
				infoSup2 : 		document.querySelector("input[name = 'INFO_SUP2']").value,
				departement : 	document.querySelector("input[name = 'DEPARTEMENT']").value
			}
		})
		.done(response => {
			message = JSON.parse(response);
			console.log(message);

			location.reload();
		});
	}
	else{
		alert("Les champs 'nom', 'poste' et 'département doivent être remplis'")
	}

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



// ------ Fonctions de création de formulaires
const creerFormulaireEmploye = (titre, fonctionnalite) =>{
	ajouterTitre(titre);
	ajouterChamps();
	ajouterBoutons(fonctionnalite);
}

const ajouterTitre = (titre) =>{
	let nodeTitreForm = document.createElement("h2");
	nodeTitreForm.innerHTML = titre;
	nodeListeEmployes.appendChild(nodeTitreForm);
}

const ajouterChamps = () =>{
	let champs = [];
	champs.push(creerNouveauChamp("Nom:", "NOM"));
	champs.push(creerNouveauChamp("Poste:", "POSTE"));
	champs.push(creerNouveauChamp("Département:", "DEPARTEMENT"));
	champs.push(creerNouveauChamp("Addresse courriel:", "COURRIEL"));
	champs.push(creerNouveauChamp("Numéro de téléphone:", "NUMTEL"));
	champs.push(creerNouveauChamp("Information supplémentaire #1:", "INFO_SUP1"));
	champs.push(creerNouveauChamp("Information supplémentaire #2:", "INFO_SUP2"));
	ajouterNodesFormulaire(champs);
}

const ajouterBoutons = (fonctionnalite) =>{
	let btnGroup = document.createElement("div");
	btnGroup.setAttribute("class", "btn-group");
	btnConfimer = creerBouton(fonctionnalite, btnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", btnGroup, "btn-green");
	btnAnnuler.addEventListener("click", ()=>location.reload());
	nodeListeEmployes.appendChild(btnGroup);
}

const creerNouveauChamp = (nomChamp, nomInput) =>{
	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel(nomChamp));
	nodeChamp.appendChild(creerInput(nomInput));

	return nodeChamp;
}

const creerLabel = (nomChamp) =>{
	let nodeLabel = document.createElement("div");
	nodeLabel.setAttribute("class", "form-info-label");
	nodeLabel.innerHTML = nomChamp;

	return nodeLabel;
}

const creerInput = (nomInput) =>{
	let nodeInput = document.createElement("input");
	nodeInput.setAttribute("class", "form-info-input");
	nodeInput.setAttribute("name", nomInput);

	return nodeInput;
}

const creerBouton = (fonctionnalite, parent, couleur) =>{
	let nodeBouton = document.createElement("div");
	nodeBouton.setAttribute("class", "single-btn btn "+ couleur);
	nodeBouton.setAttribute("id", fonctionnalite);
	nodeBouton.innerHTML = fonctionnalite;
	nodeBouton.style.backgroundColor = couleur;
	parent.appendChild(nodeBouton);

	return nodeBouton;
}

const ajouterNodesFormulaire = (champs) =>{
	champs.forEach(champ => {
		nodeListeEmployes.appendChild(champ);
	});
}

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}