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
  src: url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff2') format('woff2'), url('//cdn.jsdelivr.net/korean-webfonts/1/corps/lottemart/LotteMartDream/LotteMartDreamMedium.woff') format('woff');
}

#registerModal label {
  font-family: 'LotteMartDream'; 
}

</style>


<!-- Modal -->
<form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="">
<div class="modal fade" id="registerModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">회원가입</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="number" class="form-control onlyNumber" id="registerId" name="id" placeholder="학번" maxlength="9" onkeyup="idCheck()">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="display">(학번)</label>
                        </div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="registerPassword" name="password" placeholder="비밀번호를 입력하세요" >
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small; color: black;">
                          <label id="">(8 ~ 12자)</label>
                        </div>            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="repw" class="regist_label">비밀번호 확인</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="비밀번호를 한 번 더 입력하세요" onkeyup="passwdCheck();" >
						</div>
                        <div class="col-md-3 col-sm-3" style="font-size:small">
                          <label id="info"></label>
                        </div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="text" class="form-control" id="registerName" name="name" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-6 col-sm-6 ">
							<input type="tel" class="form-control placeholder" id="registerPhone" name="phone" placeholder="휴대폰 번호를 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label"> 학년 </label>
						</div>
						<div class="col-xs-6 col-sm-6 ">
							<select name="grade" style="width: 50%">
								<option value="1"> 1학년 </option>
								<option value="2"> 2학년 </option>
								<option value="3"> 3학년 </option>
								<option value="4"> 4학년 </option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div>
					
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label"> 학적 상태 </label>
						</div>
						<div class="col-xs-6 col-sm-6 ">
							<select name="isLeave" style="width: 50%">
								<option value="0"> 재학 </option>
								<option value="1"> 휴학 </option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
				<br>

			</div>

			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-4">
						<button id="registerBtn" type="submit" class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">가입</button>
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

<script>

	/** 아이디 중복체크 */
   function idCheck() {
      var registerId = $('#registerId').val();
      
      if (registerId.length > 8) {

         $.ajax({
            type : 'GET',
            url : "/user/idCheck",
            data : {
            	registerId : registerId
            },
            success : function(request) {
               var display = document.getElementById("display");
               if (request == "success") {
                  display.innerHTML = "사용 가능합니다.";
                  $("#display").css("color", "blue");
               } else if (request == "fail") {
                  display.innerHTML = "이미 사용 중입니다.";
                  $("#display").css("color", "red");
               }
            }
         });
      }
   }	
   
   
   /** 비밀번호 일치 체크*/
  function passwdCheck() {
      var registerPassword = $('#registerPassword').val();
      var repassword = $('#repassword').val();
      var passwdText = document.getElementById("info");
      if (registerPassword == repassword) {
         passwdText.innerHTML = "일치!";
         $("#info").css("color","blue");
      } else {
         passwdText.innerHTML = "일치하지 않습니다.";
         $("#info").css("color","red");
      }
  
   }
	
/** 회원가입 유효성 검사*/
$(function(){
    $('#registerBtn').click(function(e){ 
    	
          var registerId = $("#registerId").val();
          if(registerId < 1){
               swal({
                    title: '',
                    text: '아이디를 입력해주세요.',
                    type: 'warning',
                    confirmButtonText: '닫기'
                  })
              return false;
            }
    
          if (registerId.length != 9) {
              swal({
                 title : '',
                 text : '아이디를 학번으로 입력해 주세요.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }	
        
          
          if ($('#display').text() == "이미 사용 중입니다.") {
              swal({
                 title : '아이디 중복!',
                 text : '다른 아이디를 입력해주세요.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }
          
          
          var registerPassword = $("#registerPassword").val();
          var repassword = $("#repassword").val();
          if (registerPassword < 1 || repassword < 1) {
               swal({
                  title : '',
                  text : '비밀번호를 입력해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#registerPassword').focus();
               return false;

            }


            if ($('#registerPassword').val() != $('#repassword').val()) {
               swal({
                  title : '비밀번호 불일치',
                  text : '비밀번호를 확인해 주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#registerPassword').focus();
               return false;
            }
            
            
            if ($('#registerPassword').val().length < 8) {
                swal({
                   title : '',
                   text : '비밀번호는 8자 이상이여야합니다.',
                   type : 'warning',
                   confirmButtonText : '닫기'
                })
                $('#registerPassword').focus();
                return false;
             }  
          
          var patternEng = /^[A-za-z]/g;
          var patternKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
          var registerName = $("#registerName").val();
          if(registerName < 1){
              swal({
                   title: '',
                   text: '이름을 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          if(!(patternEng).test(registerName) && !(patternKor).test(registerName)){
              swal({
                   title: '',
                   text: '이름은 한글이나 영문자만 가능합니다.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var registerPhone = $("#registerPhone").val();
          if(registerPhone < 1){
              swal({
                   title: '',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phonepattern = /^\d{3}-\d{3,4}-\d{4}$/;
          var registerPhone = $("#registerPhone").val();
          if(!(phonepattern).test(registerPhone)){
              swal({
                   title: 'EX)010-1234-1234',
                   text: '"-"를 포함해서 입력하세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
         	var h = $(window).height();
         	$('#indexLoding').height(h);
         	$('#indexLoding').show();
		return true;
       });
});


</script>