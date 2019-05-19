<?php
	require_once("action/DAO/TexteModifiableDAO.php");
	require_once("action/Nos_projets_Action.php");
	$action = new Nos_projets_Action();
	$action->execute();

	require_once("partial/header.php");
?>

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
								photo
								<!-- <img src="images/projets/photographe.jpg" alt=""> -->
								</div>portfolio-item-thumbnail

							</div><!-- col -->
							<div class="col-sm-8">
								<div class="portfolio-item-details">

									<h4>
										<a title="<?= $projet["NOM"] ?>"><?= $projet["NOM"] ?></a>
									</h4>
									<a class="btn btn-blue" href="">
										Voir les détails du projet
									</a>

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
									<a class="btn btn-blue" href="">
										Voir les détails du projet
									</a>

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