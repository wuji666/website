<?php

namespace app\common\controller;

use org\Auth;
use think\Controller;
use think\Db;
use think\facade\Session;
use think\Loader;

/**
 * 后台公用基础控制器
 * Class AdminBase
 * @package app\common\controller
 */
class AdminBase extends Controller
{

	public function initialize()
	{
		parent::initialize();
		$this->checkAuth();
		$this->getMenu();
		// 输出当前请求控制器（配合后台侧边菜单选中状态）
		$this->assign('controller', Loader::parseName($this->request->controller()));
	}

	/**
	 * 权限检查
	 * @return bool
	 */
	public function checkAuth()
	{

		if (!Session::has('admin_id')) {
			$this->redirect('admin/login/index');
		}
		$module = $this->request->module();
		$controller = strtolower($this->request->controller());
		$action = $this->request->action();

		// 排除权限
		$not_check = [
			'admin/index/index',
			'admin/authgroup/getjson',
			'admin/system/clear',
		];

		if (!in_array($module . '/' . $controller . '/' . $action, $not_check)) {
			$auth = new Auth();
			$admin_id = Session::get('admin_id');
			if (!$auth->check($module . '/' . $controller . '/' . $action, $admin_id) && $admin_id != 1) {
				$this->error('没有权限');
			}
		}
	}

	/**
	 * 获取侧边栏菜单
	 */
	public function getMenu()
	{
		$menu = [];
		$admin_id = Session::get('admin_id');
		$auth = new Auth();

		$auth_rule_list = Db::name('auth_rule')->where('status', 1)->order(['sort' => 'DESC', 'id' => 'ASC'])->select();

		foreach ($auth_rule_list as $value) {
			if ($auth->check($value['name'], $admin_id) || $admin_id == 1) {
				$menu[] = $value;
			}
		}
		$menu = !empty($menu) ? array2tree($menu) : [];
		$this->assign('menu', $menu);
	}

}
