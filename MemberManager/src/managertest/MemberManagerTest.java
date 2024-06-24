package managertest;


import java.util.List;

import member.Member;
import member.MemberDAO;
import member.MemberService;

public class MemberManagerTest {
	public static void main(String[] args) {
		MemberService service = new MemberService(new MemberDAO());
		List<Member> memberList = service.listAll();

		// 회원 등록
		Member member = new Member("test2402", "1234", "nick2402");
		if (service.regist(member)){
			System.out.println("회원을 등록하였습니다.");
		} else {
			System.out.println("회원 등록을 실패하였습니다.");
		}
			
		// 회원 목록 보기
		for (Member mem : memberList) {
				System.out.println(mem.toString());	
		}
		
		// 회원 수정
		member = new Member(5, null, "4321", "nick2401111", null);
		service.edit(member, "1234");
		
		// 회원 조회
		member = service.read(5);
		if (member != null) {
			System.out.println(member.toString());
		}
		
		// 회원 삭제
		service.remove(1);
		
	
	}
}
