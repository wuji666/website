<?php

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\model\Product;

class ProductController extends AdminBase
{
	protected $product;

	public function initialize()
	{
		parent::initialize();
		$this->product = new Product();
	}

	/**
	 * 产品列表
	 * @param string $keyword 关键词
	 * @param int $page
	 * @return mixed
	 */
	public function index($keyword = '', $page = 1)
	{
		$map = [];
		$field = 'id,name,description,cate_id,status,sort,create_time,update_time';

		if (!empty($keyword)) {
			$map['name'] = ['like', "%{$keyword}%"];
		}
		$product_list = $this->product->field($field)->where($map)->order(['create_time' => 'DESC'])->paginate(15, false, ['page' => $page]);

		return $this->fetch('index', ['product_list' => $product_list, 'keyword' => $keyword]);
	}

	/**
	 * 添加产品
	 * @return mixed
	 */
	public function add()
	{
		return $this->fetch();
	}

	/**
	 * 保存产品
	 */
	public function save()
	{
		if ($this->request->isPost()) {
			$data = $this->request->param();
			$data['create_time'] = time();
			$data['update_time'] = time();
			if ($this->product->allowField(true)->save($data)) {
				$this->success('保存成功');
			} else {
				$this->error('保存失败');
			}
		}
	}

	/**
	 * 编辑文章
	 * @param $id
	 * @return mixed
	 */
	public function edit($id)
	{
		$list = $this->product->find($id);

		return $this->fetch('edit', ['list' => $list]);
	}

	/**
	 * 更新文章
	 * @param $id
	 */
	public function update($id)
	{
		if ($this->request->isPost()) {
			$data = $this->request->param();
			$data['update_time'] = time();
			if ($this->product->allowField(true)->save($data, $id) !== false) {
				$this->success('更新成功');
			} else {
				$this->error('更新失败');
			}
		}
	}

	/**
	 * 删除文章
	 * @param int $id
	 * @param array $ids
	 */
	public function delete($id = 0, $ids = [])
	{
		$id = $ids ? $ids : $id;
		if ($id) {
			if ($this->product->destroy($id)) {
				$this->success('删除成功');
			} else {
				$this->error('删除失败');
			}
		} else {
			$this->error('请选择需要删除的产品');
		}
	}

	/**
	 * 文章审核状态切换
	 * @param array $ids
	 * @param string $type 操作类型
	 */
	public function toggle($ids = [], $type = '')
	{
		$data = [];
		$status = $type == 'audit' ? 1 : 0;

		if (!empty($ids)) {
			foreach ($ids as $value) {
				$data[] = ['id' => $value, 'status' => $status];
			}
			if ($this->product->saveAll($data)) {
				$this->success('操作成功');
			} else {
				$this->error('操作失败');
			}
		} else {
			$this->error('请选择需要操作的产品');
		}
	}
}