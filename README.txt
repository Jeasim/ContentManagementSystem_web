*-------------------------------------------------*
*	Fonctionnement du site du CRISPESH	  *
*	R�alis� par Jean-Simon Bondaz		  *
*-------------------------------------------------*

- Pour initialiser les donn�es du site, il faut rouler le script .sql dans Oracle situ� dans le dossier BD du site web

- Tel qu'indiqu� dans le fichier action/DAO/constantes.php, voici l'identifiant de connection pour le connecter sur Oracle :
	le nom de la base donn�es est "DECINFO"
	le nom d'usager est "e0836527"
	le mot de passe est "AAAaaa123"

- Pour le se connecter en mode administrateur, on doit acc�der � la page .../portailAdmin
	nom d'usager : admin
	mot de passe : solutionAdmin

- L'admin pourra modifier :
	deux �l�ments de la page d'accueil (ent�te et pr�sentation)
	la page �quipe (ajouter, modifier, supprimer des employ�s)
	la page de projets (ajouter, modifier, supprimer des projets)

- L'ajout d'images n'est malheureusement pas encore impl�ment� pour les projets