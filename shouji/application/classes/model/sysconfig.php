<?php defined('SYSPATH') or die('No direct access allowed.');

class Model_Sysconfig extends ORM {

    protected  $_table_name = 'sysconfig';

    /*
     * 根据webid获取所有配置信息
     * */
    public function getConfig($webid)
    {
        $arr = $this->where('webid','=',$webid)->get_all();
        $out = array();
        foreach($arr as $row)
        {
           $out[$row['varname']] = $row['value'];
        }
        return $out;
    }
    /*
     * 根据webid保存配置信息
     * */
    public function saveConfig($arr)
    {

        $webid = ARR::get($arr,'webid');

        foreach($arr as $k=>$v)
        {

              if($k!=='webid')
              {
                  $row = $this->where('webid','=',$webid)->and_where('varname','=',$k)->find();

                  if(isset($row->id)) //如果存在则修改,如果不存在则创建
                  {
                      $v = $k=='cfg_tongjicode' ? addslashes($v) : $v;
                      $row->value = $v;
                      $row->update();
                  }
                  else
                  {
                      $row->varname = $k;
                      $row->value = $v;
                      $row->webid = $webid;
                      $row->create();
                  }

                  $row->clear();
              }

        }
        $this->writeConfig($webid);
        return true;
    }

    /*
     * 写配置文件
     *
     * */
    public function writeConfig($webid)
    {
        $configfile = $this->getConfigFilePath($webid);
        $fp = fopen($configfile,'wb');
        flock($fp,3);
        fwrite($fp,"<"."?php\r\n");
        $arr = ORM::factory('sysconfig')->where('webid','=',$webid)->get_all();
        foreach($arr as $row)
        {

            if($row['varname']=='cfg_tongjicode')
            {
                fwrite($fp,"\${$row['varname']} = '".addslashes($row['value'])."';\r\n");
            }
            else
            {
                fwrite($fp,"\${$row['varname']} = '".str_replace("'",'',$row['value'])."';\r\n");
            }

        }
        fwrite($fp,"?".">");
        fclose($fp);

    }
    /*
     * 获取配置文件信息
     *
     * */
    private function getConfigFilePath($webid)
    {
       if($webid==0)
       {
           $file=SLINEDATA.'/config.cache.inc.php';
       }
       else
       {
           $webinfo = Common::getWebInfo($webid);
           $file =DOCROOT.'../sline/data/config/config.cache.inc'.$webinfo['webprefix'].'.php';
       }
       return $file;
    }

}