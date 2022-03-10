package com.lee.test.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUser implements UserDetails {
	private String memId;
	private String memPw;
	private String memName;
	private String memPhoto;
	private Collection<SimpleGrantedAuthority> authorities;
	
	public CustomUser(String memId, String memPw, String memName, String memPhoto,
			Collection<SimpleGrantedAuthority> authorities) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memPhoto = memPhoto;
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends SimpleGrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return authorities;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return memPw;
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return memName;
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	public String getMemPhoto() {
		return memPhoto;
	}

	public String getMemId() {
		return memId;
	}

}
