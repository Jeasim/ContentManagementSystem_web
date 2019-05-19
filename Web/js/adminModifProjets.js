let nodeListeProjets = null;

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
	champs.push(creerNouveauChamp("Champ:", "CHAMP", "input"));
	champs.push(creerNouveauChamp("Information:", "INFO","textarea"));
	ajouterNodesFormulaire(champs);
	CKEDITOR.replace( 'INFO' );
	CKEDITOR.replace( 'CONTENU' );
}

const ajouterNodesFormulaire = (champs) =>{
	champs.forEach(champ => {
		nodeListeProjets.appendChild(champ);
	});
}

const ajouterBoutons = (fonctionnalite) =>{
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

	console.log(nodeInput);


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

const viderNode = (node) =>{
	while (node.hasChildNodes()) {
		node.removeChild(node.firstChild);
	}
}