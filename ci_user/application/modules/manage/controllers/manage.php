<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Manage extends MX_Controller {

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
                if($this->session->userdata('permission')!=1)
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    $id = $this->session->userdata('id');
                    $q = $this->db->query('select * from user where id<>'.$id);
                    $data['list'] = $q->result();
                    $this->load->view('list_view',$data);
                    
                }
            }
	}
        
        public function deleteoredit()
        {
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log', 'location');
            }
            else
            {
                if($this->session->userdata('permission')!=1)
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    if($this->input->post('userid'))
                    {
                        $choose = $this->input->post('choose');
                        $id = $this->input->post('userid');
                        if($choose == 'delete')
                        {
                            $this->db->where('id', $id);
                            $this->db->delete('user'); 
                            redirect(base_url().'index.php/manage/manage/manage', 'location');
                            
                        }
                        else {
                            //$q = $this->db->query("select * from user where id='$id'");
                            //$data['user'] = $q->row();
                            $this->session->set_userdata('idedit', $id);
                            redirect(base_url().'index.php/manage/manage/edit', 'location');
                        }
                    }
                    else {
                        redirect(base_url().'index.php/manage/manage/manage', 'location');
                    }
                    
                }
            }
        }
        
        public function edit()
        {
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log', 'location');
            }
            else
            {
                if($this->session->userdata('permission')!=1)
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    if($this->session->userdata('idedit'))
                    {
                        $id = $this->session->userdata('idedit');
                        $q = $this->db->query("select * from user where id='$id'");
                        $user = $q->row();
                        $data['user'] = $user;
                        if($this->input->post('edit'))
                        {
                            $this->form_validation->set_rules('username','Username','trim|required');
                            $this->form_validation->set_rules('password','Password','trim|required');
                            $this->form_validation->set_rules('repassword','Re-enter password','trim|required|matches[password]');
                            $this->form_validation->set_rules('email','Email','trim|required|valid_email');
                            if($this->form_validation->run()==FALSE)
                            {
                                $this->load->view('edit_view',$data);
                            }
                            else
                            {
                                $username = $this->input->post('username');
                                $email = $this->input->post('email');
                                $password = md5($this->input->post('password'));
                                $q1 = $this->db->query("select * from user where username='$username' and id <>'$id'");
                                $q2 = $this->db->query("select * from user where email='$email' and id <>'$id'");
                               // echo $q1->num_row()
                                if($q1->num_rows()+$q2->num_rows()>0)
                                {
                                    $data['error'] = 'Username or email has been used';
                                    $this->load->view('edit_view',$data);
                                }
                                else
                                {
                                    $update = array(
                                    'username' => $username,
                                    'password' => $password,
                                    'email' => $email
                                    );
                                    $this->db->where('id',$id);
                                    $this->db->update('user',$update);
                                    redirect(base_url().'index.php/manage/manage/manage', 'location');
                                }
                                
                            }
                        }
                        else {
                            if($this->input->post('cancel'))
                            {
                                $this->session->unset_userdata('idedit');
                                redirect(base_url().'index.php/manage/manage/manage', 'location');
                            }
                            else
                            {
                                $this->load->view('edit_view',$data);
                                
                            }
                        }
                    }
                    else
                    {
                        redirect(base_url().'index.php/manage/manage/manage', 'location');
                    }
                }
            }
        }
       
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
