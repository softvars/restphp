<?php
class Groups extends CI_Model {

        public function get()
        {
            $query = $this->db->get('tf1_optiongroups');
			return $query->result();
        }
}