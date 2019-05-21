<?php
	require_once("action/PortailAdmin_Action.php");

	$action = new PortailAdmin_Action();
	$action->execute();

	require_once("partial/header.php");
?>

	<div id="form-connection-admin">

		<div class="form-header">
			<div class="form-crispesh-logo"></div>
			<div class="form-title">Portail administrateur</div>
		</div>

		<form action="portailAdmin.php" method="post">

			<div class="form-single-line">
				<div class="form-info-label">Nom d'usager: </div>
				<input type="text" name="admin-username" id="form-admin-username-input" class="form-info-input">
			</div>

			<div class="form-single-line">
				<div class="form-info-label">Mot de passe: </div>
				<input type="password" name="admin-password" id="form-admin-password-input" class="form-info-input">
			</div>

			<button type="submit" id="form-connection-button" class="btn btn-green">Connection</button>

			<?php
				if ($action->wrongLogin) {
					?>
					<div class="form-connexion-error"><strong>Erreur : </strong>Connexion erronée</div>
					<?php
				}
			?>

		</form>


	</div>

<?php
	require_once("partial/footer.php");