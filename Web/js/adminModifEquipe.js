let btnModifier 		= null;
let btnSupprimer 		= null;
let nodeListeEmployes 	= null;


window.onload = () =>{
	btnModifier = document.getElementById("btn-modifier");
	btnSupprimer = document.getElementById("btn-supprimer");
	nodeListeEmployes = document.querySelector(".liste-employes");

}

const rendreOngletActif = () =>{

}

const modifierEmploye = (employeID) =>{
	enleverListeEmploye();
	infosEmploye = fetchInfoEmploye(employeID);
}

const enleverListeEmploye = () =>{
	while (nodeListeEmployes.hasChildNodes()) {
		nodeListeEmployes.removeChild(nodeListeEmployes.firstChild);
	}
}

const creerFormulaire = (infosEmploye) =>{
	ajouterTitre();

	let champs = [];

	champs.push(creerNouveauChamp("NOM", infosEmploye));
	champs.push(creerNouveauChamp("POSTE", infosEmploye));
	champs.push(creerNouveauChamp("DEPARTEMENT", infosEmploye));
	champs.push(creerNouveauChamp("COURRIEL", infosEmploye));
	champs.push(creerNouveauChamp("NUMÉRO DE TÉLÉPHONE", infosEmploye));
	champs.push(creerNouveauChamp("INFORMATIONS SUPPLÉMENTAIRES", infosEmploye));
	ajouterNodesFormulaire(champs);

}

const creerNouveauChamp = (attribut, infosEmploye) =>{
	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel(attribut));
	nodeChamp.appendChild(creerInput(attribut, infosEmploye));

	return nodeChamp;
}

const creerLabel = (attribut) =>{
	let nodeLabel = document.createElement("div");
	nodeLabel.setAttribute("class", "form-info-label")
	nodeLabel.innerHTML = attribut;

	return nodeLabel;
}

const creerInput = (attribut, infosEmploye) =>{
	let nodeInput = document.createElement("input");
	nodeInput.setAttribute("class", "form-info-input")

	info = determinerSiInfoVide(infosEmploye[attribut]);

	nodeInput.value = info;

	return nodeInput;
}

const determinerSiInfoVide = (info) =>{
	return (info === null | info === undefined  ? "" : info);
}

fetchInfoEmploye = (employeIDParam) =>{

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
	let nodeTitreForm = document.createElement("h1");
	nodeTitreForm.innerHTML = "Modification d'un employé";
	nodeListeEmployes.appendChild(nodeTitreForm);
}

const ajouterNodesFormulaire = (champs) =>{
	champs.forEach(champ => {
		nodeListeEmployes.appendChild(champ);
	});
}