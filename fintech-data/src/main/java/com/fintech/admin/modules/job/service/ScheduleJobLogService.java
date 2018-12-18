package com.fintech.admin.modules.job.service;

import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.fintech.admin.modules.job.entity.ScheduleJobLogEntity;
import com.fintech.common.utils.PageUtils;

/**
 * 定时任务日志
 *
 */
public interface ScheduleJobLogService extends IService<ScheduleJobLogEntity> {

	PageUtils queryPage(Map<String, Object> params);
	
}
