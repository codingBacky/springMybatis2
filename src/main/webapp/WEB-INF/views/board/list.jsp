<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board List</h1>

		
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board List Page</div>
			<button id="regBtn" type="button" class="btn btn-xs pull-right">Register
			New Board</button>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover">
					<!--             <table width="100%"
               class="table table-striped table-bordered table-hover"
               id="dataTables-example"> -->
					<thead>
						<tr>
							<th>#번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>수정일</th>
						</tr>

					</thead>
					<c:forEach items="${list}" var="board">
						<tr class="odd gradeX">
							<td>${board.bno}</td>
							<td><a href="/board/get?bno=${board.bno}">${board.title}</a></td>
							<td>${board.content}</td>
							<td>${board.writer}</td>
							<td><fmt:formatDate value="${board.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${board.updateDate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>

				<!--모달창 추가-->
				<div class="modal fade" id="myModal">
					<div class="modal-dialog">
						<div class="modal-content">

							<!-- Modal Header -->
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" id="myModalLable">Modal Heading</h4>
							</div>

							<!-- Modal body -->
							<div class="modal-body">complete..</div>

							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-danger"
									data-dismiss="modal">Close</button>
							</div>

						</div>
					</div>
				</div>
				<!--모달창 추가-->

			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<script type="text/javascript">
	$(document).ready(function() {
		var result = '<c:out value="${result}"/>'
		
		checkModal(result);
		
		/* 모달창 */
		function checkModal(result) {
			if (result === "") {
				return;
			}
			if (parseInt(result) > 0) {
				$('.modal-body').html("게시글" + parseInt(result) + "번이 등록됨");
			}
			$("#myModal").modal("show");
		}
		/* register 호출 */
		$("#regBtn").click(function(){
			self.location = "/board/register";
		})
	});
</script>
<%@ include file="../includes/footer.jsp"%>