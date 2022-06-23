<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<div class="modal fade" id="popup" role="dialog" tabindex="-1">
		<div class="modal-dialog modal-dialog-width1000 modal-dialog-height800">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">X</span>
				</button>
			</div>
			<div class="modal-body">
			<h1>hi</h1>
			</div>
		</div>		
	</div>
	<script>
		function sampleModalPopup(){
			var url="customerDetail.jps";
			$("#popup > .modal-dialog").load(url, function(){
				$("#popup").modal("show");
			}));
		}
	</script>
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../assets/js/modal.js"></script> -->
</html>