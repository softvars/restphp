<?php
class Home extends CI_Controller {

	protected function _setOutputWithDefaultHeaders($data)
	{
		$self = $this;
		$self->output
			->set_status_header(200)
			->set_content_type('json')
    		->set_output(json_encode($data));

    	$self->output->set_header('HTTP/1.0 200 OK');
		$self->output->set_header('HTTP/1.1 200 OK');
		//$this->output->set_header('Last-Modified: '.gmdate('D, d M Y H:i:s', $last_update).' GMT');
		$self->output->set_header('Cache-Control: no-store, no-cache, must-revalidate');
		$self->output->set_header('Cache-Control: post-check=0, pre-check=0');
		$self->output->set_header('Pragma: no-cache');
    	/*->_display();*/
	}

    public function index()
    {
    	$this->load->model('main');
		$result = $this->main->init();
		$this->_setOutputWithDefaultHeaders($result);
    }

    public function catalog()
    {
    	$this->load->model('product/categories');
		$result = $this->categories->get();
		$this->_setOutputWithDefaultHeaders($result);
    }

    public function products()
    {
    	$this->load->model('product/products');
		$result = $this->products->get();
		$this->_setOutputWithDefaultHeaders($result);
    }

	public function productoptions()
    {
    	$this->load->model('product/options');
		$result = $this->options->get();
		$this->_setOutputWithDefaultHeaders($result);
    }
    /*have to join*/

	public function optiongroups()
    {
    	$this->load->model('option/groups');
		$result = $this->groups->get();
		$this->_setOutputWithDefaultHeaders($result);
    }

	public function options()
    {
    	$this->load->model('option/options');
		$result = $this->options->get();
		$this->_setOutputWithDefaultHeaders($result);
    }

    public function users()
    {
    	$this->load->model('user/users');
		$result = $this->users->get();
		$this->_setOutputWithDefaultHeaders($result);
    }
    public function address()
    {
    	$this->load->model('user/address');
		$result = $this->address->get();
		$this->_setOutputWithDefaultHeaders($result);
    }
}