package cart;

import java.util.List;

public interface CartService {
		boolean add(CartItem item);
		List<CartItem> readByBookNo(int book_no);
		//CartItem readByBookNo(int loggedMemberNo, int book_no);
		List<CartItem> listAll(int loggedMemberNo);
		boolean update(int cartId, int loggedMemberNo, int quantity);
		boolean remove(int cartId, int loggedMemberNo);
		boolean removeByBookId(int bookId);
		boolean clear(int loggedMemberNo);

}