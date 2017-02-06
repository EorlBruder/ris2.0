<?php
	require_once('../server/dao.php');
	/**
	 * DAO für die Zutaten
	 * author: EorlBrother
	 * date: 13.01.15
	 */
	class IngredientDao extends Dao
	{
		public function __construct()
		{
			parent::construct('IngredientDao');
			//parent::setTable('ingredients');
		}

		/**
		 * Gibt alle Bilder einer Zutat mit der gegebenen id zurück
		 */
		public function getPicturesForIngredientWithId($id)
		{
			//TODO dm, 9.12.14: Implementieren
		}

		public function findByName($name)
		{
			$this->setCallQuery("findIngredientByName", "'%".$name."%'");
			return $this->execQuery();
		}

		public function findByID($id)
		{
			$this->setCallQuery("findIngredientByID", $id);
			return $this->execQuery();
		}

		public function getAllUnits() {
			$this->setCallQuery("getAllUnits", null);
			return $this->execQuery();
		}

		public function createIngredient($post) {
			function _stringify($var) {
				return "'".$var."'";
			}
			$tmp = "";

			foreach ($post as $key => $value) {
				if (in_array($key, array('name', 'basiseinheit', 'beschreibung', 'aufbewahrung'))) {
					$tmp .= _stringify($value) . ', ';
				}
			}

			$this->setCallQuery("createIngredient", rtrim($tmp, " ,"));
			return $this->execQuery();
		}

	}
?>
