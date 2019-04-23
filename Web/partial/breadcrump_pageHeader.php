<div id="page-header" class="style-1">
		<div class="container">

			<div class="row">

				<div class="col-sm-6">

					<h4><?= $action->getSection() ?></h4>

				</div><!-- col -->
				<div class="col-sm-6">
					<ol class="breadcrumb">
						<li><a href="index.php">Accueil</a></li>

						<?php
							if($action->getParentPageTitle() === "Accueil"){
								?>
									<li class="active"> <?= $action->getPageTitle() ?> </li>
								<?php
							}
							else{
								?>
									<li><a href="<?= $action->getParentPageURL() ?>"> <?= $action->getParentPageTitle() ?> </a></li>
									<li class="active"><?= $action->getPageTitle() ?></li>
								<?php
							}
						?>

					</ol>
				</div><!-- col -->
			</div><!-- row -->
	</div><!-- container -->
</div><!-- page-header -->