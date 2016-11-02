<?php
class Details extends MBase {
    protected $_t = "tf1_products";

    public function __construct() {
        parent::__construct();
    }

    public function db_cache_clear($status)
    {
    	if($status)
    	{
    		$paths = array(1 => 'api', 2 => 'product');
        	parent::clear($paths);
    	}
    }
    public function get($pid)
    {
    	$this->db->select('*');
		$this->db->from($this->_t);
        $this->db->where('tf1_products.id', $pid);
        //$this->db->join('tf1_productoptions', 'tf1_productoptions.productid = tf1_products.id', 'left');
        $product = $this->db->get()->row_array();
		if (isset($product))
		{
			$this->db->select('*');
			$this->db->from('tf1_productoptions');
		    $this->db->where('tf1_productoptions.productid', $pid);
		    $this->db->join('tf1_options', 'tf1_productoptions.optionid = tf1_options.id', 'left');
		    $product_options = $this->db->get()->result();
			$product['options'] = $product_options;
		}
		return $product;
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