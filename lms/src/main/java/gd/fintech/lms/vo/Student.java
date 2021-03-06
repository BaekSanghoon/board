package gd.fintech.lms.vo;

import lombok.Data;

// 학생 Vo

@Data
public class Student {
	private String	studentId;				// 학생 아이디
	private String	studentEmail;			// 학생 이메일
	private String	studentPhone;			// 학생 연락처
	private String	studentName;			// 학생 이름
	private String	studentGender;			// 학생 성별 (남, 여)
	private String	studentBirth;			// 학생 생년월일
	private String	studentPosition;		// 학생 직책
	private String	studentAddressMain;		// 학생 1차 주소
	private String	studentAddressSub;		// 학생 2차 주소
	private String	studentImage;			// 학생 프로필 사진
	private String	studentAccessdate;		// 학생 계정 활성화 일시
	private String	studentUpdatedate;		// 학생 계정 업데이트 일시
}
