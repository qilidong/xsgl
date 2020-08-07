package com.at.service.impl;

import com.at.mapper.SysUsersMapper;
import com.at.pojo.SysUsers;
import com.at.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author qld
 * @projectName xsgl
 * @description: TODO
 * @date 2020/6/2616:58
 */
@Service
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUsersMapper sysUsersMapper;

    @Override
    public SysUsers getUser(SysUsers sysUsers) {
        return sysUsersMapper.getUser(sysUsers);
    }
}
