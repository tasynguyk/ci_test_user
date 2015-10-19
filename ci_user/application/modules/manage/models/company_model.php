<?php
 
class Company_model extends CI_Model
{
     
    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_lang()
    {
        return $this->session->userdata('lang');
    }
    
    public function get_company($page)
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select * from company order by id limit $page,3");
        $ret = array();
        foreach ($q->result() as $l)
        {
            $p = new stdClass();
            $p->id = $l->id;
            $n = $this->db->query("select * from company_name "
                    . " where company_id=$p->id and language='$lang'");
            if($n->num_rows()>0)
            {
                $p->name = $n->row()->name;
            }
            else
            {
                $p->name = '('.$this->lang->line("unname_company").' '.$p->id.')';
            }
            array_push($ret, $p);
        }
        return $ret;
    }
    
    public function get_num_company()
    {
        $q = $this->db->query("select * from company");
        return $q->num_rows();
    }
    
    public function search_company($page, $search)
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select c.id as 'id', n.name as 'name'"
                . " from company c, company_name n where "
                . "c.id=n.company_id and n.language='$lang' and n.name like '%$search%' "
                . " order by n.name limit $page, 3");
        return $q->result();
    }
    
    public function search_numrows_company($search)
    {
        $lang = $this->get_lang();
        
        $q = $this->db->query("select c.id as 'id', n.name as 'name'"
                . " from company c, company_name n where "
                . "c.id=n.company_id and n.language='$lang' and n.name like '%$search%'");
        
        return $q->num_rows();
    }
    
    public function get_company_list()
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select * from company");
        $ret = array();
        foreach ($q->result() as $l)
        {
            $p = new stdClass();
            $p->id = $l->id;
            $n = $this->db->query("select * from company_name "
                    . " where company_id=$p->id and language='$lang'");
            if($n->num_rows()>0)
            {
                $p->name = $n->row()->name;
            }
            else
            {
                $p->name = '('.$this->lang->line("unname_company").' '.$p->id.')';
            }
            array_push($ret, $p);
        }
        return $ret;
    }
    
    public function get_company_byid($id)
    {
        $q = $this->db->query("select * from company where id = '$id'");
        $lang = $this->get_lang();
        $ret = new stdClass();
        $ret->id = $id;
        $name = $this->db->query("select * from company_name "
                    . " where company_id=$id and language='$lang'");
        if($name->num_rows()>0)
        {
            $ret->name = $name->row()->name;
        }
        else
        {
            $ret->name = '';
        }
        return $ret;
    }
    
    public function check_company($name, $id)
    {
        $lang = $this->get_lang();
        $q = $this->db->query("select * from company_name where "
                . " name='$name' and company_id <> $id and language='$lang'")->num_rows();
        
        
        if($q>0)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    
    public function update_company($id, $name)
    {
        $info = array('name'=>$name);
        $lang = $this->get_lang();
        $q = $this->db->query("select * from company_name where company_id=$id and language = '$lang'");
        if($q->num_rows()>0)
        {
            $this->db->where('company_id', $id);
            $this->db->where('language',$lang);
            $this->db->update('company_name', $info);
        }
        else
        {
            $add = array (
                'name' => $name,
                'language' => $lang,
                'company_id' => $id
            );
            $this->db->insert('company_name',$add);
        }
    }
    
    public function check_delete_company($id)
    {
        $q = $this->db->query("select * from user where companyid = $id");
        if($q->num_rows()>0)
        {
            return FALSE;
        }
        else
        {
            return true;
        }
    }
    
    public function  delete_company($id)
    {
        $this->db->where('company_id',$id);
        $this->db->delete('company_name');
        
        $this->db->where('id', $id);
        $this->db->delete('company');
    }
}
 
?>