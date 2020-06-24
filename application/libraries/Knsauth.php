<?php

class Knsauth{

	# Private Varible to use codeigniter instance
	private $ci;

	
	function __construct()
	{	
		$this->ci =& get_instance();
		//$this->__construct();
		# Loading Auth Model
		$this->ci->load->model('AuthM');
	}

	public function checklogin($email,$password,$remember=false){

		#Checking if recived parameters are empty or not

		if(!empty($email) && !empty($password)){
			
			#Calling checklogin function of Auth Model to check login
			$op = $this->ci->AuthM->checklogin($email,$password);
			
			#If Data is valid it will give the data in $op array

			if($op){
				# user Data store in Session variable to access further
				$_SESSION['User']=$op[0];
				return true;
			}else{
				#Setting session error variable to show error msg;
				$_SESSION['error'] = "Invalid Email or Password";
				#If data is not valid redirect back to Login Page
				redirect(base_url().'Auth','refresh');
			}
		}
	}

	public function loggedin(){
		#Checking if user session exists 
		if(isset($_SESSION['User'])){
			return true;
		}else{
			
			#Redirect to login Page
			redirect(base_url().'Auth','refresh');
		}
	}

	#This function will show the successmsg if any
	public function successmsg(){
		#if session success exists it will show alerity success with the value of session
		if(isset($_SESSION['success'])){
			$msg = "<script>alertify.success('".$_SESSION['success']."');</script>";
			#Unset session variable after showing alert
			unset($_SESSION['success']);
			return $msg;
		}
	}

	#This function will show error msg if any
	public function errormsg(){
		#If session variable error is set it will show error alert.
		if(isset($_SESSION['error'])){
			$msg =  "<script>alertify.error('".$_SESSION['error']."');</script>";
			#Unset session variable after showing alert
			unset($_SESSION['error']);
			return $msg;
		}
	}
}
