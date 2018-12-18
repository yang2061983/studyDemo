package com.fintech.admin.modules.sys.dao;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.fintech.admin.modules.sys.entity.SysDictEntity;

import java.util.List;
import java.util.Map;

/**
 * 数据字典
 *
 */
public interface SysDictDao extends BaseMapper<SysDictEntity> {

    List<SysDictEntity> findAllList(Map<String, Object> params);


    List<SysDictEntity> findListByType(String type);
	
}
