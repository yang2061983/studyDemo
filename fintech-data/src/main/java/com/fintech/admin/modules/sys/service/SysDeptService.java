package com.fintech.admin.modules.sys.service;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.sys.entity.SysDeptEntity;

/**
 * 部门管理
 * 
 */
public interface SysDeptService extends IService<SysDeptEntity> {

	List<SysDeptEntity> queryList(Map<String, Object> map);

	/**
	 * 查询子部门ID列表
	 * @param parentId  上级部门ID
	 */
	List<Long> queryDetpIdList(Long parentId);

	/**
	 * 获取子部门ID，用于数据过滤
	 */
	List<Long> getSubDeptIdList(Long deptId);

	/**
	 * 如果不是超级管理员，新增管理员的时候，部门只能查询到自身的部门
	 *
	 * @return SysDeptEntity
	 */
	SysDeptEntity queryYourSelfDept(Map<String, Object> map);

}
