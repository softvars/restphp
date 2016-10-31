<?php
class Product extends MY_Controller {


    function __construct()
    {
        parent::__construct();
        //$this->load->model('catalog/top');
        //$this->load->model('helper/dbcache');
        // Your own constructor code
    }

    public function details($pid = NULL)
    {
    	//$this->load->model('product/details');
    	$status = $pid != NULL;
    	$result = $status ? $this->details->get($pid) : array(message => 'Invalid product id');

		$res = array();
        $res['status'] = $status;
        $res['data'] = $result;
		//$res =  parent::_genRes(true, $result);
		parent::_setOutputWithDefaultHeaders($res);
    }

    /*public function list_($cid = '')
    {
    	$this->load->model('product/products');
		$result = $this->products->get($cid);
		$this->_setOutputWithDefaultHeaders($result);
    }*/

	/*public function productoptions()
    {
    	$this->load->model('product/options');
		$result = $this->options->get();
		$this->_setOutputWithDefaultHeaders($result);
    }*/
}