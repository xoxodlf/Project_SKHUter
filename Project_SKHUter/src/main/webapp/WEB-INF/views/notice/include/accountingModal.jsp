<!--
 *  
 * 회원가입 모달페이지
 *
 * @파일명 : user/include/regiterModal.jsp
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 14. 
-->

<%@ page contentType="text/html; charset=UTF-8"%>

<style>
.regist_label {
	font-size: 15px;
	color: black;
}

@font-face {
	font-family: 'LotteMartDream';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2')
		format('woff2'),
		url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff')
		format('woff');
}

#accountingModal label {
	font-family: 'LotteMartDream';
}

.uploadedList {
   width: 100%;
   height: 150px;
}
</style>


<!-- Modal -->
<form id="uploadForm" action="/notice/accountingList/accountingRegist" method="post" enctype="multipart/form-data">
	<div class="modal fade" id="accountingModal" role="dialog">
		<div class="modal-dialog" style="width: 35%">

			<!-- Modal content-->
			<div class="modal-content">

				<div class="modal-header" style="background: #40596b;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">회계내역 등록</h2>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="form-group">
							<div class="col-xs-3 col-sm-3 text-center">
								<label for="id" class="regist_label">거래 내역</label>
							</div>
							<div class="col-xs-6 col-sm-6">
								<input type="text" class="form-control" id="content" name="content"
									placeholder="거래 내역을 입력하세요" maxlength="30">
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="form-group" align="center">
							<div class="col-xs-3 col-sm-3 text-center">
								<label for="id" class="regist_label">분류</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="status" value="1" checked="checked"/>지출</label> 
								<label style="margin-left: 30px;"><input type="radio" name="status" value="0">수입</label>
							</div>
							<div class="clearfix"></div>
						</div>
						
						<div class="form-group">
							<div class="col-xs-3 col-sm-3 text-center">
								<label for="repw" class="regist_label">금액</label>
							</div>
							<div class="col-xs-6 col-sm-6">
								<input type="number" class="form-control onlyNumber" id="price" name="price" placeholder="금액을 입력하세요">
							</div>
							<div class="col-md-3 col-sm-3" style="font-size: small">
								<label id="info"></label>
							</div>
							<div class="clearfix"></div>
						</div>
						
						<div class="form-group">
							<div class="col-xs-3 col-sm-3 text-center">
								<label for="id" class="regist_label">사용 날짜</label>
							</div>
							<div class="col-xs-6 col-sm-6">
								<div class="form-group" style="display: inline-block; width: 350px;">
                  					<input type="date" id="sinputdate" class="form-control onlyNumber" style="display: inline-block; width: 45%;">
        							<input type="hidden" id="accountDate" name="accountDate">
        						</div>
        					</div>
							<div class="clearfix"></div>
						</div>
						
						<div class="row">
                  			<div class="col-xs-2 col-xs-offset-1"></div>
                 			<div class="col-xs-8">
                     			<div class="thumbnail">
                        			<div class="uploadedList" id="holder"></div>
                     			</div>
                  			</div>
               			</div>

						<div class="form-group">
							<div class="col-xs-3 col-sm-3 text-center">
								<label class="regist_label">파일 첨부</label>
							</div>
							<div class="col-xs-6 col-sm-6 ">
								<div class="form-group">
									<button id="fileBtn" class="btn btn-primary"style="background-color: #40596b; margin: -4px 2px; border: #354555; width: 35%">파일선택</button>
									<input type="file" class="fileSelect" style="display: none;" id="fileSelect" name="file" style="width: 100%" accept="">
									<input type="hidden" id="uuidName" name="uuidName">
									<input type="hidden" id="originName" name="originName">
									<input type="hidden" id="displayName" name="displayName">
									<input type="hidden" id="fileName" name="fileName" value="sdfsdf">
									<input type="hidden" id="userNo" name="userNo" value="${login.userNo }">
								</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
					<br>
				</div>

				<div class="modal-footer">
			<div class="row">
				<div class="col-xs-2 col-xs-offset-4">
					<button type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;" onmouseover="throwDate()">등록</button>
				</div>
				<div class="col-xs-2">
					<button type="button" id="cancelBtn" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; background-color: #40596b; color: #ffffff;">취소</button>
				</div>
			</div>
		</div>
			</div>
		</div>
	</div>
</form>

<script>

function throwDate(){
     var write =new Date();   //시작날짜
     write = $('#sinputdate').val();
	 $('#accountDate').val(write);
	 
	 console.log(write);
}

/** 파일선택 CSS*/
$("#fileBtn").on('click', function(){
   event.preventDefault();
   $("#fileSelect").trigger('click');
});

$(function() {
	   var userNo = ${login.userNo};
	   
	   $("#fileSelect").on("change", function(e) {
	      e.preventDefault();
	      
	      var upload = $('#fileSelect');
	      // 전달된 파일 데이터를 가져오는 부분
	      var file = upload[0].files[0];
	      
	      console.log(file);
	      
	      var formData = new FormData();
	      
	      formData.append("file", file);
	      
	      $.ajax({
	         url: '/notice/accountingList/uploadAjax',
	         data : formData,
	         dataType: 'text',
	         processData: false,
	         contentType: false,
	         type: 'POST',
	         success: function(data) {
	            var str ="";
	            
	            console.log("파일 : " + data);
	            
	            if (checkImageType(data)) {
	                str ="<div>"
	                   + "<img src='/notice/accountingList/displayFile?fileName="+data+"'/>"
	                   + "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>" 
	                   +"</div>";
	             } else {
	                str ="<div>"
	                   + "<img src='/resources/images/file.png'/>"
	                   + getOriginalName(data) 
	                   + "<small data-src=" + data +" class='delbtn'> <i class='fa fa-fw fa-remove'></i> </small>"
	                   +"</div>";
	             }
	             
	             $('#uuidName').val(data);
	             $('#displayName').val("/notice/accountingList/displayFile?fileName="+data);
	             $(".uploadedList").html(str);
	         }
	      });
	   });
	   
	   /** 첨부 파일 삭제 처리 */
	   $(".uploadedList").on("click", "small", function(event) {      // small 태그로 처리된 'X' 클릭 이벤트
	      var that = $(this);
	      
	      $.ajax({
	         url:"/notice/accountingList/deleteFile",
	         type: 'POST',
	         data : {fileName: $(this).attr("data-src")},
	         dataType: 'text',
	         success : function(result) {
	            if (result == 'deleted') {
	               that.parent("div").remove();
	               $('.fileSelect').val("");
	            }
	         }
	      });
	   });
	   
	   /** 취소 버튼 클릭 시 삭제 처리 */
	   $("#cancelBtn").on("click", function(event) {   
	      var that = $(".delbtn");
	      
	      $.ajax({
	         url:"/notice/accountingList/deleteFile",
	         type: 'POST',
	         data : {fileName: that.attr("data-src")},
	         dataType: 'text',
	         success : function(result) {
	            if (result == 'deleted') {
	               that.parent("div").remove();
	               $('.file').val("");
	            }
	         }
	      });
	   });
	   
	   $("#uploadForm").submit(function(event) {
	      event.preventDefault();
	      
	      var that = $(this);
	      
	      if($("#content").val().trim().length <1){
	         swal({
	               title: '내역을 입력해 주세요!',
	               text: '',
	               type: 'warning',
	               confirmButtonText: '닫기'
	             })
	             return false;   
	      } 
	      
	      if(that["0"].file.value == "") {
	         swal({
	               title: '파일을 선택해 주세요!',
	               text: '',
	               type: 'warning',
	               confirmButtonText: '닫기'
	         })
	         return false;   
	      }
	      
	      var str = "";
	      
	      $(".uploadedList .delbtn").each(function(index) {
	         str += "<input type='hidden' name='files["+ index +"]' value='" + $(this).attr("href") +"'> ";
	      });
	      that.append(str);
	      
	      that.get(0).submit();
	   });
	   
	   /** 파일의 확장자가 존재하는지 검사 */
	   function checkImageType(fileName) {
		  var pattern = /jpg|gif|png|jpeg/i;   // i는 대소문자 구분 없음을 의미
	      
	      return fileName.match(pattern);
	   }
	   
	   /** uuid로 인해 길어진 파일 이름 줄여주는 기능*/
	   function getOriginalName (fileName) {
	      if (checkImageType(fileName)) {
	         return;
	      }
	      
	      var idx = fileName.indexOf("_")+1;   // 원본 파일 이름만 추출
	      
	      return fileName.substr(idx);
	   }
	   
	   /** 이미지 파일의 원본 파일 찾기 */
	   function getImageLink(fileName) {
	      if (!checkImageType(fileName)) {
	         return;
	      }
	      
	      var front = fileName.substr(0, 9);   // /asc 경로 추출
	      var end = fileName.substr(11);    // s_ 제거
	      
	      return front + end;
	   }
	});
</script>