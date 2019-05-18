<?php
	require_once("action/Nous_joindre_Action.php");
	$action = new Nous_joindre_Action();
	$action->execute();

	require_once("partial/header.php");
	require_once("partial/breadcrump_pageHeader.php");
?>

<div class="container">
	<div class="row">
		<div class="col-sm-12">

			<div class="headline">

				<h1>Nous joindre</h1>

			</div><!-- headline -->

		</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->

<div class="container">
	<div class="row">
		<div class="col-sm-7">

			<form id="nousJoindre-form" name="nousJoindre-form" method="post" action="nous_joindre.php">
				<fieldset>

					<div id="alert-area"></div>

					<input class="col-xs-12" id="name" type="text" name="name" placeholder="Nom" required>

					<input class="col-xs-12" id="email" type="email" name="email" placeholder="Courriel" required>

					<input class="col-xs-12" id="subject" type="text" name="subject" placeholder="Sujet" required>

					<textarea class="col-xs-12" id="message" name="message" rows="8" cols="25" placeholder="Message" required></textarea>

					<input class="btn btn-blue" id="submit" type="submit" name="submit" value="Soumettre" required>

				</fieldset>
			</form>

		</div><!-- col -->
		<div class="col-sm-5">

			<div class="widget widget-contact" style="margin-bottom:50px;">

				<h4 class="widget-title">CRISPESH</h4>

				<ul>
					<li>
						<i class="mt-icons-map-marker"></i>
						255, rue Ontario Est <br>
						Montréal (QC) H2X 1X6
					</li>
					<li>
						<i class="mt-icons-telephone"></i>
						<span class="hidden-xs">514-982-3437 #2836</span>
						<a class="visible-xs-inline" href="tel:5149823437">514-982-3437 #2836</a>
					</li>
					<li>
						<i class="mt-icons-mail"></i>
						<a href="mailto:crispesh@cvm.qc.ca">crispesh@cvm.qc.ca</a>
					</li>
				</ul>

			</div><!-- widget-contact -->

			<div class="widget widget-social">
				<div class="rond_background bleu droite grosseur_2" id="cercle_14"></div>
				<div class="rond_background rouge droite grosseur_1" id="cercle_15"></div>
				<div class="social-media">

					<a class="facebook" href="https://www.facebook.com/Crispesh" target="_blank">
						<img src="images/logos/facebook.svg" alt="Facebook - Crispesh" class="icon-">
					</a>
					<a class="linkedin" href="https://www.linkedin.com/in/catherine-loiselle-22ab77b4?authType=NAME_SEARCH&authToken=WM3S&locale=fr_FR&trk=tyah&trkInfo=clickedVertical%3Amynetwork%2CclickedEntityId%3A408988546%2CauthType%3ANAME_SEARCH%2Cidx%3A1-4-4%2CtarId%3A1479849945623%2Ctas%3Acatheri" target="_blank">
						<img src="images\logos\linkedin.svg" alt="Facebook - Crispesh" class="icon-">
					</a>


				</div><!-- social-media -->

			</div><!-- widget-social -->

		</div><!-- col -->
	</div><!-- row -->
</div><!-- container -->
<hr>

<?php
	require_once("partial/footer.php");