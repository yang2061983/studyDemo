package com.fintech.admin.modules.sys.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.sys.entity.SysDictEntity;
import com.fintech.common.utils.PageUtils;
import com.github.pagehelper.PageInfo;

/**
 * 数据字典
 *
 */
public interface SysDictService extends IService<SysDictEntity> {

    PageUtils queryPage(Map<String, Object> params);


    List<SysDictEntity> findListByType(String type);


    PageInfo<SysDictEntity> findAllList(Map<String, Object> params);
}

