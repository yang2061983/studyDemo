package com.fintech.admin.modules.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fintech.admin.modules.sys.entity.SysRoleEntity;

import java.util.List;
import java.util.Map;

/**
 * 角色管理
 * 
 */
public interface SysRoleDao extends BaseMapper<SysRoleEntity> {

    /**
     * 根据部门id查询角色列表
     *
     * @param map 部门id
     * @return List<SysRoleEntity>
     */
    List<SysRoleEntity> queryRolesByDeptId(Map<String, Object> map);


    /**
     * 查询部门所有角色
     *
     * @param map 部门id
     * @return List<SysRoleEntity>
     */
    List<SysRoleEntity> queryList(Map<String, Object> map);
	

}
