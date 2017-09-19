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

#accountingModal label {
  font-family: 'LotteMartDream'; 
}

</style>


<!-- Modal -->
<form action="/user/register" method="post" enctype="multipart/form-data" onsubmit="">
<div class="modal fade" id="doMeetingModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">회의록 등록</h2>
			</div>

			<div class="modal-body">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">제목</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="email" class="form-control onlyNumber" id="registerId" name="id" placeholder="블라블라" maxlength="30" onkeyup="idCheck()">
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">파일 첨부</label>
						</div>
						<div class="col-xs-6 col-sm-6 ">
							<div class="form-group">
                                            <input type="file">
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
   	  var emailpattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
      var registerId = $('#registerId').val();
      
      if (registerId.length > 3) {

         $.ajax({
            type : 'GET',
            url : "/user/idCheck",
            data : {
            	
            	registerId : registerId

            },
            success : function(request) {
               var display = document.getElementById("display");
               if (request == "success") {
                  display.innerHTML = "사용가능합니다.";
                  $("#display").css("color", "blue");
               } else if (request == "fail") {
                  display.innerHTML = "이미 사용중입니다.";
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
         passwdText.innerHTML = "비밀번호가 일치합니다.";
         $("#info").css("color","blue");
      } else {
         passwdText.innerHTML = "비밀번호가 일치하지 않습니다.";
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
    
          if (registerId.length < 4) {
              swal({
                 title : '',
                 text : '아이디는 4자 이상이여야합니다.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }	

          var emailpattern = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
          if(!(emailpattern).test(registerId)){
      		swal({
                  title: 'email 형식으로 입력하세요.',
                  text: 'EX) asc@gmail.com',
                  type: 'warning',
                  confirmButtonText: '닫기'
                })
            return false;
      	};
          
          
          if ($('#display').text() == "이미 사용중인 아이디입니다.") {
              swal({
                 title : '아이디 중복',
                 text : '다른 아이디를 입력해주세요.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerId').focus();
              return false;
           }
          
          
          var registerPassword = $("#registerPassword").val();
          var repassword = $("#repassword").val();
          if (registerPassword < 1
                  || repassword < 1) {
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
                  text : '비밀번호를 확인해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#registerPassword').focus();
               return false;
            }
            
            
            if ($('#registerPassword').val().length < 4) {
                swal({
                   title : '',
                   text : '비밀번호는 4자 이상이여야합니다.',
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