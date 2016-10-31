<?php

class Top extends MBase {
    protected $_t = "tf1_productcategories";

    public function __construct() {
        parent::__construct();
    }

    public function db_cache_clear($status)
    {
    	if($status)
    	{
    		$paths = array(1 => 'api', 2 => 'catalog');
        	parent::clear($paths);
    	}
    }

    public function get()
    {
        $query = $this->db->get($this->_t);
		return $query->result();
    }

    public function add($data)
    {
    	$result = array();
    	try {
        	$status = $this->db->insert($this->_t, $data);
        	$this->db_cache_clear($status);
        	$result['status'] = $status;
    	} catch(Exception $e) {
		    if( ! $result['status']) // In Pro: we can able catch the errors but not in dev with default config
		    {
		    	$result['error'] = $this->db->error();
		    }
		}
		return $result;
    }

    public function update($data)
    {
    	$id = $data->id;
    	$this->db->set($data);
		$this->db->where('id', $id);
        $result = $this->db->update($this->_t, $data);
		return $result;
    }

    public function delete($data)
    {
    	$id = $data['id'];
		$this->db->where('id', $id);
        $result = $this->db->delete($this->_t);
		return $result;
    }
}