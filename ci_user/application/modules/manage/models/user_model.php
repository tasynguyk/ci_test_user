<?php
 
class user_model extends CI_Model
{
     
    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_lang()
    {
        return $this->session->userdata('lang');
    }
            
    function get_list_user($id, $permisson, $page, $order)
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select * from user where id<>$id and permission<$permisson order by $order limit $page,3");
        $ret = $q->result();
        foreach ($ret as $l)
        {
            $n = $this->db->query("select * from company_name "
                    . " where company_id=$l->companyid and language='$lang'");  
            if($n->num_rows()>0)
            {
                $l->name = $n->row()->name;
            }
            else
            {
                $l->name = '('.$this->lang->line("unname_company").' '.$l->companyid.')';
            }
        }
        return $ret;
    }
    
    function get_listuser_nopage($id, $permisson, $order)
    {
        $q = $this->db->query("select user.id, user.username, user.email, user.dob, user.status, user.gender, user.permission, company.name "
                . "from user, company where user.id<>'$id' and "
                . "permission<$permisson and user.companyid=company.id order by $order");
        return $q->result();
    }
    
    
    function search_user_nopage($id, $permisson,  $order, $search)
    {
        $q = $this->db->query("select user.id, user.username, user.email, user.dob, user.status, user.gender, user.permission, company.name "
                . "from user, company where user.id<>'$id' and username like '%$search%' and "
                . "permission<$permisson and user.companyid=company.id order by $order");
        return $q->result();
    }
    
    function search_user($id, $permisson, $page, $order, $search)
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select * from user where id<>$id and permission<$permisson "
                . " and username like '%$search%' "
                . " order by $order limit $page,3");
        $ret = $q->result();
        foreach ($ret as $l)
        {
            $n = $this->db->query("select * from company_name "
                    . " where company_id=$l->companyid and language='$lang'");  
            if($n->num_rows()>0)
            {
                $l->name = $n->row()->name;
            }
            else
            {
                $l->name = '('.$this->lang->line("unname_company").' '.$l->companyid.')';
            }
        }
        return $ret;
    }
    
    function search_numrow_user($id, $permisson, $search)
    {
        $q = $this->db->query("select * from user where id<>'$id' and "
                . "permission<$permisson and username like '%$search%'");
        
        return $q->num_rows();
    }
    
    function  get_user_byid($id)
    {
        $q = $this->db->query("select * from user where id='$id'");
        return $q->row();
    }
            
    function  get_numrows_user($id, $permisson)
    {
        $q = $this->db->query("select * from user where id<>'$id' and "
                . "permission<$permisson");
        return $q->num_rows();
    }
    
    function  delete_user($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('user'); 
    }

    function check_user_edit($id, $username, $email)
    {
        $q1 = $this->db->query("select * from user where username='$username' and id <>'$id'");
        $q2 = $this->db->query("select * from user where email='$email' and id <>'$id'");
        if($q1->num_rows()+$q2->num_rows()>0)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    
    
    function edit_user_byid($data, $id)
    {
        $this->db->where('id',$id);
        $this->db->update('user',$data);
    }
}
 
?>