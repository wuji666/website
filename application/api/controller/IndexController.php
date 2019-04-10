<?php

namespace app\api\controller;

use app\common\controller\IndexBase;
use think\Db;
use org\HttpCurl;
use org\Spider;

class IndexController extends IndexBase {

    public function index() {
        return $this->result([], 1, '成功');
    }
}
