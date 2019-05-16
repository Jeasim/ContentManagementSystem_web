<?php
	require_once("action/AdminModifEquipe_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifEquipe_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="ckeditor/ckeditor.js"></script>


<h1 class="page-Modif-h1">Modifier la page "Équipe"</h1>

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
			<div class="btn-blue btn btn-modifier-liste">Modifier la liste</div>

		</div>


		<div class="employes">
			<div class="liste-employes">
				<?php
					foreach ($action->employes as $employe) {
						?>
							<div class="employe">
								<p class="nom-employe"><?= $employe["NOM"] ?></p>
								<div class="poste-employe"><?= $employe["POSTE"] ?></div>
								<?php
									if(isset($employe["INFOS"])){
										foreach ($employe["INFOS"] as $infoSup) {
											?>
												<p class="info-supplementaire-employe"><?= $infoSup ?></p>
											<?php
										}
									}
								?>
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
									<div class="btn-blue btn single-btn">Modifier</div>
									<div class="btn-blue btn single-btn">Supprimer</div>
								</div>

							</div>
						<?php
					}
				?>

			</div>
		</div>

</div>



<?php
	require_once("partial/footer.php");