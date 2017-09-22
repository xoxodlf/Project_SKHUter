
<%@ page contentType="text/html; charset=UTF-8"%>

<style>
.stuSchedule_label {
 font-family: 'LotteMartDream'; 
 font-size: 20px;
 color: black;
}

@font-face {
  font-family: 'LotteMartDream';
  font-style: normal;
  font-weight: 400;
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
}
 
#stuScheduleModal label {
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
</style>


<!-- Modal -->
<form action="/stuSchedule/" method="post" enctype="multipart/form-data" onsubmit="">
<div class="modal fade" id="stuScheduleModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="stuSchedule_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">일정 등록</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="stuSchedule_label">내용</label>
						</div>
						<div class="col-xs-7 col-sm-7">
							<textarea rows="45px" class="form-control onlyNumber" placeholder="내용을 입력하세욥" maxlength="255" onkeyup="idCheck()" style="width: 275px; height: 100px;"></textarea>
						</div>
						<div class="clearfix"></div>
					</div>
					<br>
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="stuSchedule_label">시작일</label>
						</div>
						<div class="col-xs-9 col-sm-9 ">
							<div class="form-group">
                            	<input type="date" class="form-control onlyNumber" style="display: inline-block; width: 150px;">
                            	<input type="time" class="form-control onlyNumber" style="display: inline-block; width: 100px; margin-left: 21px;">
                            </div>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="stuSchedule_label">종료일</label>
						</div>
						<div class="col-xs-9 col-sm-9 ">
							<div class="form-group">
                            	<input type="date" class="form-control onlyNumber" style="display: inline-block; width: 150px;">
                            	<input type="time" class="form-control onlyNumber" style="display: inline-block; width: 100px; margin-left: 21px;">
                            </div>
						</div>
						<div class="clearfix"></div>
					</div>
				<br>

			</div>
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button id="registerBtn" type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">등록</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
 </div>
</form>
