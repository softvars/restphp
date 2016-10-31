<?php
class Prod_list extends MBase {
	protected $_t = "tf1_products";

    public function __construct() {
        parent::__construct();
    }

/*    public function db_cache_clear($status)
    {
    	if($status)
    	{
    		$paths = array(
    			1 => 'api', 
    			2 => 'products'
    		);
        	parent::clear($paths);
    	}
    }*/

    public function get()
    {
        $query = $this->db->get($this->_t);
        //$this->db->join('comments', 'comments.id = blogs.id');
		return $query->result();
    }
}