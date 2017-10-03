
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
<div class="modal fade" id="doneVoteModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">결과보기</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-12 col-sm-12 text-center">
							<label for="id" class="content"></label>
						</div>
						<div class="clearfix"></div>
					</div>
					 <div class="row vote-results results">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="margin-left: 5px;">
                        <input type="hidden" id="item1Count" name="item1Count">
						<input type="hidden" id="item2Count" name="item2Count">
						<input type="hidden" id="item3Count" name="item3Count">
						<input type="hidden" id="item4Count" name="item4Count">
						<input type="hidden" id="item5Count" name="item5Count">
						<input type="hidden" id="item6Count" name="item6Count">
                        <div>
                        <label id="item1" style="display:inline-block;"></label>
                        <div class="progress">
                            <div  id="item1bar"  class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">40% Excellent (success)</span>
                            </div>
                        </div>
                        </div>
                        <div>
                        <label id="item2" style="display:inline-block;"></label>
                        <div class="progress" >
                            <div id="item2bar" class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">20% Good (primary)</span>
                            </div>
                        </div>
                        </div>
                        <div id="itembox3">
                        <label id="item3" style="display:inline-block;"></label>
                        <div class="progress">
                            <div id="item3bar" class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">60% Can Be Improved (warning)</span>
                            </div>
                        </div>
                        </div>
                        <div id="item4bar">
                        <label id="item4" style="display:inline-block;"></label>
                        <div class="progress" id="itembox4">
                            <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100" >
                                <span class="sr-only">80% Bad (danger)</span>
                            </div>
                        </div>
                        </div>
                        <div id="item5bar">
                        <label id="item5" style="display:inline-block;"></label>
                        <div class="progress" id="itembox5">
                            <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="5" aria-valuemin="0" aria-valuemax="100">
                                <span class="sr-only">80% No Comment (info)</span>
                            </div>
                        </div>
                        </div>
                        <div id="item6bar">
                        <label id="item6" style="display:inline-block;"></label>
                        <div class="progress" id="itembox6">
                            <div class="progress-bar progress-bar-success" >
                                <span class="sr-only">35% Complete (success)</span>
                            </div>
                        </div>
                        </div>
                    </div>
					</div>
				</div>
				<br>

			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #ffd15c; color: #ffffff;">확인</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #ff7058; color: #ffffff;">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
</form>
