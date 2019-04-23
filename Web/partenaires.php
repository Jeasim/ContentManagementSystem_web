<?php
	require_once("action/Partenaires_Action.php");
	$action = new Partenaires_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/a_propos_header.php");
?>

<div class="blog-article">
	<h1>Nos partenaires</h1>
			<p>Service d’aide à l’intégration des élèves (SAIDE) :
				<a href="http://www.cvm.qc.ca/formationreg/saide/Pages/index.aspx" target="_blank">www.cvm.qc.ca/formationreg/saide/Pages/index.aspx</a></p>

			<p>Centre AccessAbility :
				<a href="http://www.dawsoncollege.qc.ca/our-services/student-services/student-accessability-centre" target="_blank">www.dawsoncollege.qc.ca/our-services/student-services/student-accessability-centre</a></p>

			<p>Réseau de recherche Adaptech :
				<a href="http://www.adaptech.org" target="_blank">www.adaptech.org</a></p>

			<p>L’association québécoise des étudiants ayant des incapacités au postsecondaire (AQEIPS) :
				<a href="http://www.aqeips.qc.ca" target="_blank">www.aqeips.qc.ca</a></p>

			<p>Centres collégiaux de soutien à l’intégration – CCSI, de l’ouest et de l’est du Québec :
				<a href="http://ccsi.quebec/" target="_blank">www.ccsi.quebec</a></p>

			<p>Centraide du Grand Montréal :
				<a href="http://www.centraide-mtl.org/fr/" target="_blank">http://www.centraide-mtl.org/fr/</a></p>

			<p>Centre intégré de santé et de services sociaux de la Montérégie-Ouest (CISSSMO) :
				<a href="http://www.santemonteregie.qc.ca/index.fr.html" target="_blank">www.santemonteregie.qc.ca/index.fr.html</a></p>

			<p>Hébergement communautaire Ungava :
				<a href="https://hebergementcommunautaireungava.wordpress.com/" target="_blank">https://hebergementcommunautaireungava.wordpress.com/</a></p>

			<p>Conseil scolaire des premières Nations en éducation aux adultes (CSPNEA) :
				<a href="http://www.conseilscolaire-schoolcouncil.com/" target="_blank">http://www.conseilscolaire-schoolcouncil.com/</a></p>

			<p>Commission de développement des ressources humaines des premières Nations du Québec (CDRHPNQ) :
				<a href="https://employnations.com/" target="_blank">https://employnations.com/</a></p>

			<p>Commission de développement économique des Premières Nations du Québec et du Labrador (CDEPNQL) :
				<a href="http://www.cdepnql.org/ target="_blank"">http://www.cdepnql.org/</a></p>

			<p>Tewatonhnhi’saktha :
				<a href="http://tewa.ca/fr/" target="_blank">http://tewa.ca/fr/</a></p>

			<p>Fondation Martin :
				<a href="http://www.maei-ieam.ca/" target="_blank">http://www.maei-ieam.ca/</a></p>
</div><!-- blog-article -->

<?php
	require_once("partial/a_propos_footer.php");
	require_once("partial/footer.php");