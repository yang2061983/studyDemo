package com.fintech.admin.modules.sys.service;


import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.sys.entity.SysLogEntity;
import com.fintech.common.utils.PageUtils;


/**
 * 系统日志
 * 
 */
public interface SysLogService extends IService<SysLogEntity> {

    PageUtils queryPage(Map<String, Object> params);

}
