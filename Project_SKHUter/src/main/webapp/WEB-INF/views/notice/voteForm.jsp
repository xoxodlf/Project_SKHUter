<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">투표등록</h1>
	</div>
</div>
<div class="board-btns">
	<div class="board-btn" style="margin-left:8%; margin-bottom:14px;">
		<button type="button" class="btn btn-default">투표등록</button>
		<button type="button" class="btn btn-default"onclick="goVote();">투표목록</button>
	</div>
</div>
<div class="backgroundbox">
	<div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px; ">
          <p style="padding-top:9px;"> 투표제목</p><input type="text" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"> 마감시간</p>
   		<div>
    	<select class="form-control" style="width:16%; display: inline-block;">
       		<option>2017</option>
        	<option>2018</option>
        	<option>2019</option>
        	<option>2020</option>
        	<option>2021</option>
        	<option>2022</option>
        	<option>2023</option>
        	<option>2024</option>
      	</select>년
      	
      	<select class="form-control" style="width:13%; display: inline-block;">
       		<option>1</option>
        	<option>2</option>
        	<option>3</option>
        	<option>4</option>
        	<option>5</option>
        	<option>6</option>
        	<option>7</option>
        	<option>8</option>
        	<option>9</option>
        	<option>10</option>
        	<option>11</option>
        	<option>12</option>
      	</select>월
      	<select class="form-control" style="width:13%; display: inline-block;">
       		<option>1</option>
        	<option>2</option>
        	<option>3</option>
        	<option>4</option>
        	<option>5</option>
        	<option>6</option>
        	<option>7</option>
        	<option>8</option>
        	<option>9</option>
        	<option>10</option>
        	<option>11</option>
        	<option>12</option>
        	<option>13</option>
        	<option>14</option>
        	<option>15</option>
        	<option>16</option>
        	<option>17</option>
        	<option>18</option>
        	<option>19</option>
        	<option>20</option>
        	<option>21</option>
        	<option>22</option>
        	<option>23</option>
        	<option>24</option>
        	<option>25</option>
        	<option>26</option>
        	<option>27</option>
        	<option>28</option>
        	<option>29</option>
        	<option>30</option>
      	</select>일
      	<select class="form-control" style="width:13%; display: inline-block;">
       		<option>0</option>
       		<option>1</option>
        	<option>2</option>
        	<option>3</option>
        	<option>4</option>
        	<option>5</option>
        	<option>6</option>
        	<option>7</option>
        	<option>8</option>
        	<option>9</option>
        	<option>10</option>
        	<option>11</option>
        	<option>12</option>
        	<option>13</option>
        	<option>14</option>
        	<option>15</option>
        	<option>16</option>
        	<option>17</option>
        	<option>18</option>
        	<option>19</option>
        	<option>20</option>
        	<option>21</option>
        	<option>22</option>
        	<option>23</option>
      	</select>시
      	<select class="form-control" style="width:13%; display: inline-block;">
       		<option>00</option>
       		<option>10</option>
        	<option>20</option>
        	<option>30</option>
        	<option>40</option>
        	<option>50</option>
      	</select>분&nbsp까지
    </div>
    <div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px;padding-bottom: 9px; float:left;width:47%;display: inline-block;">
          <p style="padding-top:9px;"> 항목입력</p><input type="text" value="항목1" style="width:98%; color:rgb(97,97,97)" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input type="text" value="항목2" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input type="text" value="항목3" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input type="text" value="항목4" style="width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input id="contentvote1"  type="text" value="항목5" style=" display: none; width:98%" data-text-content="true" class="form-control">
          <p style="padding-top:9px;"></p><input id="contentvote2"  type="text" value="항목6" style="  display: none; width:98%" data-text-content="true" class="form-control">
    </div>
    <div class="form-group" style=" font-weight:bold; margin-left:2%;margin-top:2px;padding-bottom: 9px;padding-top: 25px; float:letf;display: inline-block; width:47%;">
    	
      	<div>
      		<div class="checkbox">
      			<label style="font-size:20px; margin-left:34%;"><input type="checkbox" value="" style=" height:20px;">복수선택 여부</label>
   			</div>
    		<div class="checkbox" style="margin-top:10px;">
      			<label style="font-size:20px; margin-left:34%;"><input type="checkbox" value="" style=" height:20px;">익명투표 여부</label>
    		</div>
      	</div>
      	
      	<button type="button" onclick="addcontent()" class="btn btn-default btn-lg" style="margin-top:10px; margin-left:22.5%; width:52%;height:5%;">
 				<span class="glyphicon glyphicon-plus"></span>
 				<p style="display:inline-block">항목 추가하기</p>
		</button>
      	
      </div>
    </div>
    
</div>

<script type="text/javascript">
	function goVote() { 
		location.href = "/vote/";
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
</script>

</body>

