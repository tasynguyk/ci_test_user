    
      <?php 
        if($this->session->userdata('sortby'))
        {
            $sortby =  $this->lang->line($this->session->userdata('sortby'));
            if($sortby=='dob')
                $sortby =  $this->lang->line('birthday');
            echo '('.$this->lang->line('sort_by').' '.$sortby.')';
        }   
      ?><br />
  <form action="" method="post" id="list">
       <input type="hidden" name="groupchoose" id="groupchoose" />
      <input type="hidden" name="groupid" id="groupid" />
  <table class="table table-bordered table-striped">
      <tr>
        <th><?php echo $this->lang->line('groupname'); ?></th>
        <th><?php echo $this->lang->line('description'); ?></th>
        <th></th>
      </tr>
      <?php
        foreach ($list as $l)
        {
            ?> 
      <tr>
        <td><?php echo $l->name; ?></td>
        <td class="muted"><?php echo $l->description; ?></td>
        <td>
            <a href="<?php echo base_url().'index.php/acl/admin/member/'.$l->ID;?>" class="btn btn-primary btn-small"><?php echo $this->lang->line('manage_member'); ?></a>
            <a href="<?php echo base_url().'index.php/acl/admin/resource/'.$l->ID;?>" class="btn btn-primary btn-small"><?php echo $this->lang->line('manage_permission'); ?></a>
        </td>
      </tr>
        <?php
        
        }
        ?>         
  </table>
   </form>
  <?php echo $pagination; ?><br />
 