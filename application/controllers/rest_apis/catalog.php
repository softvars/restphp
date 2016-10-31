<?php
class Catalog extends MY_Controller {

    function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $data['id'] = $this->input->input_stream('id', TRUE);

		$data = $this->top->get();
        $res =  parent::_genRes(true, $data);
		parent::_setOutputWithDefaultHeaders($res);
    }

    public function add()
    {
    	$data = array();
    	$data['name'] = $this->input->input_stream('label', TRUE);

		$res = $this->top->add($data);

        //$res =  parent::_genRes($status);
		parent::_setOutputWithDefaultHeaders($res);
    }

    public function update()
    {
    	$data = json_decode($this->input->raw_input_stream);

		$result = $this->top->update($data);
        $res =  parent::_genRes(true, $result);
		parent::_setOutputWithDefaultHeaders($res);
    }

    public function delete()
    {
        $data = array();
        $data['id'] = $this->input->input_stream('id', TRUE);

        $result = $this->top->delete($data);
        $res =  parent::_genRes(true, $result);
        parent::_setOutputWithDefaultHeaders($res);

		//$status = $this->top->delete($data);
        //$res =  parent::_genRes($status, $data);

    }
    /*TODO: Method to get Full depth catalog */

    /*Todo: Update this method to provide sub catagories s*/
    public function lookup_by_id($cid = '')
    {
    	$this->load->model('product/prod_list');
		$result = $this->prod_list->get($cid);
        $res =  parent::_genRes(true, $result);
		parent::_setOutputWithDefaultHeaders($res);
    }
}
