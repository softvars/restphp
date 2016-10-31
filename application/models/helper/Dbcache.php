<?php
class Dbcache extends CI_Model {

    public function __construct(){
        parent::__construct();
    }

    public function clear_all()
    {
		$this->db->cache_delete_all();
    }

    public function clear($path1, $path2, $path3, $path4)
    {
		$this->db->cache_delete($path1, $path2, $path3, $path4);
    }
}