<?php
class Products extends MY_Controller {


    /*public function index($cid)
    {
    	$this->load->model('product/prod_list');
		$result = $this->prod_list->get($cid);
		$this->_setOutputWithDefaultHeaders($result);
    }*/
    function __construct()
    {
        parent::__construct();
        //$this->load->model('catalog/top');
        //$this->load->model('helper/dbcache');
        // Your own constructor code
    }
    public function ptdlist($cid = '')
    {
    	//$this->load->model('product/prod_list');
		$result = $this->prod_list->get($cid);
		parent::_setOutputWithDefaultHeaders($result);
    }

	/*public function productoptions()
    {
    	$this->load->model('product/options');
		$result = $this->options->get();
		$this->_setOutputWithDefaultHeaders($result);
    }*/
}