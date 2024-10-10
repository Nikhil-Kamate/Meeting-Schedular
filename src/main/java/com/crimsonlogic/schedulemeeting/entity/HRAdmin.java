package com.crimsonlogic.schedulemeeting.entity;

import javax.persistence.Column;

/**
 * Represents the HR admin Entity 
 * Author : Nikhil Kamate
 */

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.NoArgsConstructor;

@Entity
@NoArgsConstructor
@Table (name="HRadmin")
public class HRAdmin {
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	@Column (name ="hradmin_id")
	private int hradminId;
	
	private String username;
	
	private String password;
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

}
