<?php
class Options extends CI_Model {

        public function get() {
            $query = $this->db->get('tf1_productoptions');
			return $query->result();
        }
}