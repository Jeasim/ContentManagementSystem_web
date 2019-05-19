

window.onload = () =>{
	console.log("onload");

}


const confimerSupression = (node, projetID) =>{
	let nodeBtnGroup = node.parentNode;
	viderNode(nodeBtnGroup);
	let btnConfirmer = creerBouton("Confirmer", nodeBtnGroup, "btn-red");
	let btnAnnuler = creerBouton("Annuler", nodeBtnGroup, "btn-green");

	btnConfirmer.addEventListener("click", ()=>supprimerProjet(projetID));
	btnAnnuler.addEventListener("click", ()=>location.reload());
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