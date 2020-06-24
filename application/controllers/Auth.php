<?php

class Auth extends CI_Controller{

	//private $Kns_auth;

	public function __construct()
	{
		parent::__construct();
		$this->load->library('knsauth');
	}

	public function index(){
		
		$data['title'] = "Login";
		$this->load->library('knsauth');
		$this->load->view('Auth/login',$data);

	}

	public function checklogin(){

		#Get Input Data
		$data = $this->input->post();

		#Call the checklogin function of knsauth library
		$this->knsauth->checklogin($data['email'],$data['pass']);
		
		#Redirect to Home Page if login is correct
		redirect(base_url(),'refresh');
	}

}
