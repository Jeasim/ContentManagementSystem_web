<?php
	require_once("action/AdminModifProjets_Action.php");
	require_once("action/DAO/TexteModifiableDAO.php");

	$action = new AdminModifProjets_Action();
	$action->execute();

	require_once("partial/header.php");
?>

<script src="js/adminModifProjets.js"></script>

<!-- CONTENT -->
<div id="content">

	<div class="headline">
		<h3>Projets en cours</h3>
	</div>

	<?php
		foreach ($action->projetsEnCours as $projet) {
	?>

	<div class="bloc_blanc bloc_projet">
		<div class="container">

			<div class="row">
				<div class="col-sm-12">
					<div class="portfolio-item">
						<div class="row">
							<div class="col-sm-4">

								<div class="portfolio-item-thumbnail">
								image
								<!-- <img src="images/projets/photographe.jpg" alt=""> -->
								</div>

							</div><!-- col -->
							<div class="col-sm-8">
								<div class="portfolio-item-details">

									<h4>
										<a title="<?= $projet["NOM"] ?>"><?= $projet["NOM"] ?></a>
									</h4>

									<div class="btn-group">
										<div class="btn-blue btn single-btn">Modifier</div>
										<div class="btn-blue btn single-btn" onclick="confimerSupression(this, '<?= $projet['ID'] ?>')">Supprimer</div>
									</div>

								</div><!-- portfolio-item-details -->
							</div><!-- col -->
						</div><!-- row -->
					</div><!-- portfolio-item -->
				</div><!-- col -->
			</div><!-- row -->
		</div><!-- container -->
	</div>

	<?php
		}
	?>


	<div class="headline">
		<h3>Projets complétés</h3>
	</div>

	<?php
		foreach ($action->projetsTermines as $projet) {
	?>

	<div class="bloc_blanc bloc_projet">
		<div class="container">

			<div class="row">
				<div class="col-sm-12">
					<div class="portfolio-item">
						<div class="row">
							<div class="col-sm-4">

								<div class="portfolio-item-thumbnail">
								photo
								<!-- <img src="images/projets/photographe.jpg" alt=""> -->
								</div>portfolio-item-thumbnail

							</div><!-- col -->
							<div class="col-sm-8">
								<div class="portfolio-item-details">

									<h4>
										<a title="<?= $projet["NOM"] ?>"><?= $projet["NOM"] ?></a>
									</h4>
									<div class="btn-group">
										<div class="btn-blue btn single-btn">Modifier</div>
										<div class="btn-blue btn single-btn" onclick="confimerSupression(this, '<?= $projet['ID'] ?>')">Supprimer</div>
									</div>

								</div><!-- portfolio-item-details -->
							</div><!-- col -->
						</div><!-- row -->
					</div><!-- portfolio-item -->
				</div><!-- col -->
			</div><!-- row -->
		</div><!-- container -->
	</div>
	<?php
		}
	?>

</div><!-- CONTENT -->


<?php
	require_once("partial/footer.php");