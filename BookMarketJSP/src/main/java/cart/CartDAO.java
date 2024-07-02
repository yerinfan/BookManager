package cart;

import java.util.List;

public interface CartDAO { 
	//C
	int insert(CartItem item);
	//R
	CartItem select(int cartId, int loggedMemberNo); // 왼 로그인자 오 맞냐?
	CartItem selectByBookId(int loggedMemberNo, int bookId);
	List<CartItem> selectByBookId(int bookId);
	List<CartItem> selectAll(int loggedMemberNo);
	//U
	int update(int cartId, int loggedMemberNo, int quantity);
	//D
	int delete(int cartId, int loggedMemberNo);
	int deleteByBookId(int bookId);
	int deleteAll(int loggedMemberNo);
	

}