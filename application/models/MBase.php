<?php
class MBase extends CI_Model {
	//public $table;
    public function __construct(){
        parent::__construct();
    }

    public function clear_all()
    {
		$this->db->cache_delete_all();
    }

    public function clear($paths)
    {
        $path1 = $paths[1] OR null;
        $path2 = $paths[2] OR null;
        $path3 = $paths[3] OR null;
        $path4 = $paths[4] OR null;
		$this->db->cache_delete($path1, $path2, $path3, $path4);
    }
}