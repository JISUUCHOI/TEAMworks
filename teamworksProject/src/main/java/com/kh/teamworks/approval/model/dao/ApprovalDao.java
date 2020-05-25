package com.kh.teamworks.approval.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.teamworks.approval.model.vo.Document;

@Repository("aDao")
public class ApprovalDao {

	public int insertProof(SqlSessionTemplate sqlSession, Document d) {
		return sqlSession.insert("documentMapper.insertProof", d);
	}

}
