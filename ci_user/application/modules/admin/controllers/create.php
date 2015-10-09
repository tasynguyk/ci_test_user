<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Create extends MX_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -  
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in 
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see http://codeigniter.com/user_guide/general/urls.html
	 */
         public function __construct() {
            parent::__construct();
            $this->load->library('form_validation');
            $this->load->database();
            $this->load->helper(array('form', 'url'));
        }
         
	public function index()
	{
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log', 'location');
            }
            else
            {
                if($this->session->userdata('permission')<1)
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    $this->load->model('user_model');
                    
                    if($this->input->post('create'))
                    {
                        $this->form_validation->set_rules('username','Username','trim|required');
                        $this->form_validation->set_rules('password','Password','trim|required');
                        $this->form_validation->set_rules('repassword','Re-enter password','trim|required|matches[password]');
                        $this->form_validation->set_rules('email','Email','trim|required|valid_email');
                        if($this->form_validation->run()==FALSE)
                        {
                            $this->load->view('create_view');
                        }
                        else
                        {
                            $this->load->model('user_model');
                            $this->load->model('time_model');
                            $day = $this->input->post('day');
                            $month = $this->input->post('month');
                            $year = $this->input->post('year');
                            
                            if(!$this->time_model->check_time($day,$month,$year))
                            {
                                $data['error'] = 'Day of birth valid';
                                $this->load->view('create_view', $data);
                            }
                            else
                            {
                                
                                $username = $this->input->post('username');
                                $password = md5($this->input->post('password'));
                                $email = $this->input->post('email');
                                $gender = $this->input->post('gender');
                                $permission = $this->input->post('permisson');
                                $status = $this->input->post('status');
                                if(!$this->user_model->check_user($username, $email))
                                {
                                    $data['error'] = 'Username or email has been used';
                                    $this->load->view('create_view',$data);
                                }
                                else 
                                {
                                    $dob = $year.'-'.$month.'-'.$day;
                                    $create = array(
                                        'username' => $username,
                                        'password' => $password,
                                        'email' => $email,
                                        'gender' => $gender,
                                        'permission' => $permission,
                                        'status' => $status,
                                        'dob' => $dob
                                    );
                                    $this->user_model->add_user($create);
                                    $data['error'] = 'Complete.';
                                    $this->load->view('create_view',$data);
                                }
                            }
                        }
                        
                    }
                    else {
                        $this->load->view('create_view');
                    }
                    
                }
            }
	}
       
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
