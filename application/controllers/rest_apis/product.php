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
    	$result = $status ? $this->details->get($pid) : array(message => 'Product id is required');

		$res = array();
        $res['status'] = $status;
        $res['data'] = $result;
		//$res =  parent::_genRes(true, $result);
		parent::_setOutputWithDefaultHeaders($res);
    }

    public function add()
    {
        $data = array();
        $data['sku'] = $this->input->input_stream('sku', TRUE);
        $data['name'] = $this->input->input_stream('name', TRUE);
        $data['price'] = $this->input->input_stream('price', TRUE);
        $data['weight'] = $this->input->input_stream('weight', TRUE);
        $data['cartdesc'] = $this->input->input_stream('cartdesc', TRUE);
        $data['shortdesc'] = $this->input->input_stream('shortdesc', TRUE);
        $data['longdesc'] = $this->input->input_stream('longdesc', TRUE);
        $data['thumb'] = $this->input->input_stream('thumb', TRUE);
        $data['image'] = $this->input->input_stream('image', TRUE);
        $data['categoryid'] = $this->input->input_stream('categoryid', TRUE);
        $data['createdtime'] = $this->input->input_stream('createdtime', TRUE);
        $data['stock'] = $this->input->input_stream('stock', TRUE);
        $data['live'] = $this->input->input_stream('live', TRUE);
        $data['unlimited'] = $this->input->input_stream('unlimited', TRUE);
        $data['location'] = $this->input->input_stream('location', TRUE);

        $res = $this->details->add($data);

        //$res =  parent::_genRes($status);
        parent::_setOutputWithDefaultHeaders($res);
    }

    public function update()
    {
        $data = json_decode($this->input->raw_input_stream);

        $result = $this->details->update($data);
        $res =  parent::_genRes(true, $result);
        parent::_setOutputWithDefaultHeaders($res);
    }

    public function delete()
    {
        $data = array();
        $data['id'] = $this->input->input_stream('id', TRUE);

        $result = $this->details->delete($data);
        $res =  parent::_genRes(true, $result);
        parent::_setOutputWithDefaultHeaders($res);

        //$status = $this->top->delete($data);
        //$res =  parent::_genRes($status, $data);

    }
	/*public function productoptions()
    {
    	$this->load->model('product/options');
		$result = $this->options->get();
		$this->_setOutputWithDefaultHeaders($result);
    }*/
}