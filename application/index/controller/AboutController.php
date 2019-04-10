<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Category;
use app\common\model\Slide;

class AboutController extends IndexBase
{
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * 首页
	 * @return \think\response\View
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function index()
	{
		return view('about/index', [
			'banner' => $this->banner(),
			'content' => $this->content(),
		]);
	}

	/**
	 * banner
	 * @return array|\PDOStatement|string|\think\Model|null
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function banner()
	{
		return Slide::where('cid', 4)->find();
	}

	/**
	 * 内容
	 * @return mixed
	 */
	public function content()
	{
		return Category::get(27);
	}
}