<!--  
 *
 * 회원 정보 수정 모달페이지
 *
 * @파일명 : tile/modifyModal.jsp
 * @작성자 : 이종윤
 * @작성일 : 2017. 9. 22. 
-->

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  prefix="m" uri="urlDecode"%> 

<style>
.regist_label {
 font-size: 13px;
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


<script>
/** 정보 수정 완료 alert */
$(function(){
var message = $('#modifySuccess').val();
if (message == 'votesuccess') {
	swal(     
     		 '',
     	     '투표를 등록하였습니다.',
     	     'success'
     		)
}
});


</script> 

<!-- Modal -->
<input type="hidden" id="modifySuccess" value="${message}">
<input type="hidden" id="deleteSuccess" value="${message2}">
<input type="hidden" id="userNo" value="${login.userNo}">

<form action="/user/modify" method="post" enctype="multipart/form-data">
<div class="modal fade" id="modifyModal" role="dialog">
	<div class="modal-dialog" style="width: 35%">

		<!-- Modal content-->
		<div class="modal-content">

			<div class="modal-header" style="background: #40596b;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h2 class="regist_label" style="font-weight: bolder; color: white; font-size: 20px; text-align: center;">회원 정보 수정</h2>
			</div>

			<div class="modal-body" style="margin-left: 10%">
				<div class="row">
					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="id" class="regist_label">아이디</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="text" class="form-control onlyNumber" id="modifyId" name="id" value="${login.id}"  readonly>
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label for="pw" class="regist_label">비밀번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력하세요" >
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
							<input type="password" class="form-control" id="repassword" name="repassword" placeholder="비밀번호를 한 번 더 입력하세요" onkeyup="passwdCheck()">
						</div>
                        <div class="col-xs-3 col-sm-3" style="font-size:small">
                          <label id="info"></label>
                        </div>            
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">이름</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="text" class="form-control" id="modifyName" name="name" value="${m:urlDecode(cookie.CookieForUser.value)}" placeholder="이름을 입력하세요" />
						</div>
						<div class="clearfix"></div>
					</div>

					<div class="form-group">
						<div class="col-xs-3 col-sm-3 text-center">
							<label class="regist_label">휴대폰 번호</label>
						</div>
						<div class="col-xs-6 col-sm-6">
							<input type="tel" class="form-control placeholder" id="modifyPhone" name="phone" placeholder="휴대폰 번호를 입력하세요" />
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
								<option value="1"> 재학 </option>
								<option value="0"> 휴학 </option>
							</select>
						</div>
						<div class="clearfix"></div>
					</div>

				</div>
				<br>
			</div>
 
			<div class="modal-footer">
				<div class="row">
					<div class="col-xs-2 col-xs-offset-3">
						<button type="submit" id="modifyBtn"class="btn btn-warning" style="width: 100%; font-size: 15px; font-weight: bold;">수정</button>
					</div>
					<div class="col-xs-2">
						<button type="button" id="deleteBtn" class="btn btn-danger" data-dismiss="modal" style="width: 100%; font-size: 15px;">탈퇴</button>
					</div>
					<div class="col-xs-2">
						<button type="button" class="btn btn-default" data-dismiss="modal" style="width: 100%; font-size: 15px; font-weight: bold; ">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<script>

/** 비밀번호 일치 체크*/
function passwdCheck() {
    var password = $('#password').val();
    var repassword = $('#repassword').val();
    var passwdText = document.getElementById("info");
    if (password == repassword) {
       passwdText.innerHTML = "비밀번호가 일치합니다.";
       $("#info").css("color","blue");
    } else {
       passwdText.innerHTML = "비밀번호가 일치하지 않습니다.";
       $("#info").css("color","red");
    }

 }
 
 /** 정보 수정 유효성 검사*/
$(function(){
    $('#modifyBtn').click(function(e){ 
          var password = $("#password").val();
          var repassword = $("#repassword").val();
          if (password < 1
                  || repassword < 1) {
               swal({
                  title : '',
                  text : '비밀번호를 입력해주세요.',
                  type : 'warning',
                  confirmButtonText : '닫기'
               })
               $('#password').focus();
               return false;

            }


          if ($('#password').val() != $('#repassword').val()) {
              swal({
                 title : '비밀번호 불일치',
                 text : '비밀번호를 확인해 주세요.',
                 type : 'warning',
                 confirmButtonText : '닫기'
              })
              $('#registerPassword').focus();
              return false;
           }
            
            
            if ($('#password').val().length < 4) {
                swal({
                   title : '',
                   text : '비밀번호는 4자 이상이여야합니다.',
                   type : 'warning',
                   confirmButtonText : '닫기'
                })
                $('#password').focus();
                return false;
             }  
          
          var patternEng = /^[A-za-z]/g;
          var patternKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g;
          var name = $("#modifyName").val();
          if(name < 1){
              swal({
                   title: '',
                   text: '이름을 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          if(!(patternEng).test(name) && !(patternKor).test(name)){
              swal({
                   title: '',
                   text: '이름은 한글이나 영문자만 가능합니다.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phone = $("#modifyPhone").val();
          if(phone < 1){
              swal({
                   title: '',
                   text: '전화번호를 입력해주세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }
          
          var phonepattern = /^\d{3}-\d{3,4}-\d{4}$/;
          var phone = $("#modifyPhone").val();
          if(!(phonepattern).test(phone)){
              swal({
                   title: 'EX)010-1234-1234',
                   text: '"-"를 포함해서 입력하세요.',
                   type: 'warning',
                   confirmButtonText: '닫기'
                 })
             return false;
           }	
		return true;
	
       });

});

/** 회원 탈퇴 */
$(function() {
   $('#deleteBtn').on('click', function() {
        var userNo = $('#userNo').val();
	    var password = $('#password').val();
	    $('#password').val("");
	    var repassword = $('#repassword').val();
	    $('#repassword').val("");
	    
        if (password < 1 || repassword < 1) {
             swal({
                title : '',
                text : '비밀번호를 입력해주세요.',
                type : 'warning',
                confirmButtonText : '닫기'
             })
             $('#password').focus();
             return false;

          }
	    
        if ($('#password').val() != $('#repassword').val()) {
            swal({
               title : '비밀번호 불일치',
               text : '비밀번호를 확인해주세요.',
               type : 'warning',
               confirmButtonText : '닫기'
            })
            $('#password').focus();
            return false;
         }
        
      	 swal({
               title: '탈퇴 하시겠습니까?',
               text: "",
               type: 'warning',
               showCancelButton: true,
               confirmButtonColor: '#3085d6',
               cancelButtonColor: '#d33',
               confirmButtonText: 'YES',
               cancelButtonText: 'NO'
            }).then(function () {

                $.ajax({
                   type : 'GET',
                   url : "/user/delete",
                   data : {
                  	 
                   	userNo : userNo,
                   	password: password,
                   	repassword: repassword
                   	
                   },
                   success : function(request) {
                    if (request == 'fail') {
                  	  swal('', '가입한 비밀번호가 아닙니다!', 'warning')
                        return false;
                  	  
                    } else if(request == 'statusFail') {
                    	swal('', '회장단은 탈퇴할 수 없습니다!', 'warning')
                        return false;
                    } else{
        				swal('탈퇴 완료!','같은 아이디로 재가입 하실 수 없습니다.','success').then(function () {
                  			location.href = "/";
          				})
                	  
                      }
                   }
                });
            	
             })
   });
});

</script>