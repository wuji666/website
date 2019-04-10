<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Article;
use app\common\model\Slide;

class ContactController extends IndexBase
{
	public function __construct()
	{
		parent::__construct();
	}

	/**
	 * 首页
	 * @return \think\response\View
	 */
	public function index()
	{
		return view('contact/index', [
			'banner'   => $this->banner(),
			'question' => $this->question()
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
		return Slide::where('cid', 5)->find();
	}

	/**
	 * 常见问题
	 * @param int $limit
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function question($limit = 8)
	{
		return Article::where([
				'cid'          => 1,
				'is_recommend' => 1
			])
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->select();
	}
}