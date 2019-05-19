<?php
	require_once("action/Error_Action.php");
	$action = new Error_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="js/pageErreur.js"></script>

	<?php
		if ($_GET["code"] == 404) {
			?>
				<div class="zone-animation-loupe">
					<img src="assets\images\loupe2.svg" alt="loupe" id="loupe">
					<div class="texte-erreur" id="erreur-404">
						<h1>Impossible de trouver cette page</h1>
						<p>Nous ne trouvons pas la page que vous recherchez.</p>
					</div>
				</div>
				<script>
					animationLoupe();
				</script>

			<?php
		}
		else if ($_GET["code"] == 500) {
			?>
			<div class="zone-animation-loupe">
				<div class="texte-erreur" id="erreur-500">
					<h1>Une erreur interne s'est produite</h1>
					<p>Désolé pour ce désagrément.</p>
				</div>
			</div>

			<?php
		}
	?>






<?php
	require_once("partial/footer.php");