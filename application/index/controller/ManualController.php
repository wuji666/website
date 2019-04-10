<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Category;

class ManualController extends IndexBase
{
	public function __construct()
	{
		parent::__construct();
		$this->assign('left_menu', $this->leftMenu());
		$this->assign('id', $this->active());
	}

	/**
	 * 首页
	 * @return \think\response\View
	 */
	public function index($id = 10)
	{
		$res = Category::get($id);
		return view('manual/index', [
			'cate' => $res
		]);
	}

	/**
	 * 详情
	 * @return \think\response\View
	 */
	public function details()
	{
		return view('manual/details', [

		]);
	}

	/**
	 * 左边菜单
	 * @return array|bool
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function leftMenu()
	{
		$res = Category::where('pid', 7)
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->select()
			->toArray();
		$pid = Category::where('pid', 7)->column('id');
		$list = Category::where('pid', 'in', $pid)
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->select()
			->toArray();
		$list = array_merge($res, $list);
		foreach ($list as &$v) {
			if ($v['pid'] == 7) {
				$v['pid'] = 0;
			}
		}
		return array2tree($list);
	}

	public function active()
	{
		$url = $_SERVER['REQUEST_URI'];
		if ($url == '/index/manual/index.html') {
			$url = $url . '/id/10.html';
		}
		$id = str_split(explode('/', $url)[5], '2')[0];
		return $id;
	}
}