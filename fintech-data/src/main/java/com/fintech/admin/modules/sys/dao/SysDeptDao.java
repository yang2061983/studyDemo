package com.fintech.admin.modules.sys.dao;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fintech.admin.modules.sys.entity.SysDeptEntity;

/**
 * 部门管理
 * 
 */
public interface SysDeptDao extends BaseMapper<SysDeptEntity> {

    /**
     * 查询子部门ID列表
     * @param parentId  上级部门ID
     */
    List<Long> queryDetpIdList(Long parentId);


    /**
     * 如果不是超级管理员，新增管理员的时候，部门只能查询到自身的部门
     *
     * @return SysDeptEntity
     */
    SysDeptEntity queryYourSelfDept(Map<String, Object> map);

}
