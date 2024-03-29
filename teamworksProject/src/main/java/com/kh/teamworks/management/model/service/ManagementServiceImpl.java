package com.kh.teamworks.management.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.dao.ManagementDao;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Proof;
import com.kh.teamworks.management.model.vo.Vacation;
import com.kh.teamworks.management.model.vo.empSearchCondition;

@Service("mgService")
public class ManagementServiceImpl implements ManagementService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ManagementDao mgDao;
	
	// 회사 정보 조회
	@Override
	public CompanyInfo selectCompanyInfo(String homNo) {
		return mgDao.selectCompanyInfo(sqlSession, homNo);
	}
	
	// 연결 사업장 조회
	@Override
	public CompanyBsns selectCompanyBsns(String homNo) {
		return mgDao.selectCompanyBsns(sqlSession, homNo);
	}
	
	// 사업장 정보 변경
	public int updateCompanyBsns(CompanyBsns cb) {
		return mgDao.updateCompanyBsns(sqlSession, cb);
	}

	// 로고 업데이트
	public int updateLogo(CompanyInfo ci) {
		return mgDao.updateLogo(sqlSession, ci);
	}
	
	// 직인 업데이트
	public int updateSeal(CompanyBsns cb) {
		return mgDao.updateSeal(sqlSession, cb);
	}

	// 사원 조회
	@Override
	public ArrayList<Employee> selectEmpList() {
		return mgDao.selectEmpList(sqlSession);
	}
	
	// 사원 조회
	@Override
	public ArrayList<Employee> selectEmpList(PageInfo pi) {
		return mgDao.selectEmpList(sqlSession, pi);
	}
	
	// 해당 부서에 소속된 사원 목록 조회용
	@Override
	public ArrayList<Employee> selectEmpList(int deptCode) {
		return mgDao.selectEmpList(sqlSession, deptCode);
	}

	// 키워드로 검색된 사원 목록 조회용
	@Override
	public ArrayList<Employee> selectEmpList(String keyword) {
		return mgDao.selectEmpList(sqlSession, keyword);
	}
	
	// 사원 키워드 조회
	@Override
	public ArrayList<Employee> selectEmpListKeyword(empSearchCondition eSc, PageInfo pi){
		return mgDao.selectEmpListKeyword(sqlSession, eSc, pi);
	}
	
	// 사원 수 카운트
	@Override
	public int selectEmpCount() {
		return mgDao.selectEmpCount(sqlSession);
	}
	
	// 검색 조건 사원 수 카운트
	@Override
	public int selectEmpCount(empSearchCondition eSc) {
		return mgDao.selectEmpCount(sqlSession, eSc);
	}
	
	// 퇴사자 등록
	public int updateStatus(String empId) {
		return mgDao.updateStatus(sqlSession, empId);
	}

	// 인사 정보 등록
	@Override
	public int insertEmployee(Employee e) {
		return mgDao.insertEmployee(sqlSession, e);
	}
	
	// 인사 정보 등록 사번 중복 체크
	@Override
	public int idCheck(String empId) {
		return mgDao.idCheck(sqlSession, empId);
	}

    // 휴가 리스트
	@Override
	public ArrayList<Vacation> selectVacationList(PageInfo pi) {
		return mgDao.selectVacationList(sqlSession, pi);
	}

	
	
	// 휴가 페이징 처리 
	@Override
	public int selectVacCount(empSearchCondition eSc) {
		return mgDao.selectVacationCount(sqlSession, eSc);
	}
	
	@Override
	public ArrayList<Vacation> selectVacationKeyword(empSearchCondition eSc, PageInfo pi) {
		return mgDao.selectVacationKeyword(sqlSession, eSc, pi);
	}

	/**
	 * 증명서 발급
	 */
	@Override
	public ArrayList<Proof> selectProofList(PageInfo pi) {
		return mgDao.selectProofList(sqlSession, pi);
	}
	/**
	 * 증명서 발급 listcount
	 */
	@Override
	public int selectProofListCount() {
		return mgDao.selectProofListCount(sqlSession);
	}
	@Override
	public Proof selectProof(String docNo) {
		return mgDao.selectProof(sqlSession, docNo);
	}
	@Override
	public int updatePfStatus(String docNo) {
		return mgDao.updatePfStatus(sqlSession, docNo);
	}
	@Override
	public ArrayList<Department> selectDeptList() {

		return mgDao.selectDeptList(sqlSession);
	}

	@Override
	public int insertDept(String deptName) {

		return mgDao.insertDept(sqlSession, deptName);
	}

	@Override
	public int updateDept(Department dept) {

		return mgDao.updateDept(sqlSession, dept);
	}

	@Override
	public int deleteDept(int deptCode) {

		return mgDao.deleteDept(sqlSession, deptCode);
	}

	@Override
	public ArrayList<Job> selectJobList() {
		return mgDao.selectJobList(sqlSession);
	}

	
	//
	@Override
	public Employee selectEmployeeInfo(Employee e) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateEmpInfo() {
		// TODO Auto-generated method stub
		return 0;
	}
	
	@Override
	public void searchEmpInfo() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int updateJobCode(Job job) {

		return mgDao.updateJobCode(sqlSession, job);
	}

	@Override
	public int deleteJobCode(int jobCode) {

		return mgDao.deleteJobCode(sqlSession, jobCode);
	}

	@Override
	public int insertJobCode(String jobName) {

		return mgDao.insertJobCode(sqlSession, jobName);
	}

	@Override
	public int saveRank(String jobName, int jobCode) {

		Job job = new Job(jobCode, jobName);
		return mgDao.saveRank(sqlSession, job);
	}

	

}
