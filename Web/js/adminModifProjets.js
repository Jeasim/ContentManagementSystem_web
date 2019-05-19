let nodeListeProjets 	= null;
let btnAjouterChamp		= null;
let compteurInputInfo 	= 1;

window.onload = () =>{
	nodeListeProjets = document.querySelector(".listeProjets");
}

const formulaireAjouter = () =>{
	viderNode(nodeListeProjets);
	creerFormulaireProjet("Ajouter un projet", "Ajouter");
	document.getElementById("Ajouter").addEventListener("click", ()=>console.log("from"));
	(document.getElementById("btn-ajouter-projet")).style.display = "none";
}

const confimerSupression = (node, projetID) =>{
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerProjet(projetID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
}


const supprimerProjet = (projetIDParam) =>{
	$.ajax({
		url : "supprimerProjet.php",
        type: "POST",
        data: {
			projetID : projetIDParam
		}
    })
    .done(response => {
		message = JSON.parse(response);
		location.reload();
	});
}


// ------ Fonctions de création de formulaires

const creerFormulaireProjet = (titre, fonctionnalite) =>{
	ajouterTitre(titre);
	ajouterChamps();
	ajouterBoutons(fonctionnalite);
}

const ajouterTitre = (titre) =>{
	let nodeTitreForm = document.createElement("h2");
	nodeTitreForm.setAttribute("class", "titre-formulaire");
	nodeTitreForm.innerHTML = titre;
	nodeListeProjets.appendChild(nodeTitreForm);
}

const ajouterChamps = () =>{
	let champs = [];
	champs.push(creerNouveauChamp("Titre du projet:", "NOM", "input"));
	champs.push(creerNouveauChamp("Contenu:", "CONTENU", "textarea"));
	champs.push(creerNouveauChamp("Champ #" + compteurInputInfo +  ":", "CHAMP" + compteurInputInfo, "input"));
	champs.push(creerNouveauChamp("Information #" + compteurInputInfo +  ":", "INFO" + compteurInputInfo,"textarea"));
	ajouterNodesFormulaire(champs);

	CKEDITOR.replace( 'CONTENU' );
	CKEDITOR.replace( 'INFO' + compteurInputInfo );
}

const ajouterNodesFormulaire = (champs) =>{
	champs.forEach(champ => {
		nodeListeProjets.appendChild(champ);
	});
}

const ajouterBoutons = (fonctionnalite) =>{

	btnAjouterChamp = document.createElement("div");
	btnAjouterChamp.setAttribute("class", "btn-yellow btn");
	btnAjouterChamp.setAttribute("id", "ajouter-champ");
	btnAjouterChamp.innerHTML = "Ajouter champ";
	btnAjouterChamp.addEventListener("click", ajouterNouveauChampInfo);
	nodeListeProjets.appendChild(btnAjouterChamp);

	let btnGroup = document.createElement("div");
	btnGroup.setAttribute("class", "btn-group");
	btnConfimer = creerBouton(fonctionnalite, btnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", btnGroup, "btn-green");
	btnAnnuler.addEventListener("click", ()=>location.reload());
	nodeListeProjets.appendChild(btnGroup);
}

const creerNouveauChamp = (nomChamp, nomInput, typeInput) =>{
	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel(nomChamp));
	nodeChamp.appendChild(creerInput(nomInput, typeInput));

	return nodeChamp;
}

const creerLabel = (nomChamp) =>{
	let nodeLabel = document.createElement("div");
	nodeLabel.setAttribute("class", "form-info-label");
	nodeLabel.innerHTML = nomChamp;

	return nodeLabel;
}

const creerInput = (nomInput, typeInput) =>{
	let nodeInput = document.createElement(typeInput);
	nodeInput.setAttribute("class", "form-info-input");
	nodeInput.setAttribute("name", nomInput);
	nodeInput.setAttribute("id", nomInput);

	return nodeInput;
}

const creerBouton = (fonctionnalite, parent, couleur) =>{
	let nodeBouton = document.createElement("div");
	nodeBouton.setAttribute("class", "single-btn btn "+ couleur);
	nodeBouton.setAttribute("id", fonctionnalite);
	nodeBouton.innerHTML = fonctionnalite;
	parent.appendChild(nodeBouton);

	return nodeBouton;
}

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}

const ajouterNouveauChampInfo = () =>{

	compteurInputInfo++;

	let nodeNouvelleInfo = document.createElement("div");

	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.appendChild(creerLabel("Champ #" + compteurInputInfo + ":"));
	nodeChamp.appendChild(creerInput("CHAMP" + compteurInputInfo, "input"));
	nodeNouvelleInfo.appendChild(nodeChamp);

	let nodeInfo = document.createElement("div");
	nodeInfo.setAttribute("class", "form-single-line");
	nodeInfo.appendChild(creerLabel("Information #" + compteurInputInfo + ":"));
	nodeInfo.appendChild(creerInput("INFO" + compteurInputInfo, "textarea"));
	nodeNouvelleInfo.appendChild(nodeInfo);
	nodeListeProjets.insertBefore(nodeNouvelleInfo, btnAjouterChamp);
	CKEDITOR.replace( 'INFO' + compteurInputInfo );

}