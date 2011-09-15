<?php
/*
Copyright (c) 2011  <Matthieu Zimmer>

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE 
SOFTWARE.
*/
?>
<?php
/**
 * @author Matthieu637
 *
 */
class Cache
{
	/**
	 * @var string
	 */
	private $content;
	/**
	 * @var string
	 */
	private $name_file;
	/**
	 * @var int
	 */
	private $time;
	
	
	/**
	 * @param unknown_type $name_file
	 * @param unknown_type $time
	 * @return unknown_type
	 */
	public function __construct($name_file,$time = 60)
	{
		assert('isset($name_file)');
		
		$this->name_file=$name_file;
		$this->time=$time*60;
	}
	
	/**
	 * @param string $name_file
	 * @param int $time (minutes)
	 * @return void
	 */
	public function open()
	{
		if(file_exists(CACHE_FOLDER.$this->name_file) && ( time() - filemtime(CACHE_FOLDER.$this->name_file) > $this->time ) )
		{
			$this->content=file_get_contents(CACHE_FOLDER.$this->name_file);
			return false;
		}
		else
		{
			ob_start();
			return true;
		}
	}
	
	
	/**
	 * @return void
	 */
	public function close()
	{
		if(!isset($this->content))
		{
			$this->content=ob_get_contents();
			ob_end_clean();
			
			$file = fopen(CACHE_FOLDER.$this->name_file, 'w+');
			fwrite($file, $this->content);
			fclose($file);
		}
		
		return $this->content;
	}
	
	public static function clear_cache()
	{
		$dir = opendir(CACHE_FOLDER);
		
		while ($f = readdir($dir))
			if(is_file(CACHE_FOLDER.$f) && strpos($f,'.cache'))
				unlink(CACHE_FOLDER.$f);

		closedir($dir);
	}
}
/*
 * Example :
 * 
 * $cache = new Cache('test.cache',60);
 * $cache->open();
 * 
 * some functions;
 * 
 * $cache->close();
 * 
 */
?>