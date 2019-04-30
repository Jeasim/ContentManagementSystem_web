
<!doctype html>
<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <meta name="keywords" content="">
    <meta name="description" content="">

    <title>CRISPESH - Centre de recherche pour l’inclusion des personnes en situation de handicap</title>

    <!-- FAVICON AND APPLE TOUCH -->
    <link rel="shortcut icon" href="assets/favicon/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="180x180" href="apple-touch-180x180.png">

    <!-- FONTS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:400,500,300">

    <!-- BOOTSTRAP CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">

    <!-- MT ICONS -->
    <link rel="stylesheet" href="assets/fonts/mt-icons/mt-icons.css">

    <!-- FANCYBOX -->
    <link rel="stylesheet" href="assets/plugins/fancybox/jquery.fancybox.css">

    <!-- REVOLUTION SLIDER -->
    <link rel="stylesheet" href="assets/plugins/revolutionslider/css/settings.css">

    <!-- OWL Carousel -->
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.carousel.css">
    <link rel="stylesheet" href="assets/plugins/owl-carousel/owl.transitions.css">

    <!-- MAGNIFY -->
    <link rel="stylesheet" href="assets/plugins/magnify/magnify.css">

    <!-- YOUTUBE PLAYER -->
    <link rel="stylesheet" href="assets/plugins/ytplayer/css/YTPlayer.css">

    <!-- TEXT ROTATOR -->
    <link rel="stylesheet" href="assets/plugins/text-rotator/morphext.css">

    <!-- ANIMATIONS -->
    <link rel="stylesheet" href="assets/plugins/animations/animate.min.css">

    <!-- CUSTOM & PAGES STYLE -->
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="assets/css/pages-style.css">


</head>

<body>
<div id="page-wrapper">
<!-- HEADER -->
<header>
    <div id="header-accessibilite">
        <a href="javascript:;" id="btn_contraste_eleve">Passer en contraste élevé</a>
        <a href="javascript:;" id="btn_niveau_gris">Basculer en niveau de gris</a>
        <a href="javascript:;" id="btn_taille_police">Changer la taille de la police</a>
    </div>

    <div id="header-top">

        <div class="container">
            <div class="row">

                <div class="col-sm-5">

                    <div class="widget widget-pages">

                        <ul>
                            <li>
                                <a href="https://www.facebook.com/Crispesh" target="_blank">
                                    <img src="images/logo_facebook.png" alt="Facebook - Crispesh">
                                </a>
                            </li>
                            <li>
                                <a href="https://www.linkedin.com/company/crispesh">
                                    <img src="images/logo_linkedin.png" alt="Linkedin - Crispesh">
                                </a>
                            </li>
                            <li>
                                <a href="#" id="btn_accessibilite">
                                    <img src="images/universal-access.png" alt="">
                                    Accessibilité

                                </a>
                            </li>
                            <li>
                                <div class="widget">
                                    <a href="#">English</a>
                                </div><!-- widget-language -->
                            </li>
                        </ul>

                    </div><!-- widget-pages -->

                </div><!-- col -->
            </div><!-- row -->
        </div><!-- container -->

    </div><!-- header-top -->

    <div id="header">

        <div class="container">
            <div class="row" id="row-menu-header">
                <div class="col-sm-3">

                    <!-- LOGO -->
                    <a id="logo" href="index.php">
                        <img src="assets/images/logo.png" alt="">
                    </a>

                </div><!-- col -->
                <div class="col-sm-9">

                    <!-- MENU -->
                    <nav>

                        <a id="mobile-menu-button" href="#"><i class="mt-icons-menu"></i></a>

                        <ul class="menu clearfix" id="menu">
                            <li class="active">
                                <a href="index.php">Accueil</a>
                            </li>
                            <li >
                                <a href="qui_sommes_nous.php">À propos</a>
                                <ul>
                                    <li>
                                        <a href="inclusion_sociale.php">L'inclusion sociale</a>
                                    </li>
                                    <li>
                                        <a href="innovation_sociale.php">L'innovation sociale</a>
                                    </li>
                                    <li>
                                        <a href="conception_handicap.php">Notre conception du handicap</a>
                                    </li>
                                    <li>
                                        <a href="situation_handicap.php">Qui sont les personnes en situation d'handicap</a>
                                    </li>
                                    <li>
                                        <a href="champs_expertise.php">Champs d'expertise</a>
                                    </li>
                                    <li>
                                        <a href="partenaires.php">Nos partenaires</a>
                                    </li>
                                </ul>
                            </li>
                            <li >
                                <a href="personnel_administratif.php">Équipe</a>
                            </li>
                            <li >
                                <a href="nos_projets.php">Nos Projets</a>
                            </li>
                           <li >
                                <a href="services.php">Nos Services</a>
                               <ul>

									<li class="active">
										<a href="recherche_appliquee.php">La recherche appliquée</a>
									</li>
									<li>
										<a href="services_accompagnement.php">Services d'accompagnement en innovation sociale</a>
									</li>
									<li>
										<a href="laboratoire_technologies_adaptatives.php">Laboratoire en technologies adaptatives</a>
									</li>
									<li>
										<a href="formation_transfert.php">La formation et transfert</a>
									</li>
                              </ul>
                          </li>
                            <li >
                                <a href="documentation.php">Documentation</a>
                            </li>

                            <li >
                                <a href="nous_joindre.php">Nous Joindre</a>
                            </li>

                        <?php
                        if($_SESSION["visibility"] === CommonAction::$VISIBILITY_ADMINISTRATOR){
                            ?>
                                <li>
                                    <a href="accueilAdmin.php">Administrateur</a>
                                    <ul>
                                        <li>
                                            <a href="">Modifier la page "Accueil"</a>
                                        </li>
                                        <li>
                                            <a href="">Modifier la page "Équipe"</a>
                                        </li>
                                        <li>
                                            <a href="">Modifier la page "Projets"</a>
                                        </li>
                                        <li>
                                            <a href="?logout=true">Se déconnecter</a>
                                        </li>
                                    </ul>
                                </li>
                            <?php
                        }
                    ?>
                        </ul>
                    </nav>


                </div><!-- col -->
            </div><!-- row -->
        </div><!-- container -->

    </div><!-- header -->

</header><!-- HEADER -->
<div id="content">