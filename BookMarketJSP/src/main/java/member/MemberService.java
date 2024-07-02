package member;

import java.util.List;

public interface MemberService {
	boolean regist(Member member);	
	Member read(int no);
	List<Member> listAll();
	boolean edit(Member member, String oldPassword);
	boolean remove(int no);
	Member login(String id, String password);
}