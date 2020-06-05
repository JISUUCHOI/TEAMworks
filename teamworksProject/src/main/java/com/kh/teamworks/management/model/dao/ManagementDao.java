package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.management.model.vo.Job;

@Repository("mgDao")
public class ManagementDao {
	
	public ArrayList<Job> selectJobCode(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managementMapper.selectJobCode");
	}
	
}
