package com.fintech.admin.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fintech.admin.modules.sys.entity.SysUserEntity;

/**
 * 系统用户
 * 
 */
public interface SysUserDao extends BaseMapper<SysUserEntity> {
	
	/**
	 * 查询用户的所有权限
	 * @param userId  用户ID
	 */
	List<String> queryAllPerms(Long userId);
	
	/**
	 * 查询用户的所有菜单ID
	 */
	List<Long> queryAllMenuId(Long userId);


	/**
	 * 管理员管理分页查询
	 *
	 * @param params params
	 * @return List<SysUserEntity>
	 */
	List<SysUserEntity> queryList(Map<String, Object> params);
}
