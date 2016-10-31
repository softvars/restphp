<?php
class Details extends CI_Model {

        public function get()
        {
            $query = $this->db->get('tf1_orderdetails');
			return $query->result();
        }
}