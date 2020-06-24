<?php

class AuthM extends CI_Model{

	public function __construct()
	{
		parent::__construct();
		$this->load->database();
	}

	public function  checklogin($email,$password){

		#join query to get user data and user type

		$this->db->select('users.*,user_types.name as type_name');
		$this->db->from('users');
		$this->db->join('user_types','users.user_type=user_types.id');
		$this->db->where('email',$email);
		$this->db->where('password',$password);
		$q = $this->db->get();
		
		return $q->result();
	}
}
