<?php
class MY_Controller extends CI_Controller {
	public function __construct() {
			parent::__construct();
	}

	protected function _setOutputWithDefaultHeaders($res) {
		$self = $this;
		$self->output
			->set_status_header(200)
			->set_content_type('json')
    		->set_output(json_encode($res));

    	$self->output->set_header('HTTP/1.0 200 OK');
		$self->output->set_header('HTTP/1.1 200 OK');
		//$this->output->set_header('Last-Modified: '.gmdate('D, d M Y H:i:s', $last_update).' GMT');
		$self->output->set_header('Cache-Control: no-store, no-cache, must-revalidate');
		$self->output->set_header('Cache-Control: post-check=0, pre-check=0');
		$self->output->set_header('Pragma: no-cache');
    	//->_display();
	}

    protected function _genRes($status, $data)
    {
        $result = array();
        $result['status'] = $status;
        $result['data'] = $data;
        return $result;
    }

    /*public function delete_all()
    {
    	$this->load->model('helper/dbcache');
		$this->dbcache->clear_all();
		$this->_setOutputWithDefaultHeaders();
    }

    public function delete($path1 = NULL, $path2 = NULL, $path3 = NULL, $path4 = NULL)
    {
    	$this->load->model('helper/dbcache');
		$this->dbcache->clear($path1, $path2, $path3, $path4);
		$this->_setOutputWithDefaultHeaders($path1, $path2, $path3, $path4);
    }*/
}