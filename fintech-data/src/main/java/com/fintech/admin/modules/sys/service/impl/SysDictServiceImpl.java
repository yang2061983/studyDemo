package com.fintech.admin.modules.sys.service.impl;

import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.fintech.admin.modules.sys.dao.SysDictDao;
import com.fintech.admin.modules.sys.entity.SysDictEntity;
import com.fintech.admin.modules.sys.service.SysDictService;
import com.fintech.common.utils.PageUtils;
import com.fintech.common.utils.Query;


@Service("sysDictService")
public class SysDictServiceImpl extends ServiceImpl<SysDictDao, SysDictEntity> implements SysDictService {
    @Autowired
    private SysDictDao sysDictDao;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        String name = (String)params.get("name");

        Page<SysDictEntity> page = this.selectPage(
                new Query<SysDictEntity>(params).getPage(),
                new EntityWrapper<SysDictEntity>()
                    .like(StringUtils.isNotBlank(name),"name", name)
        );

        return new PageUtils(page);
    }

    @Override
    public List<SysDictEntity> findListByType(String type) {
        return sysDictDao.findListByType(type);
    }

    @Override
    public PageInfo<SysDictEntity> findAllList(Map<String, Object> params) {
        StringBuffer sb = new StringBuffer();
        if(org.apache.commons.lang3.StringUtils.isNotEmpty(params.get("sidx").toString())) {
            sb.append(params.get("sidx")).append(" ").append(params.get("order"));
        }else {
            sb.append("id ").append(params.get("order"));
        }

        PageHelper.startPage(Integer.parseInt((String) params.get("page")), Integer.parseInt((String) params.get("limit")),sb.toString());
        List<SysDictEntity> List = sysDictDao.findAllList(params);
        PageInfo<SysDictEntity> pageInfo = new PageInfo<SysDictEntity>(List);
        return pageInfo;
    }

}
