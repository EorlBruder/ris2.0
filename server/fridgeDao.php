<?php
	require_once('../server/dao.php');
	/**
	 * DAO für den Kühlschrank
	 * author: EorlBrother
	 * date: 28.03.16
	 */
	class FridgeDao extends Dao
	{
		public function __construct()
		{
			parent::construct('FridgeDao');
		}

		public function getFridgeForCustomer($id)
		{
			$this->setCallQuery("getFridgeForCustomer", $id);
			return $this->execQuery();
		}
	}
?>
