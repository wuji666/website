<?php

namespace app\common\controller;

use think\facade\Cache;
use think\Controller;
use think\Db;
use think\facade\Request;
use think\facade\View;

class IndexBase extends Controller
{
	// 当前路径
	protected $pathInfo;

	// 当前模块
	protected $module;

	// 当前控制器
	protected $controller;

	// 当前方法
	protected $action;

	public function __construct()
	{
		parent::__construct();
		$this->module = Request::module();
		$this->controller = strtolower(Request::controller());
		$this->action = Request::action();
		$this->pathInfo = $_SERVER["REQUEST_URI"] == '/' ? 'index/index/index' : $_SERVER["REQUEST_URI"];
		$this->view();
	}

	/**
	 * 模版赋值
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function view()
	{
		View::assign([
			'site_config' => $this->getSystem(),
			'nav'         => $this->getNav(),
			'slide'       => $this->getSlide(),
			'path_info'   => $this->pathInfo,
			'module'      => $this->module,
			'controller'  => $this->controller,
		]);
	}

	/**
	 * 获取站点信息
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function getSystem()
	{
		if (Cache::has('site_config')) {
			$site_config = Cache::get('site_config');
		} else {
			$site_config = Db::name('system')->field('value')->where('name', 'site_config')->find();
			$site_config = unserialize($site_config['value']);
			Cache::set('site_config', $site_config);
		}
		return $site_config;
	}

	/**
	 * 获取前端导航列表
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function getNav()
	{
		if (Cache::has('nav')) {
			$nav = Cache::get('nav');
		} else {
			$nav = Db::name('nav')->where(['status' => 1])->order(['sort' => 'ASC'])->select();
			$nav = !empty($nav) ? array2tree($nav) : [];
			if (!empty($nav)) {
				Cache::set('nav', $nav);
			}
		}
		return $nav;
	}

	/**
	 * 获取前端轮播图
	 * @throws \think\db\exception\DataNotFoundException
	 * @throws \think\db\exception\ModelNotFoundException
	 * @throws \think\exception\DbException
	 */
	public function getSlide()
	{
		if (Cache::has('slide')) {
			$slide = Cache::get('slide');
		} else {
			$slide = Db::name('slide')->where(['status' => 1, 'cid' => 1])->order(['sort' => 'DESC'])->select();
			if (!empty($slide)) {
				Cache::set('slide', $slide);
			}
		}
		return $slide;
	}

}
