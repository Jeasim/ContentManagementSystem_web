<?php
	require_once("action/Situation_handicap_Action.php");
	$action = new Situation_handicap_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/a_propos_header.php");
?>

<div class="blog-article">
	<h1>Qui sont les personnes en situation de handicap?</h1>
	<p>Les personnes en situation de handicap sont celles qui font face à des obstacles qui limitent leur participation sociale et leurs possibilités d’interaction avec leur environnement. Temporaire ou permanent, le handicap peut être de nature intellectuelle, sensorielle, physique, psychique ou sociale. Il n’est pas nécessaire d’être infirme pour se retrouver en situation de handicap. Tout le monde, à un moment ou un autre de la vie, peut se retrouver dans une situation de handicap.</p>
</div><!-- blog-article -->

<?php
	require_once("partial/a_propos_footer.php");
	require_once("partial/footer.php");