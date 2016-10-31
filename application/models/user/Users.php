<?php
class Users extends CI_Model {

        public function get()
        {
            $query = $this->db->get('tf1_users');
			return $query->result();
        }
}