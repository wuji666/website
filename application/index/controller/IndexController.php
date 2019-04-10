<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Article;
use app\common\model\Category;
use app\common\model\Nav;
use app\common\model\Product;
use think\facade\View;

class IndexController extends IndexBase
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
		View::assign([
			'product_list' => $this->productList(),
			'question'     => $this->question(),
			'video'        => $this->video(),
			'manual'       => $this->manual(),
		]);
		return view();
	}

	/**
	 * 产品列表
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function productList()
	{
		return Product::where(['status' => 1])
			->order('sort asc, create_time desc')
			->limit(0, 15)
			->select();
	}

	/**
	 * 常见问题列表
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function question()
	{
		$cid = (new QuestionController())->cid;
		$question = Article::where('cid', 'in', $cid)
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->limit(5)
			->select();
		$ques_cate = Category::get(1);
		$ques_cate['children'] = $question;
		return $ques_cate;
	}

	/**
	 * 视频列表
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function video()
	{
		$video_cate = Category::get(6);
		$video = Article::where('cid', 6)
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->limit(5)
			->select();
		$video_cate['children'] = $video;
		return $video_cate;
	}

	/**
	 * 手册列表
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function manual()
	{
		$manual_cate = Category::get(7);
		$manual = Category::where([
			'pid' => 7,
			'type' => 2
		])
		->order(['sort' => 'asc', 'create_time' => 'desc'])
		->limit(5)
		->select();
		$manual_cate['children'] = $manual;
		return $manual_cate;
	}
}
