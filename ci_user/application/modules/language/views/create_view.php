<form class="form-horizontal well" method="post" action="">
        <?php
            echo validation_errors();
            if(isset($error))
            {
              echo '<br />'.$error;
            }
        ?>
        <div class="control-group">
        <label class="control-label"><?php echo $this->lang->line('language_code'); ?></label>
        <div class="controls">
            <input class="span3" name="code" type="text" value="" placeholder="<?php echo $this->lang->line('language_code'); ?>">
        </div>
        </div>
        <div class="control-group">
        <label class="control-label"><?php echo $this->lang->line('language_name'); ?></label>
        <div class="controls">
            <input class="span3" name="name" type="text" placeholder="<?php echo $this->lang->line('language_name'); ?>">
        </div>
      </div>
        
      <div class="form-actions">
        <input type="submit" class="btn btn-primary" name="create" value="<?php echo $this->lang->line('create'); ?>" />
        <input type="submit" class="btn" name="cancel" value="<?php echo $this->lang->line('cancel'); ?>" />
      </div>
 </form>

