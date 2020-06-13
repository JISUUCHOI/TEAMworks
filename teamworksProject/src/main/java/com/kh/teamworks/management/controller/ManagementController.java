package com.kh.teamworks.management.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.teamworks.common.model.vo.PageInfo;
import com.kh.teamworks.common.template.Pagination;
import com.kh.teamworks.employee.model.vo.Employee;
import com.kh.teamworks.management.model.service.ManagementServiceImpl;
import com.kh.teamworks.management.model.vo.CompanyBsns;
import com.kh.teamworks.management.model.vo.CompanyInfo;
import com.kh.teamworks.management.model.vo.Department;
import com.kh.teamworks.management.model.vo.Job;
import com.kh.teamworks.management.model.vo.Vacation;
import com.kh.teamworks.management.model.vo.empSearchCondition;

@Controller
public class ManagementController {

	@Autowired
	private ManagementServiceImpl mgService;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	// 회사 정보 화면
	@RequestMapping("main.mg")
	public String selectCompanyInfo(HttpServletRequest request) {

		HttpSession session = request.getSession();
		Employee e = (Employee) session.getAttribute("loginUser");

		String homNo = e.getHomNo();

		CompanyInfo companyInfo = mgService.selectCompanyInfo(homNo);
		CompanyBsns companyBsns = mgService.selectCompanyBsns(homNo);
		
		session.setAttribute("companyInfo", companyInfo);
		session.setAttribute("companyBsns", companyBsns);

		return "management/companyMainInfo";
	}
	
	// 사업장 정보 변경
	@RequestMapping("updateBsns.mg")
	public String updateCompanyBsns(CompanyBsns cb, HttpSession session) {
		Employee e = (Employee) session.getAttribute("loginUser");
		
		int homNoo = Integer.parseInt(e.getHomNo());
		cb.setHomNo(homNoo);
		
		int result = mgService.updateCompanyBsns(cb);
		
		if (result > 0) { // 사업장 정보 수정 성공 --> 메인 요청
			session.setAttribute("companyBsns",  mgService.selectCompanyBsns(e.getHomNo()));
			session.setAttribute("msg", "사업장 정보 수정 성공!");

			return "redirect:main.mg";

		} else { // 사업장 수정 실패 
			session.setAttribute("msg", "사업장 정보 수정 실패!!");
			return "redirect:main.mg";
		}
		
	}

	// 인사 정보 등록 화면
	@RequestMapping("enrollEmp.mg")
	public String employeeEnroll() {
		return "management/companyEnrollMemberInfo";
	}

	// 인사 정보 등록
	@RequestMapping("insertEmp.mg")
	public String insertEmployee(Employee e, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		if (!file.getOriginalFilename().equals("")) {

			String changeName = saveFile(e, file, request);

			e.setOriginName(file.getOriginalFilename());
			e.setChangeName(changeName);
		}
		String tempPwd = e.getEmpNo().substring(0, 6);
		String encPwd = bcryptPasswordEncoder.encode(tempPwd);

		e.setEmpPwd(encPwd);

		int result = mgService.insertEmployee(e);

		if (result > 0) {
			session.setAttribute("msg", "인사 정보 등록 성공!!");
			return "redirect:enrollEmp.mg";
		} else {
			session.setAttribute("msg", "인사 정보 등록 실패!!");
			return "common/errorPage";
		}

	}

	// 전달받은 파일명을 가지고 서버로부터 삭제하는 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\empUploadFiles\\";

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	// 공유해서 쓸수 있게끔 따로 정의 해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	// 인사 정보 등록 사진 등록 메소드
	private String saveFile(Employee ee, MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\empUploadFiles\\";

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHH").format(new Date());

		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"

		String empName = ee.getEmpName();

		String changeName = empName + currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	
	// 회사 로고 변경
	@RequestMapping("updateLogo.mg")
	public String updateLogo(CompanyInfo ci, HttpServletRequest request,
			@RequestParam(name = "reUploadLogo", required = false) MultipartFile file) {

		HttpSession session = request.getSession();
		CompanyInfo e = (CompanyInfo) session.getAttribute("companyInfo");

		ci.setHomNo(e.getHomNo());

		if (!file.getOriginalFilename().equals("")) {

			if (ci.getLogoChange() != null) {
				deleteLogoFile(ci.getLogoChange(), request);
			}

			String changeName = saveLogo(file, request);

			ci.setLogoChange(changeName);
			ci.setLogoOrigin(file.getOriginalFilename());
		}
		int result = mgService.updateLogo(ci);

		if (result > 0) {
			session.setAttribute("msg", "로고 변경 성공!!");
			return "redirect:main.mg";
		} else {
			session.setAttribute("msg", "로고 변경 실패!!");
			return "redirect:main.mg";
		}
	}

	public String saveLogo(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\CompanyLogo\\";
		String originName = file.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}

	public void deleteLogoFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\CompanyLogo\\";

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	// 직인 변경
	@RequestMapping("updateSeal.mg")
	public String updateSeal(CompanyBsns cb, HttpServletRequest request,
			@RequestParam(name = "reUploadSeal", required = false) MultipartFile file) {

		HttpSession session = request.getSession();
		CompanyBsns e = (CompanyBsns) session.getAttribute("companyBsns");

		cb.setCompanyNo(e.getCompanyNo());

		if (!file.getOriginalFilename().equals("")) {

			if (cb.getSealChange() != null) {
				deleteLogoFile(cb.getSealChange(), request);
			}

			String changeName = saveSeal(file, request);

			cb.setSealChange(changeName);
			cb.setSealOrigin(file.getOriginalFilename());
		}
		System.out.println(cb);
		int result = mgService.updateSeal(cb);

		if (result > 0) {
			session.setAttribute("msg", "직인 변경 성공!!");
			return "redirect:main.mg";
		} else {
			session.setAttribute("msg", "직인 변경 실패!!");
			return "redirect:main.mg";
		}
	}

	public String saveSeal(MultipartFile file, HttpServletRequest request) {

		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\CompanySeal\\";

		String originName = file.getOriginalFilename();

		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());

		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"

		String changeName = currentTime + ext;

		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}

	public void deleteSealFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\CompanySeal\\";

		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}

	// 사원 번호 중복 체크
	@ResponseBody
	@RequestMapping(value = "empIdCheck.mg")
	public String idCheck(String empId) {

		int count = mgService.idCheck(empId);

		if (count > 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	// 사원 명부
	@RequestMapping("empList.mg")
	public String empList(int currentPage, Model model) {

		int listCount = mgService.selectEmpCount();

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Employee> empList = mgService.selectEmpList(pi);
		
		
		model.addAttribute("empList", empList);
		model.addAttribute("pi", pi);

		return "management/companyMemberList";
	}

	// 퇴사자 등록
	@ResponseBody
	@RequestMapping(value = "updateStatus.mg", method = RequestMethod.POST)
	public String updateStatus(@RequestParam("checkRow") String[] empRetire, ModelMap modelMap)
			throws Exception {

		// 삭제할 사용자 ID마다 반복해서 사용자 삭제
		for (String empId : empRetire) {
			System.out.println("사용자 삭제 = " + empId);
			int count = mgService.updateStatus(empId);
		} 
	return"redirect:empList.mg";
	}

	// 사원 명부 검색
	@RequestMapping("empListSearch.mg")
	public String empListKeyword(int currentPage, empSearchCondition eSc, Model model) {

		if (eSc.getKeyword() != null) {
			switch (eSc.getCondition()) {
			case "empId":
				eSc.setEmpId(eSc.getKeyword());
				break;
			case "empName":
				eSc.setEmpName(eSc.getKeyword());
				break;
			case "deptName":
				eSc.setDeptName(eSc.getKeyword());
				break;
			}

		} else {
			eSc.setEmpId(null);
			eSc.setEmpName(null);
			eSc.setDeptName(null);
		}

		int listCount = mgService.selectEmpCount(eSc);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Employee> empList = mgService.selectEmpListKeyword(eSc, pi);

		model.addAttribute("pi", pi);
		model.addAttribute("empList", empList);
		model.addAttribute("eSc", eSc);

		return "management/companyMemberList";
	}
	
	
	// 휴가 관리
	@RequestMapping("vacationList.mg")
	public String vacationList(int currentPage, Model model) {

		int listCount = mgService.selectEmpCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Vacation> vacList =mgService.selectVacationList(pi);

		
		model.addAttribute("vacList", vacList);

		model.addAttribute("pi", pi);
		
		
		

		return "management/companyVacationList";
	}

	// 휴가 검색 관리
	@RequestMapping("vacationSearch.mg")
	public String vacationSearch(int currentPage, String keyword, Model model) {

		int listCount = mgService.selectVacCount(keyword);

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);

		ArrayList<Vacation> vacList = mgService.searchVacationList(keyword, pi);

		model.addAttribute("vacList", vacList);
		model.addAttribute("pi", pi);

		return "management/companyVacationList";
	}

	// 증명서 발급
	@RequestMapping("empDocument.mg")
	public String empDocument() {
		return "management/companyMemberDocument";
	}

	// 최지수_조직도
	@RequestMapping("org.mg")
	public String orgList(Model model) {

		ArrayList<Department> deptList = mgService.selectDeptList();
		ArrayList<Employee> empList = mgService.selectEmpList();

		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);

		return "management/companyOrganization";
	}

	// 최지수_조직도
	// 페이지 로딩 시 전체 사원 목록 조회하는 ajax 통신용 서비스
	@ResponseBody
	@RequestMapping(value = "allEmpList.mg", method = RequestMethod.POST)
	public void allEmpList(HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Employee> empList = mgService.selectEmpList();

		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(empList, response.getWriter());
	}

	// 최지수_조직도
	// 부서명 클릭 시 해당 부서에 소속된 사원 목록 조회하는 ajax 통신용 서비스
	@ResponseBody
	@RequestMapping(value = "orgEmpList.mg", method = RequestMethod.POST)
	public void orgEmpList(int deptCode, HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Employee> orgEmpList = mgService.selectEmpList(deptCode);

		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(orgEmpList, response.getWriter());
	}

	// 최지수_조직도
	// 부서 등록
	@RequestMapping("insertDept.mg")
	public String insertDept(String deptName, HttpSession session, Model model) {

		int result = mgService.insertDept(deptName);

		if (result > 0) { // 부서 등록 성공 --> 다시 조직도 페이지

			session.setAttribute("msg", "부서가 성공적으로 등록되었습니다.");
			return "redirect:org.mg";

		} else { // 부서 등록 실패 --> 에러페이지

			model.addAttribute("msg", "부서 등록에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}

	// 최지수_조직도
	// 부서 수정
	@RequestMapping("updateDept.mg")
	public String updateDept(Department dept, HttpSession session, Model model) {

		int result = mgService.updateDept(dept);

		if (result > 0) { // 부서 수정 성공 --> 다시 조직도 페이지

			session.setAttribute("msg", "부서가 성공적으로 수정되었습니다.");
			return "redirect:org.mg";

		} else { // 부서 수정 실패 --> 에러페이지

			model.addAttribute("msg", "부서 수정에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}

	}

	// 최지수_조직도
	// 부서 삭제
	@RequestMapping("deleteDept.mg")
	public String deleteDept(int deptCode, HttpSession session, Model model) {

		int result = mgService.deleteDept(deptCode);

		if (result > 0) { // 부서 삭제 성공 --> 다시 조직도 페이지

			session.setAttribute("msg", "해당 부서가 삭제되었습니다.");
			return "redirect:org.mg";

		} else { // 부서 삭제 실패 --> 에러페이지

			model.addAttribute("msg", "부서 삭제에 실패했습니다. 다시 시도해주세요.");
			return "common/errorPage";
		}
	}

	// 최지수_조직도
	// 사원명 검색
	@ResponseBody
	@RequestMapping(value = "searchEmpName.mg", method = RequestMethod.POST)
	public void searchEmpName(String keyword, HttpServletResponse response) throws JsonIOException, IOException {

		ArrayList<Employee> searchList = mgService.selectEmpList(keyword);

		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(searchList, response.getWriter());
	}

	// 직급 관리
	@RequestMapping("orgJobList.mg")
	public String selectJobList(Model model) {
		ArrayList<Job> jobList = mgService.selectJobList();
		model.addAttribute("jobList", jobList);

		return "management/companyOrganizationOrder";
	}

}