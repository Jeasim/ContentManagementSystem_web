<?php
	require_once("action/AdminModifEquipe_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifEquipe_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<select name="departement">
	<?php
		foreach ($action->departements as $departement) {
			?>
				<option><?= $departement ?></option>
			<?php
		}
	?>
</select>


<?php
	require_once("partial/footer.php");