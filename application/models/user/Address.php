<?php
class Address extends CI_Model {

        public function get()
        {
            $query = $this->db->get('tf1_address');
			return $query->result();
        }
}