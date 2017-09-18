<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#align{
	text-align:center;
}
.posit{
	position: absolute;
    width: 500px;
}
/* 가운데 정렬 */
div.col-lg-12 {
	text-align: center;
}
</style>
<body>
		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<img src="/resources/images/title/meeting_note.png" class="page-header" style="width: 18%;">
				</div>
			</div>
            <div class="row">
            	<div class="col-lg-10">
            		<button type="button" class="btn btn-default">등록</button>
            		<button type="button" class="btn btn-danger">삭제</button>
            	</div>
            </div>
            <!-- /.row -->
            <div class="row" style="margin-top: 20px">
               <div class="col-lg-4">
                  <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit" >
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 나상연
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                     
                  </div>
               </div>
            
                <div class="col-lg-4">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList" class="posit">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 이종윤
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 김희태
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                  </div>
                </div>
                </div>
                <div class="row">
                <!-- /.col-lg-4 -->
                <div class="col-lg-4">
                    <div class="panel panel-info">
                     <div class="panel-heading">
                        	제목
                           <a class="btn btn-default btn-sm removeBtn" id="removeBtn"  style="float: right; padding: 2px 9px;"> 
                              <i class="fa fa-trash-o fa-sm"></i> 
                           </a>
                            <input type="checkbox" class="posit">
                     </div>

                     <div class="panel-body" style="height: 90px">
                        <div class="libraryList">
                           <a href="#" class="thumbnailList"> 
                              		파일 이름
                           </a>
                        </div>
                     </div>
                     
                     <div class="panel-footer">   작성자 : 양태일
                     <a class="btn btn-default btn-sm" id="downloadBtn"  onclick="" style="float: right; padding: 2px 9px;"> 
                           <i class="fa fa-download fa-sm"></i> 
                     </a>
                     </div>
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
            </div>
            <!-- /.row -->
        </div>
</body>