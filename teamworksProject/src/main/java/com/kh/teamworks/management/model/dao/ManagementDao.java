package com.kh.teamworks.management.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Job;

@Repository("mgDao")
public class ManagementDao {
	
	public ArrayList<Job> selectJobList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("managementMapper.selectJobList");
	}
	
	public CompanyInfo selectCompanyInfo(SqlSessionTemplate sqlSession, String empId) {
		return sqlSession.selectOne("managementMapper.selectCompanyInfo", empId);
	}

	public CompanyBsns selectCompanyBsns(SqlSessionTemplate sqlSession, int homNo) {
		return sqlSession.selectOne("managementMapper.selectCompanyBsns", homNo);
	}
	
}
