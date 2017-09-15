
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
</style>


<!-- Modal -->
<form action="/vote/" method="post" enctype="multipart/form-data" onsubmit="">
<div class="modal fade" id="doVoteModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">투표하기</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-12 col-sm-12 text-center">
							<label for="id" class="regist_label">오징어는 맛이 있을까요?</label>
						</div>
						<div class="clearfix"></div>
					</div>

					<ul class="list-group">
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios">
                                Excellent
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios">
                                Good
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios">
                                Can Be Improved
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios">
                                Bad
                            </label>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <div class="radio">
                            <label>
                                <input type="radio" name="optionsRadios">
                                No Comment
                            </label>
                        </div>
                    </li>
                </ul>

				</div>
				<br>

			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button id="registerBtn" type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">투표</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #333; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
</form>
