let nodeListeProjets 	= null;
let btnAjouterChamp		= null;
let nodeChampsSup		= null;
let compteurInputInfo 	= 1;
let infoSupIDs			= [];

window.onload = () =>{
	nodeListeProjets = document.querySelector(".listeProjets");
}

const formulaireAjouter = () =>{
	viderNode(nodeListeProjets);
	creerFormulaireProjet("Ajouter un projet", "Ajouter");
	document.getElementById("Ajouter").addEventListener("click", ajouterNouveauProjet);
	(document.getElementById("btn-ajouter-projet")).style.display = "none";
}

const formulaireModifier = (projetID) =>{
	viderNode(nodeListeProjets);
	creerFormulaireProjet("Modifier un projet", "Modifier");
	remplirChampsInfosProjets(projetID);
	remplirChampsInfosSupProjets(projetID);
	(document.getElementById("btn-ajouter-projet")).style.display = "none";
	(document.getElementById("Modifier")).addEventListener("click", ()=>modifierProjet(projetID));
}

const ajouterNouveauProjet = () =>{
	if(champsObligatoiresRemplis()){
		ajouterProjet();
		ajouterInfoSup();
	}
	else{
		alert("Les champs 'nom' et 'contenu' doivent être remplis'")
	}
}

const confimerSupression = (node, projetID) =>{
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerProjet(projetID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
}

const remplirChampsInfosProjets = (projetIDParam) =>{

	$.ajax({
        url : "fetchProjet.php",
        type: "POST",
        data: {
			projetID : projetIDParam
		}
    })
    .done(response => {
		infosProjet = JSON.parse(response);

		console.log(infosProjet["CONTENU"]);

		document.querySelector("input[name = 'NOM']").value = infosProjet["NOM"];
		CKEDITOR.instances.CONTENU.setData( infosProjet["CONTENU"] );
		document.getElementById("select-statut-input").value = infosProjet["STATUT"];
	});
}

const champsObligatoiresRemplis = () =>{
	return ((document.querySelector("input[name = 'NOM']").value != "") && (CKEDITOR.instances.CONTENU.getData()));
}

// Requêtes AJAX
const ajouterProjet = () =>{

	$.ajax({
		url : "ajouterProjet.php",
		type: "POST",
		data: {
			nom : 		document.querySelector("input[name = 'NOM']").value,
			contenu : 	CKEDITOR.instances.CONTENU.getData(),
			statut : 	document.getElementById("select-statut-input").value
		}
	})
	.done(response => {
		message = JSON.parse(response);
		location.reload();
	});

}

const ajouterInfoSup = () =>{

	for (let i = 1; i <= compteurInputInfo; i++) {

		champID = "CHAMP" + i;
		infoID = "INFO" + i;

		if(CKEDITOR.instances[infoID].getData() != ""){
			$.ajax({
				url : "ajouterInfosSupProjet.php",
				type: "POST",
				data: {
					champ : 	document.getElementById(champID).value,
					info : 		CKEDITOR.instances[infoID].getData(),
					nom : 		document.querySelector("input[name = 'NOM']").value,
				}
			})
			.done(response => {
				message = JSON.parse(response);
				location.reload();
			});
		}
	}
}


const modifierProjet = (projetIDParam) =>{
	$.ajax({
		url : "modifierProjet.php",
		type: "POST",
		data: {
			projetID :		projetIDParam,
			nom : 		document.querySelector("input[name = 'NOM']").value,
			contenu : 	CKEDITOR.instances.CONTENU.getData(),
			statut : 	document.getElementById("select-statut-input").value
		}
	})
	.done(response => {
		message = JSON.parse(response);
		modifierInfosProjet(projetIDParam);
	});
}

const modifierInfosProjet = (projetIDParam) =>{

	supprimerInfosSup(projetIDParam);


	for (let i = 1; i <= compteurInputInfo; i++) {

		champID = "CHAMP" + i;
		infoID = "INFO" + i;
		indexID = 0;
		console.log(infoSupIDs[indexID]);

		if(CKEDITOR.instances[infoID].getData() != ""){
			$.ajax({
				url : "ajouterInfosSupProjet.php",
				type: "POST",
				data: {
					champ : 	document.getElementById(champID).value,
					info : 		CKEDITOR.instances[infoID].getData(),
					nom : 		document.querySelector("input[name = 'NOM']").value,
				}
			})
			.done(response => {
				message = JSON.parse(response);
				location.reload();
			});
		}

		indexID++;
	}
}

const supprimerInfosSup = (projetIDParam) => {
	$.ajax({
		url : "supprimerInfosSupProjet.php",
		type: "POST",
		data: {
			projetID : projetIDParam
		}
	})
	.done(response => {
		message = JSON.parse(response);
	});
}

const remplirChampsInfosSupProjets = (projetIDParam) =>{
	$.ajax({
		url : "fetchInfosSupProjet.php",
        type: "POST",
        data: {
			projetID : projetIDParam
		}
    })
    .done(response => {
		infosSupProjet = JSON.parse(response);

		infosSupProjet.forEach(infoSupProjet => {
			ajouterNouveauChampInfo();

			compteurInputInfoInterne = compteurInputInfo - 1;

			champID = "CHAMP" + compteurInputInfoInterne;
			infoID = "INFO" + compteurInputInfoInterne;

			document.getElementById(champID).value = infoSupProjet.CHAMP;
			CKEDITOR.instances[infoID].setData(infoSupProjet.INFO);

			infoSupIDs.push(infoSupProjet.ID);
		});
	});
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
	ajouterNodesFormulaire(champs);

	nodeChampsSup = document.createElement("div");
	nodeChampsSup.setAttribute("id", "champsSup");
	let nodeChampSup =  creerNouveauChamp("Champ #" + compteurInputInfo +  ":", "CHAMP" + compteurInputInfo, "input");
	let nodeInfoSup =  creerNouveauChamp("Information #" + compteurInputInfo +  ":", "INFO" + compteurInputInfo,"textarea");
	nodeChampsSup.appendChild(nodeChampSup);
	nodeChampsSup.appendChild(nodeInfoSup);
	nodeListeProjets.appendChild(nodeChampsSup);

	let nodeStatutProjet = creerSelectionStatut();
	nodeListeProjets.appendChild(nodeStatutProjet);

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
	btnAjouterChamp.innerHTML = "Ajouter un champ supplémentaire";
	btnAjouterChamp.addEventListener("click", ajouterNouveauChampInfo);
	nodeListeProjets.insertBefore(btnAjouterChamp, document.getElementById("select-statut"));

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

	nodeChampsSup.appendChild(nodeNouvelleInfo);
	CKEDITOR.replace( 'INFO' + compteurInputInfo );
}

const creerSelectionStatut = () =>{

	let nodeChamp = document.createElement("div");
	nodeChamp.setAttribute("class", "form-single-line");
	nodeChamp.setAttribute("id", "select-statut");
	nodeChamp.appendChild(creerLabel("Statut du projet"));

	let nodeSelect = document.createElement("select");
	nodeSelect.setAttribute("id", "select-statut-input");

	let nodeOptionEnCours = document.createElement("option");
	nodeOptionEnCours.innerHTML = "En cours";
	nodeOptionEnCours.setAttribute("value", "0");

	let nodeOptionTermine = document.createElement("option");
	nodeOptionTermine.innerHTML = "Complété";
	nodeOptionTermine.setAttribute("value", "1");

	nodeSelect.appendChild(nodeOptionEnCours);
	nodeSelect.appendChild(nodeOptionTermine);

	nodeChamp.appendChild(nodeSelect);

	return nodeChamp;
}