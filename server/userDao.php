<?php
    require_once('../server/dao.php');  
    /**
     * DAO für die User
     */
    class UserDao extends Dao
    {
        private $user;
        private $auth;

        public function __construct() 
        {
            parent::construct('RecipeDao');
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
    }
?>