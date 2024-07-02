<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="cart.*"
	import="Book.*"
	import="BookOracle.*"
	import="java.util.List"
    pageEncoding="UTF-8"%>
<%@ include file="/common/isLoggedIn.jsp" %>    
    
<%
	CartService cartService = new OracleCartService(new OracleCartDAO());
	List<CartItem> itemList = cartService.listAll(memberNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
	input[type="number"] {
		width : 2.5em;
	}
	form {
		display : inline;
	}
	table {
		border-collapse : collapse;
		text-align : center;
	}
	td {
		padding : 5px;
	}
	
</style>
</head>
<body>
<%@ include file = "/common/header.jsp" %>
<h3>장바구니</h3>
<% if (itemList.size() == 0)  { %>
	<p>장바구니가 비어 있습니다.</p>
<% } else { 
		BookService bookService = new OracleBookService(new OracleBookDAO());
%>
	<table border=1>
		<tr><th>아이디</th><th>제목</th><th>작가</th><th>가격</th><th>수량</th></tr>
		<% 
			int numItems = 0, totalPrice = 0;
			for (CartItem item : itemList) { 
				Book book = bookService.detail(item.getBookId());
				numItems += item.getQuantity();
				totalPrice += book.getPrice() * item.getQuantity();
		%>
		<tr><td><%= item.getBookId() %></td><td><%= book.getBookname() %></td>
			<td><%= book.getAuthor() %></td><td><%= String.format("%,d", book.getPrice()) %></td>
			<td>	<form action="update.jsp" method="post" onsubmit="return isValidForm()">
					<input type="hidden" name="id" value="<%= item.getId() %>">
					<input type="number" name="quantity" value="<%= item.getQuantity() %>">
					<input type="submit" value="수정">
					
			</form>
				<button onclick="askConfirmRemove(<%= item.getBookId() %>)">삭제</button>
			</td>
		</tr>
		
		<%} %>
	</table>
	<br>
	<p>총 상품가격 : <%= String.format("%,d", totalPrice) %>원 (총 <%= numItems %>권)</p>
	<button onclick="askConfirmOrder()">주문하기</button>
	<button onclick="askConfirmClear()">장바구니 비우기</button>	
<% } %>

<%@ include file ="/common/footer.jsp" %>
<script>
	function askConfirmOrder() {
		if (confirm("장바구니의 모든 도서를 주문합니다."))
			location = "<%= request.getContextPath() %>/order/order.jsp";		
	}
	
	function askConfirmClear() {
		System.out.println("clear 클릭은 됨");
		if (confirm("장바구니의 모든 도서를 삭제합니다."))
			location = "<%= request.getContextPath() %>/cart/clear.jsp?=" + ;
	}
	
	function askConfirmRemove(cartId) {
		System.out.println("삭제 클릭은 됨");
		if (confirm("도서를 장바구니에서 삭제합니다.") {
			location = "<%= request.getContextPath() %>/cart/remove.jsp?id=" + cartId;
	}
	
</script>
</body>
</html>