package com.fintech.admin.modules.sys.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.sys.entity.SysUserEntity;
import com.fintech.common.utils.PageUtils;
import com.github.pagehelper.PageInfo;


/**
 * 系统用户
 *
 */
public interface SysUserService extends IService<SysUserEntity> {

    PageUtils queryPage(Map<String, Object> params);

    /**
     * 查询用户的所有菜单ID
     */
    List<Long> queryAllMenuId(Long userId);

    /**
     * 保存用户
     */
    void save(SysUserEntity user);

    /**
     * 修改用户
     */
    void update(SysUserEntity user);

    /**
     * 修改密码
     * @param userId       用户ID
     * @param password     原密码
     * @param newPassword  新密码
     */
    boolean updatePassword(Long userId, String password, String newPassword);


    /**
     * 查询所有管理员
     *
     * @param params 分页请求参数
     * @return PageInfo<SysUserEntity>
     */
    PageInfo<SysUserEntity> queryList(Map<String, Object> params);



}
