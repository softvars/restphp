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

    public function get($cid)
    {
        $this->db->select('*');
        $this->db->from($this->_t);
        $this->db->where('tf1_products.categoryid', $cid);
        //$this->db->join('tf1_productoptions', 'tf1_productoptions.productid = tf1_products.id', 'left');
        $products = $this->db->get()->result();
        /*if (isset($products))
        {
            $this->db->select('*');
            $this->db->from('tf1_productoptions');
            $this->db->where('tf1_productoptions.productid', $pid);
            $this->db->join('tf1_options', 'tf1_productoptions.optionid = tf1_options.id', 'left');
            $product_options = $this->db->get()->result();
            $products['options'] = $product_options;
        }*/
        return $products;
    }
}