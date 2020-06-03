package com.kh.teamworks.approval.model.vo;

import java.sql.Clob;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Document {
	
	// 결재문서
	private String docNo;				// 문서코드
	private String empId;			// 사원번호
	private String docSc;			// 문서양식명		// 기안서, 경조사, 휴가, 제증명
	private int docStatus;			// 문서상태		// 0:대기 1: 진행 2: 완료 3: 반려 4:회수
	private String docTitle;		// 문서제목
	private String docReference;	// 참조자
	private String docDate;			// 기안일자
	private String docEnd;			// 마감일자
	private String docDepartment;		// 기안부서		// 개발팀, 경영지원팀
	
	// 경조비신청서
	private String feSq;			// 경조구분		// 결혼, 환갑/칠순, 사망
	private String feRelation;		// 가족관계		// 본인, 부모님, 배우자, 자녀, 형제자매
	private String feName;			// 대상자 //추가
	private String feStart;			// 경조시작일
	private String feEnd;			// 경조종료일
	private String fePlace;			// 경조장소
	private String fePrice;			// 신청금액  //추가
	private String feBank;			// 은행
	private String feAccount;		// 계좌번호
	private String feAccountName;	// 예금주
	
	// 휴가신청서
	private String vcSq;			// 휴가구분		// 연차, 경조사, 병가, 출산
	private String vcDay;			// 전일반일구분 	// 전일, 반일
	private String vcStart;			// 휴가시작일
	private String vcEnd;			// 휴가종료일
	private int vcCount;			// 휴가일수
	private String vcContent;		// 휴가사유
	
	// 기안서
	private String docContent;		// 문서내용
	private String fileName;		// 파일명
	private String filePath;		// 파일경로
	
	// 제증명신청서
	private String pfSq;			// 제증명구분		// 재직증명서,  경력증명서, 퇴직증명서
	private String pfPurpose;		// 용도
	private String pfStatus;		// 발행상태		// 발행확인 되면 Y값 변경
	
	// 결재선
	private String approver;		// 화면에서 컨트롤러로 넘어갈 결재자사원번호
	
	
	
	public Document(String docNo, String empId, String docSc, int docStatus, String docTitle, String docReference,
			String docDate, String docEnd, String docDepartment, String pfSq, String pfPurpose, String pfStatus) {
		super();
		this.docNo = docNo;
		this.empId = empId;
		this.docSc = docSc;
		this.docStatus = docStatus;
		this.docTitle = docTitle;
		this.docReference = docReference;
		this.docDate = docDate;
		this.docEnd = docEnd;
		this.docDepartment = docDepartment;
		this.pfSq = pfSq;
		this.pfPurpose = pfPurpose;
		this.pfStatus = pfStatus;
		
		
	}
	
	
	
	
	
	
	
	
	

}
