package com.lee.test.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.lee.test.dao.MemberDao;
import com.lee.test.dao.ProjectDao;

public class Constant {
	public static MemberDao mdao;
	public static ProjectDao pdao;
	public static BCryptPasswordEncoder passwordEncoder;
	public static String username;
}
