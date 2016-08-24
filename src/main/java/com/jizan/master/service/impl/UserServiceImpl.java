package com.jizan.master.service.impl;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.jizan.master.dao.UserDao;
import com.jizan.master.dao.BaseDao;
import com.jizan.master.entity.User;
import com.jizan.master.service.UserService;
import com.jizan.master.service.impl.BaseServiceImpl;

@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
	@Resource
	private UserDao userDao;

	public BaseDao<User> getBaseDao() {
		return this.userDao;
	}
}
