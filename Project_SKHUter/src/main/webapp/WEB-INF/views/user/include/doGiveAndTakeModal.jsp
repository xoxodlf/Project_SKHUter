
<%@ page contentType="text/html; charset=UTF-8"%>

<style>
.regist_label {
 font-size: 20px;
 color: black;
}

@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
}

#registerModal label {
  font-family: 'LotteMartDream'; 
}
.list-group-item{
border:none;
}
.radio label, .checkbox label {
    font-size: 17px;
    min-height: 20px;
    padding-left: 20px;
    margin-bottom: 0;
    font-weight: normal;
    cursor: pointer;
}
.progress {
    width: 97.5%;
    height: 20px;
    margin-bottom: 20px;
    overflow: hidden;
    background-color: #f5f5f5;
    border-radius: 4px;
    box-shadow: inset 0 1px 2px rgba(0, 0, 0, .1);
}
</style>


<!-- Modal -->
<form action="/vote/" method="post" enctype="multipart/form-data" onsubmit="">
<div class="modal fade" id="doGiveAndTakeModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">결과보기</h2>
			</div>

			<div class="modal-body" style="overflow: hidden;">
				<div class="col-xs-12 col-sm-12 text-center">
							<label style="font-size:30px;">인수요청이 완료되었습니다!</label>
					</div>
					<div class="col-xs-12 col-sm-12 text-center">
							<label style="font-size:20px;">보안코드:</label><label style="font-size:20px; color:#40596b;">56789</label>
					</div>
					<div class="col-xs-12 col-sm-12 text-center">
							<label style="font-size:15px; color:#ff7058;">인계자에게 보안코드를 알려주세요!</label>
					</div>

			</div>

			<div class="modal-footer">
				<div class="row">
				<div class="col-xs-3 col-sm-3 text-center">
							<label></label>
						</div>
					<div class="col-xs-6 col-xs-6 text-center" style="text-align: center;">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #ffd15c; color: #ffffff;">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
</form>
