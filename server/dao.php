<?php
	require_once('../server/constants.php');
	require_once('../server/helpers.php');

	/**
	 * Diese Klasse stellt Funktionen zur Datenbankinteraktion zur Verfügung
	 * s. http://de.wikipedia.org/wiki/Data_Access_Object für Pattern
	 * author: EorlBrother
	 * date: 03.12.14
	 */
	class Dao
	{
		protected $db;
		private $query;
		private $logger;

		/**
		 * Konstruktor
		 */
		public function __construct()
		{
			$this->construct('Dao');
		}

		/**
		 * Interner Konstruktor, dem der Loggername übergeben wird. Wird von den
		 * Unterklassen verwendet.
		 */
		protected function construct($loggername)
		{
			$this->configure();
			$this->logger = Logger::getLogger($loggername);
		}

		/**
		 * Setzt die Datenbankverbindung
		 */
		private function configure()
		{
			$config = parse_ini_file('../config/ris.ini');
			$this->db=new DB\SQL($config['db_path'],$config['db_user'],$config['db_password']);
			new \DB\SQL\Session($this->db);
			return $this->db->exec("SET NAMES utf8");
		}

		/**
		 * Setzt die Query
		 */
		protected function setQuery($query)
		{
			$this->query = $query;
		}

		/**
		 * = setQuery(buildCallQuery())
		 */
		protected function setCallQuery($function, $params_string)
		{
			$this->query = $this->buildCallQuery($function, $params_string);
		}

		/**
		 *	Hilfsfunktion zum Bauen eines CALL-Query für Stored Procedures
		 */
		protected function buildCallQuery($function, $params_string)
		{
			return "CALL ".$function."(".$params_string.")";
		}

		/**
		 * Gibt die Anzahl der "affected rows" des letzten Query aus
		 */
		protected function resultCount()
		{
			return $this->db->count();
		}

		/**
		 * Führt die $query aus
		 */
		protected function execQuery()
		{
			$this->logger->debug($this->query);
			return $this->db->exec($this->query);
		}
	}
?>
