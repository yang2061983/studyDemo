package com.fintech.admin.modules.sys.service;


import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.sys.entity.SysRoleEntity;
import com.fintech.common.utils.PageUtils;
import com.github.pagehelper.PageInfo;


/**
 * 角色
 *
 */
public interface SysRoleService extends IService<SysRoleEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void save(SysRoleEntity role);

    void update(SysRoleEntity role);

    void deleteBatch(Long[] roleIds);

    /**
     * 根据部门id查询角色列表
     *
     * @param map 部门id
     * @return List<SysRoleEntity>
     */
    List<SysRoleEntity> queryRolesByDeptId(Map<String, Object> map);


    /**
     * 查询所有角色
     *
     * @param params 请求参数
     * @return PageInfo<SysRoleEntity>
     */
    PageInfo<SysRoleEntity> queryList(Map<String, Object> params);



}
