<?php
/*
* Ixian Mining Pool
* Website: www.ixian.io 
* Github:  https://github.com/ProjectIxian/Ixian-Pool
*/

class Template {
    protected $template_dir = 'tpl/';
    protected $vars = array();
    public function __construct($template_dir = null) {
        if($template_dir !== null) {
            $this->template_dir = $template_dir;
        }
    }
    
    public function render($file) {
        if(file_exists($this->template_dir.$file)) {
            include $this->template_dir.$file;
        } else {
            echo "Error fetching page";
            exit;
        }
    }
    
    public function __set($name, $value) {
        $this->vars[$name] = $value;
    }
    
    public function __get($name) {
        return $this->vars[$name];
    }
}


?>