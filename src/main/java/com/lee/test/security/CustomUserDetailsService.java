package com.lee.test.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.lee.test.dao.MemberDao;
import com.lee.test.dto.Member;
import com.lee.test.util.Constant;

public class CustomUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		MemberDao mdao = Constant.mdao;
		Member dto = mdao.login(username);
		if(dto == null) {
			System.out.println("null");
			throw new UsernameNotFoundException("No user found with username");
		}
		
		String pw = dto.getMemPw();	// 이 값은 암호화 된 패스워드
		String memName = dto.getMemName();
		String memPhoto = dto.getMemPhoto();
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		roles.add(new SimpleGrantedAuthority("ROLE_USER"));
		UserDetails user = new CustomUser(username, pw, memName, memPhoto, roles);
		Constant.username = memName;
		return user;
	}
}
