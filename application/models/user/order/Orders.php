<?php
class Orders extends CI_Model {

        public function get()
        {
            $query = $this->db->get('tf1_orders');
			return $query->result();
        }
}