<?php
	session_start();

	abstract class CommonAction {
		public static $VISIBILITY_PUBLIC = 0;
		public static $VISIBILITY_ADMINISTRATOR = 1;

		private $pageVisibility;
		private $pageTitle;
		private $onglet;
		private $parentPageTitle;
		private $parentPageURL;
		private $section;

		public function __construct($pageVisibility, $pageTitle, $onglet = null, $parentPageTitle = null, $parentPageURL = null, $section = null) {
			$this->pageVisibility = $pageVisibility;
			$this->pageTitle = $pageTitle;
			$this->parentPageTitle = $parentPageTitle;
			$this->parentPageURL = $parentPageURL;
			$this->section = $section;
		}

		public function execute() {
			if (!empty($_GET["logout"])) {
				session_unset();
				session_destroy();
				session_start();
			}

			if (empty($_SESSION["visibility"])) {
				$_SESSION["visibility"] = CommonAction::$VISIBILITY_PUBLIC;
			}

			if ($_SESSION["visibility"] < $this->pageVisibility) {
				header("location:index");
				exit;
			}

			$this->executeAction();
		}

		protected abstract function executeAction();

		public function isLoggedIn() {
			return $_SESSION["visibility"] > CommonAction::$VISIBILITY_PUBLIC;
		}

		public function getPageTitle() {
			return $this->pageTitle;
		}

		public function getParentPageTitle() {
			return $this->parentPageTitle;
		}

		public function getParentPageURL() {
			return $this->parentPageURL;
		}

		public function getSection() {
			return $this->section;
		}
	}