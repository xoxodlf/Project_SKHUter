<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<style>
.panel.with-nav-tabs .panel-heading{
    padding: 5px 5px 0 5px;
    width:55em;
}
.panel-primary > .panel-heading {
    color: #fff;
    background-color: #40596b;
    border-color: #40596b;
}
.panel.with-nav-tabs .nav-tabs{
	border-bottom: none;
}
.panel.with-nav-tabs .nav-justified{
	margin-bottom: -1px;
}
.with-nav-tabs.panel-primary .nav-tabs > li > a,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
    color: #fff;
}
.with-nav-tabs.panel-primary .nav-tabs > .open > a,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
.with-nav-tabs.panel-primary .nav-tabs > li > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li > a:focus {
	color: #fff;
	background-color: #2A0066;
	border-color: #2A0066;
}
.with-nav-tabs.panel-primary .nav-tabs > li.active > a,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:hover,
.with-nav-tabs.panel-primary .nav-tabs > li.active > a:focus {
	color: #428bca;
	background-color: #fff;
	border-color: #428bca;
	border-bottom-color: transparent;
}
.panel-body{
	height:25em;
}
div.board-btn button {
		width: auto;
		height: auto;
		margin: 0;
	}
	div.board-btn {
		display: inline-block;
		width: 48%;
	}
	div.board-btns div:nth-child(1) {
		text-align: right;
	}
	div.board-btns div:nth-child(2) {
		text-align: left;
	}
</style>

</head>
<body>
<div class="container">
    <div class="page-header">
        <h1 style="text-align:center;">투표<span class="pull-right label label-default"></span></h1>
    </div>
     <div class="col-md-6" style="width:57.25em; margin-left:14.6%;">
            <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                        <ul class="nav nav-tabs" style="background-color:#40596b">
                            <li class="active"><a style="width:27em; font-weight:bold; text-align:center;" href="#tab1primary" data-toggle="tab">진행중인 투표</a></li>
                            <li><a style="font-weight:bold; width:27em;text-align:center;" href="#tab2primary" data-toggle="tab">종료된 투표</a></li>
                                </ul>
                            </li>
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary">
                        	<div class="alert alert-warning ">
                           		<a data-toggle="modal" data-target="#doVoteModal" class="alert-link"> 과연 꼴뚜기보다 오징어가 맛있을까요???</a>.
                        	</div>
                        <div class="alert alert-warning ">
                           		<a data-toggle="modal" data-target="#doneVoteModal" class="alert-link"> 과연 꼴뚜기보다 오징어가 맛있을까요???</a>.
                        	</div>
                        </div> 
                        <div class="tab-pane fade" id="tab2primary">Primary 2</div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="board-btns">
			<div class="board-btn" onclick="goVoteForm();">
				<button type="button" class="btn btn-default">투표등록</button>
			</div>
		<div class="board-btn">
				<button type="button" class="btn btn-default">투표삭제</button>
		</div>
</div>
        
    <!-- Modal -->
	<jsp:include page="include/doVoteModal.jsp" />
	<jsp:include page="include/doneVoteModal.jsp" />
	<script type="text/javascript">
		function goVoteForm() {
			location.href = "/vote/voteForm";
		}
	</script>
</body>


