<?php
 
class user_model extends CI_Model
{
     
    public function __construct()
    {
        parent::__construct();
    }
    
    function check_user($username, $password)
    {
        $q = $this->db->query("select * from user where "
                . "username = '$username' and password='$password'");
        if($q->num_rows()>0)
        {
            return TRUE;
        }
        else
        {
           return FALSE;
        }
    }
    
    public function get_user($username)
    {
        $q = $this->db->query("select * from user where "
                . "username = '$username'");
        return $q->row();
    }
    
    public function get_group($id)
    {
        $q = $this->db->query("select gr.name as 'name' from user us, user_group ug, `group`gr "
                . "where us.id = ug.ID and ug.groupid = gr.ID and us.id=$id");
        if($q->num_rows()!=0)
        {
            return $q->row()->name;
        }
        else
        {
            return $this->lang->line('free_user');
        }
    }
}
 
?>