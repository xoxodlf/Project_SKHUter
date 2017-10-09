<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* 기타 */
	/* 페이지 제목 : 공지사항 : 가운데 정렬 + 굵게 */
	h1.page-header {
		text-align: center;
		font-weight: bold;
	}
	
	/* 글쓰기+삭제 버튼 한 줄 차지 */
	div.board-btn {
		display: inline-block;
		width: 48%;
	}
	div.board-btns div:nth-child(1) {
		text-align: left;
	}
	div.board-btns div:nth-child(2) {
		text-align: right;
	}
	div.board-btn button {
		width: auto;
		height: auto;
		margin: 0;
	}
.backgroundbox{
	background-color: rgb(224, 224, 224);
	width:80%;
	margin-left: 8.5%;
	height:auto; 
	overflow: hidden;
}
.form-control {
    width: 80%;
    margin-right: 0;
}
</style>
<body> 

<form id="createForm" action="/notice/voteList/registVote" method="post" enctype="multipart/form-data" onsubmit="">

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">투표등록</h1>
	</div>
</div>
<div class="board-btns">
	<div class="board-btn" style="margin-left:8%; margin-bottom:14px;">
		<button type="submit" class="btn btn-default" onmouseover="throwDate()">투표등록</button>
		<button type="button" class="btn btn-default"onclick="goVote();">투표목록</button>
	</div>
</div>
<div class="backgroundbox">
	<div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px; ">
	<input type="hidden" name="userNo" value="${login.userNo}">
          <p style="padding-top:9px;"> 투표제목</p><input name="title" type="text" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"> 투표설명</p><input name="content" type="text" data-text-content="true" class="form-control">
          <p style="display:inline-block; padding-top:9px; width:45.5%; "> 시작 시간</p><p style="display:inline-block; width:45%; padding-top:9px;"> 마감시간</p>
   	<div>
    	<div class="form-group" style="display: inline-block; width: 45%;">
                  <input type="datetime-local" id="sinputdate" class="form-control onlyNumber" style="display: inline-block; width: 45%;">
                  <input type="hidden" id="startDate" name="startDate">
                  <input type="hidden" id="nowDate" name="nowDate">
        </div>
        <div class="form-group" style="display: inline-block; width: 45%;">
                  <input type="datetime-local" id="einputdate" class="form-control onlyNumber" style="display: inline-block; width: 45%;">
                  <input type="hidden" id="endDate" name="endDate">
        </div>
    </div>
    <div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px;padding-bottom: 9px; float:left;width:47%;display: inline-block;">
          <p style="padding-top:9px;"> 항목입력</p><input name="item1" type="text" placeholder="항목1" style="width:98%; color:rgb(97,97,97)" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input name="item2" type="text" placeholder="항목2" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input name="item3" type="text" placeholder="항목3" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input name="item4" type="text" placeholder="항목4" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input name="item5" id="contentvote1"  type="text" placeholder="항목5" style=" display: none; width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input  name="item6" id="contentvote2"  type="text" placeholder="항목6" style="  display: none; width:98%" data-text-content="true" class="form-control">
    </div>
    <div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px;padding-bottom: 9px;padding-top: 25px; float:letf;display: inline-block; width:47%;">
    	
      	<button type="button" onclick="addcontent()" class="btn btn-default btn-lg" style="margin-top:60px; margin-left:22.5%; width:52%;height:5%;">
 				<span class="glyphicon glyphicon-plus"></span>
 				<p style="display:inline-block">항목 추가하기</p>
		</button>
      </div>
    </div>
    
</div>
</form>
<script type="text/javascript">
var today= new Date();
	function goVote() { 
		location.href = "/notice/voteList";
	}
	var is_push=0;
	function addcontent(){
		if(is_push==0){
			contentvote1.style.display="inline";
			is_push=1;
		}else{
			contentvote2.style.display="inline";
		}
	}
	function throwDate(){
		var now = new Date();
        console.log('now');
        var year= now.getFullYear();
        var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
        var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
        var hours = now.getHours()>9 ?''+now.getHours():'0'+now.getHours();
        var min = now.getMinutes()>9 ?''+now.getMinutes():'0'+now.getMinutes();
        var current_date = year + '-' + mon + '-' + day+' '+hours+':'+min;
	       var x =new Date();   //시작날짜
	       x = document.getElementById('sinputdate');
	       var y = document.getElementById('einputdate');   //마감날짜
	       var start =x.value.replace(/T/g, ' ');
	       var end =y.value.replace(/T/g, ' ');
		   $('input#startDate').val(start);
		   $('input#endDate').val(end);
		   $('input#nowDate').val(current_date);
		   console.log(current_date);
		   console.log(start);
	}
	
	
	$('#createForm').submit(function(form) {
        var now = new Date();
        console.log('now');
         var year= now.getFullYear();
         var mon = (now.getMonth()+1)>9 ? ''+(now.getMonth()+1) : '0'+(now.getMonth()+1);
         var day = now.getDate()>9 ? ''+now.getDate() : '0'+now.getDate();
         var current_date = year + '-' + mon + '-' + day;

      var createForm = $(form)[0].target;
      
      if(createForm.title.value.trim().length == 0){
         swal({
                title : '투표 이름을 입력해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
         return false;
      }
      
      
      if(createForm.startDate.value > createForm.endDate.value){
         swal({
                title : '투표 기간을 확인해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
         return false;
      }
      
      if(createForm.startDate.value == createForm.endDate.value){
         swal({
                title : '투표 기간을 확인해주세요!',
                type : 'warning',
                confirmButtonText : '닫기'
                 });
         return false;
      }
      
      if(createForm.nowDate.value > createForm.startDate.value){
          swal({
                 title : '투표 시작 시점을 확인해주세요!',
                 type : 'warning',
                 confirmButtonText : '닫기'
                  });
          return false;
       }
      
      return true;
   });
	
</script>

</body>