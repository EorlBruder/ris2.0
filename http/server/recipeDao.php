<?php
	require_once('server/dao.php');
	/**
	 * DAO für die Rezepte
	 * author: EorlBrother
	 * date: 03.12.14
	 */
	class RecipeDao extends Dao
	{
		private $f3;

		public function __construct($f3 = null)
		{
			if($f3 != null) {
				$this->f3 = $f3;
			}
			parent::construct('RecipeDao');
		}

		public function findByName($name)
		{
			$this->setCallQuery("findRecipeByName", "'%".$name."%'");
			return $this->execQuery();
		}

		public function findByID($id)
		{
			$this->setCallQuery("findRecipeByID", $id);
			return $this->execQuery();
		}

		public function getFavoritesForCustomer($id)
		{
			$this->setCallQuery("getFavoritesForCustomer", "'".$id."'");
			return $this->execQuery();
		}

		public function addFavoriteForCustomer($recipeid)
		{
			$this->setCallQuery("addFavoriteForCustomer", $this->f3->get('SESSION.userID') . ', ' . $recipeid);
			return $this->execQuery();
		}

		public function removeFavoriteForCustomer($recipeid)
		{
			$this->setCallQuery("removeFavoriteForCustomer", $this->f3->get('SESSION.userID') . ', ' . $recipeid);
			return $this->execQuery();
		}

		public function createRecipe($post) {
			$result = Helpers::formPostStringBuilder($post, array('name', 'portions', 'difficulty', 'time', 'tools', 'zubereitung'));
			$this->setCallQuery("createRecipe", $result . ', ' . $this->f3->get('SESSION.userID'));
			return $this->execQuery();
		}
	}
?>
