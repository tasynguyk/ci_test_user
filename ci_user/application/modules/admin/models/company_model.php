<?php
 
class company_model extends CI_Model
{
     
    public function __construct()
    {
        parent::__construct();
    }
    
    public function get_lang()
    {
        return $this->session->userdata('lang');
    }
    
    public function get_company()
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
    
    public function check_name_company($name, $language)
    {
        $q = $this->db->query("select * from company_name where "
                . " language='$language' and name='$name' ");
        if($q->num_rows()>0)
        {
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }
    
    public function insert_company($name)
    {
        $this->db->query('insert into company values()');
        $id = $this->db->insert_id();
        
        $data = array(
            'company_id' => $id,
            'language' => $name['language'],
            'name' => $name['name']
        );
        
        $this->db->insert('company_name', $data);
    }
}
 
?>