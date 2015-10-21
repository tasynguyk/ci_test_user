<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Language extends MX_Controller {

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
            $this->load->library(array('form_validation','Acl'));
            $this->load->database();
            $this->load->helper(array('form', 'url'));
            if($this->session->userdata('lang'))
            {
                $lang_use = $this->session->userdata('lang');
                $this->lang->load('form',$lang_use);
                $this->lang->load('form_validation',$lang_use);
            }
            else
            {
                $this->lang->load('form','english');
            }
        }
         
	public function index($page = 1)
	{
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log','location');
            }
            else
            {
                $id = $this->session->userdata('id');
                $resource = 4;
                if(!$this->acl->can_view($id, $resource))
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    $curpage = $page;
                    $page = (($page-1)*3);
                    $this->load->library('my_page');
                    $this->load->model('language_model');
                    if($this->input->post('btncancel'))
                    {
                        $this->session->unset_userdata('language_search');
                    }
                    if($this->input->post('btnsearch') and $this->input->post('txtsearch')!='')
                    {
                        $search = $this->input->post('txtsearch');
                        $this->session->set_userdata('language_search', $search);
                        $list = $this->language_model->search_show_language($page, $search);
                        $num_rows = $this->language_model->search_num_language($search);
                    }
                    else
                    {
                        if($this->session->userdata('language_search'))
                        {
                            $search = $this->session->userdata('language_search');
                            $list = $this->language_model->search_show_language($page, $search);
                            $num_rows = $this->language_model->search_num_language($search);
                        }
                        else
                        {
                            $list = $this->language_model->get_show_language($page);
                            $num_rows = $this->language_model->get_num_language();
                        }
                    }
                    
                    $z['total_row'] = $num_rows;
                    $z['item_per_page'] = 3;
                    $z['curpage'] = $curpage;
                    $z['url'] = base_url().'index.php/language/language/index';
                    
                    $data['pagination'] = $this->my_page->create_page($z);
                    $data['list'] = $list;
                    $data['page_title'] = 'Sutrix media | '.$this->lang->line('manage_language');
                    $data['page_sub_title'] = $this->lang->line('manage_language');
                    $data['page_content'] = $this->load->view('list_language_view',$data,true);
                    $this->load->view('master_layout',$data);
                }
            }
	}



        public function create()
        {
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log','location');
            }
            else
            {
                $id = $this->session->userdata('id');
                $resource = 4;
                if(!$this->acl->can_create($id, $resource))
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    
                    $this->load->model('language_model');
                    if($this->input->post('cancel'))
                    {
                        redirect(base_url().'index.php/language/language','location');
                    }
                    if($this->input->post('create'))
                    {
                        $this->form_validation->set_rules('name',$this->lang->line('language_name'),'trim|required');
                        $this->form_validation->set_rules('code',$this->lang->line('language_code'),'trim|required');
                        if($this->form_validation->run()!=FALSE)
                        {
                            $name = $this->input->post('name');
                            $code = $this->input->post('code');
                            
                            $add = array(
                              'name' => $name,
                              'code' => $code
                            );
                            
                            
                            if(!$this->language_model->check_language($name, $code))
                            {
                                $data['error'] = $this->lang->line('language_code_use');
                            }
                            else
                            {
                                $this->language_model->create_language($add);
                                $data['error'] = $this->lang->line('compele');
                            }
                            
                        }
                    }
                    $data['page_title'] = 'Sutrix media | '.$this->lang->line('create_language');
                    $data['page_sub_title'] = $this->lang->line('create_language');
                    $data['page_content'] = $this->load->view('create_view',$data,true);
                    $this->load->view('master_layout',$data);
                }
            }
        }
        
        public function edit($langid=-1)
        {
            if(!$this->session->userdata('islogin'))
            {
                redirect(base_url().'index.php/login/log','location');
            }
            else
            {
                $id = $this->session->userdata('id');
                $resource = 4;
                if(!$this->acl->can_delete($id, $resource) && !$this->acl->can_edit($id, $resource))
                {
                    redirect(base_url().'index.php/login/log/profile', 'location');
                }
                else
                {
                    $this->load->model('language_model');
                    if($this->language_model->check_language_byid($langid))
                    {
                        
                        if($this->input->post('cancel'))
                        {
                            redirect(base_url().'index.php/language/language','location');
                        }
                        if($this->input->post('delete'))
                        {
                            // delete news............
                            $this->language_model->delete_language($langid);
                            redirect(base_url().'index.php/language/language','location');
                        }
                        if($this->input->post('edit'))
                        {
                            $this->form_validation->set_rules('name',$this->lang->line('language_name'),'trim|required');
                            $this->form_validation->set_rules('code',$this->lang->line('language_code'),'trim|required');
                            if($this->form_validation->run()!=FALSE)
                            {
                                $name = $this->input->post('name');
                                $code = $this->input->post('code');
                                
                                $add = array(
                                  'name' => $name,
                                  'code' => $code
                                );

                                
                                if(!$this->language_model->check_edit_language($code, $name ,$langid))
                                {
                                    $data['error'] = $this->lang->line('language_code_use');
                                }
                                else
                                {
                                    $this->language_model->update_language($add, $langid);
                                    $data['error'] = $this->lang->line('compele');
                                }

                            }
                        }
                        $lang = $this->language_model->get_language_byid($langid);
                        $data['lang'] = $lang;
                        $data['page_title'] = 'Sutrix media | '.$this->lang->line('edit_language');
                        $data['page_sub_title'] = $this->lang->line('edit_language');
                        $data['page_content'] = $this->load->view('edit_view',$data,true);
                        $this->load->view('master_layout',$data);
                    }
                    else
                    {
                        redirect(base_url().'index.php/language/language','location');
                    }
                }
            }
        }
       
}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */
