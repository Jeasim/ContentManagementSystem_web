<?php
	require_once("action/AdminModifEquipe_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifEquipe_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="ckeditor/ckeditor.js"></script>
<script src="js/adminModifEquipe.js"></script>

<h1 class="page-Modif-h1">Modifier la page Équipe</h1>

<div class="contenu-page-Modif">

		<div class="modif-departements">

			<div class="liste-departements">
				<ul>
					<?php
						foreach ($action->departements as $departement) {
							?>
								<a href="?departementSelectionne=<?= $departement ?>"><li><?= $departement ?></li></a>
							<?php
						}
					?>
				</ul>
			</div>
		</div>

		<div class="employes">
			<div class="liste-employes">
				<?php
					if(isset($_GET["departementSelectionne"])){
						?>
							<h2><?= $_GET["departementSelectionne"] ?></h2>
						<?php

						foreach ($action->employes as $employe) {
							?>
								<div class="employe">
									<p class="nom-employe"><?= $employe["NOM"] ?></p>
									<div class="poste-employe"><?= $employe["POSTE"] ?></div>
									<div class="info-supplementaire-employe"><?= $employe["INFO_SUP1"] ?></div>
									<div class="info-supplementaire-employe"><?= $employe["INFO_SUP2"] ?></div>
									<ul class="info-contact-employe">
										<?php
											if(isset($employe["COURRIEL"])){
										?>
												<li><?= $employe["COURRIEL"] ?></li>
										<?php
											}
											if(isset($employe["NUMTEL"])){
										?>
												<li><?= $employe["NUMTEL"] ?></li>
										<?php
											}
										?>
									</ul>
									<div class="btn-group">
										<div class="btn-blue btn single-btn" id="btn-modifier" onclick="formulaireModifier('<?= $employe['ID'] ?>')">Modifier</div>
										<div class="btn-blue btn single-btn" id="btn-supprimer" onclick="confimerSupression(this, '<?= $employe['ID'] ?>')">Supprimer</div>
									</div>

								</div>
							<?php
						}
					}
				?>
			</div>
			<div class="btn-blue btn single-btn" id="btn-ajouter" onclick="formulaireAjouter('<?= $action->departementSelectionne ?>')">Ajouter un employé</div>
		</div>
</div>

<?php
	require_once("partial/footer.php");