<div id="content">

	<div id="page-header" class="style-1">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">

					<h4><?= $action->getPageTitle() ?></h4>

				</div><!-- col -->
				<div class="col-sm-6">

					<ol class="breadcrumb">
						<li><a href="index.php">Accueil</a></li>
						<?php
							if($action->getPageTitle() === "Qui sommes-nous?"){
								?>
									<li class="active">À propos</li>
								<?php
							}
							else{
								?>
									<li><a href="qui_sommes_nous.php">À propos</a></li>
									<li class="active"><?= $action->getPageTitle() ?></li>
								<?php
							}
						?>
					</ol>

				</div><!-- col -->
			</div><!-- row -->
		</div><!-- container -->
	</div><!-- page-header -->

	<div class="container">
		<div class="row">

			<div class="col-sm-5">
				<div class="widget widget-categories">
					<ul>
						<li><a href="inclusion_sociale.php">L’inclusion sociale</a></li>
						<li><a href="innovation_sociale.php">L'innovation sociale</a></li>
						<li><a href="conception_handicap.php">Notre conception du handicap</a></li>
						<li><a href="situation_handicap.php">Qui sont les personnes en situation de handicap</a></li>
						<li><a href="champs_expertise.php">Champs d'expertise</a></li>
						<li><a href="partenaires.php">Nos partenaires</a></li>
					</ul>
				</div><!-- widget-categories -->
			</div><!-- col -->

			<div class="col-sm-7">
