*-------------------------------------------------*
*	Fonctionnement du site du CRISPESH	  *
*	Réalisé par Jean-Simon Bondaz		  *
*-------------------------------------------------*

- Pour initialiser les données du site, il faut rouler le script .sql dans Oracle situé dans le dossier BD du site web

- Tel qu'indiqué dans le fichier action/DAO/constantes.php, voici l'identifiant de connection pour le connecter sur Oracle :
	le nom de la base données est "DECINFO"
	le nom d'usager est "e0836527"
	le mot de passe est "AAAaaa123"

- Pour le se connecter en mode administrateur, on doit accéder à la page .../portailAdmin
	nom d'usager : admin
	mot de passe : solutionAdmin

- L'admin pourra modifier :
	deux éléments de la page d'accueil (entête et présentation)
	la page équipe (ajouter, modifier, supprimer des employés)
	la page de projets (ajouter, modifier, supprimer des projets)
