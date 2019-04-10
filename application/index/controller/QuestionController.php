<?php

namespace app\index\controller;

use app\common\controller\IndexBase;
use app\common\model\Article;
use app\common\model\Category;
use app\common\model\Slide;
use think\facade\View;

class QuestionController extends IndexBase
{
	// 文章分类id 问题类
	public $cid = null;

	public function __construct()
	{
		parent::__construct();
		$this->cid = Category::where('pid', 1)->column('id');
	}

	/**
	 * 首页
	 * @return \think\response\View
	 */
	public function index($id = null)
	{
		$title = input('get.title', '');
		$res = Article::where([
			['cid', 'in', $this->cid],
			['status', '=', 1]
		])
			->where(function ($query) use ($title, $id) {
				if (!empty($title)) {
					$query->where('title', 'like', '%' . $title . '%');
				}
				if (!empty($id)) {
					$query->where('cid', $id);
				}
			})
			->order(['sort' => 'asc', 'create_time' => 'desc'])
			->paginate(20);
		View::assign([
			'banner'       => $this->banner(),
			'question_nav' => $this->questionNav(),
			'hot_question' => $this->hotQuestion(),
		]);
		return view('question/index', [
			'list' => $res,
		]);
	}

	/**
	 * 问题详情
	 * @param null $id
	 */
	public function details($id = null)
	{
		if (empty($id)) return false;
		$res = Article::get($id);
		return view('question/details', [
			'banner'       => $this->banner(),
			'question_nav' => $this->questionNav(),
			'details'      => $res,
			'prev'         => $this->prev($id, $res['cid']),
			'next'         => $this->next($id, $res['cid']),
			'hot'          => $this->hotQuestion(5),
			'new'          => $this->newQuestion(5)
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
		return Slide::where('cid', 2)->select();
	}

	/**
	 * 子导航
	 * @return array|\PDOStatement|string|\think\Collection|null
	 */
	public function questionNav()
	{
		return Category::where('pid', 1)->select();
	}

	/**
	 * 热门问题
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function hotQuestion($limit = 10)
	{
		return Article::where([
			['cid', 'in', $this->cid],
			['is_hot', '=', 1]
		])
			->order([
				'sort'        => 'asc',
				'create_time' => 'desc'
			])
			->limit($limit)
			->select();
	}

	/**
	 * 最新问题
	 * @param int $limit
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function newQuestion($limit = 10)
	{
		return Article::where('cid', 'in', $this->cid)
			->order(['create_time' => 'desc'])
			->limit($limit)
			->select();
	}

	/**
	 * 上一篇
	 * @param null $id
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function prev($id = null, $cid = null)
	{
		return Article::where('id', '<', $id)->where('cid', $cid)->find();
	}

	/**
	 * 下一篇
	 * @param null $id
	 * @return array|\PDOStatement|string|\think\Collection
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function next($id = null, $cid = null)
	{
		return Article::where('id', '>', $id)->where('cid', $cid)->find();
	}
}