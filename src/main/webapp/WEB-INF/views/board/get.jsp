<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Board Read</h1>


	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<div class="panel-body">
				<div class="form-group">
					<label>Bno</label> <input class="form-control" name='bno'
						value='<c:out value="${board.bno}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>Title</label> <input class="form-control" name='title'
						value='<c:out value="${board.title}"/>' readonly="readonly">
				</div>
				<div class="form-group">
					<label>Text area</label>
					<textarea class="form-control" rows="3" name='content'
						readonly="readonly"><c:out value="${board.content}"/></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label>
					<input class="form-control" name='writer'
						value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
				<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=${board.bno}'">Modify</button>
				<button data-oper='list' class="btn btn-info" onclick="location.href='/board/list'">List</button>
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
		$("#regBtn").click(function() {
			self.location = "/board/register";
		})
	});
</script>
<%@ include file="../includes/footer.jsp"%>