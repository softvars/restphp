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
}