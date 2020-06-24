<?php

class AuthM extends CI_Model{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function  checklogin($email,$password){
		$this->db->where('email',$email);
		$this->db->where('password',$password);
		$q = $this->db->get('users');
		//$q = $this->db->query("select * from users where email='".$email."'");
		return $q->result();
	}
}
