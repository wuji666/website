<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Article;
use app\common\model\Slide;

class VideoController extends IndexBase
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
		$res = Article::where('cid', 6)
			->order([
				'sort' => 'asc',
				'create_time' => 'desc'
			])
			->paginate(1);
		return view('video/index', [
			'banner' => $this->banner(),
			'list'   => $res,
			'hot'   => (new QuestionController())->hotQuestion(16),
		]);
	}

	/**
	 * 详情
	 * @param null $id
	 * @return bool|\think\response\View
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function details($id = null)
	{
		if (empty($id)) return false;
		$res = Article::get($id);
		return view('video/details', [
			'video' => $res,
			'new'   => (new QuestionController())->newQuestion(5),
			'hot_1'   => (new QuestionController())->hotQuestion(16),
			'hot_2'   => (new QuestionController())->hotQuestion(5),
		]);
	}


	/**
	 * banner
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function banner()
	{
		return Slide::where('cid', 3)->select();
	}
}