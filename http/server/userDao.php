<?php
    require_once('server/dao.php');
    /**
     * DAO für die User
     */
    class UserDao extends Dao
    {
        private $user;
        private $auth;

        public function __construct()
        {
            parent::construct('UserDao');
            $this->user = new \DB\SQL\Mapper($this->db, 'customers');
            $this->auth = new \Auth($this->user, array('id'=>'email', 'pw'=>'password'));
        }

        public function login($email, $password)
        {
            $login_result = $this->auth->login($email, $password);
            return $login_result;
        }

        public function getCustomerIDByEmail($mail)
        {
            $result = $this->user->find(array('email=?', $mail))[0]->id;
            return $result;
        }

        public function createCustomer($post) {
    			function _stringify($var) {
    				return "'".$var."'";
    			}
    			$tmp = "";

    			foreach ($post as $key => $value) {
    				if (in_array($key, array('Username', 'Password', 'Email', 'Vorname', 'Nachname'))) {
    					$tmp .= _stringify($value) . ', ';
    				}
    			}

    			$this->setCallQuery("createCustomer", rtrim($tmp, " ,"));
    			return $this->execQuery();
    		}
    }
?>
