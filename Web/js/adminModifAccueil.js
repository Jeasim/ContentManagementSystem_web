let editeur = null;

window.onload = () => {
	editeur = CKEDITOR.instances.editeur;
}

const choisirSection = (node) => {

	let sectionModif = null;

	if(node.textContent === "Entête"){
		sectionModif = "entete";
	}
	else if(node.textContent === "Présentation"){
		sectionModif = "presentation";
	}

    $.ajax({
        url : "ajaxAccueilModif.php",
        type: "POST",
        data: {
		 	section : sectionModif
		}
    })
    .done(result => {
		contenu = JSON.parse(result);
		editeur.setData( contenu );
    });
}