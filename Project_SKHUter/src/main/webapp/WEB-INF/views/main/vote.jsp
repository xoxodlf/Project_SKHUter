<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
/* vote css부분입니당*/
.tablink {
	position:relative;
	left:10%;
	top:20px;
    background-color:#555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 40%;
}

.tablink:hover {
    background-color: #777;
}

/* Style the tab content */
.tabcontent {
	position:relative;
	left:10%;
	top:71px;
    color: white;
    display: none;
    padding: 20px;
    width: 80%;
    height: 40%;
    text-align: center;
}
.tabcontentin{
	margin-top:0;
	background-color:#222;
	padding:8%;
}

#voted {background-color:#40596b;}
#unvoted {background-color:#ff7058;}
</style>
<body>
<div style="text-align:center;  font-size:30px;">투 표</div>
<button class="tablink" onclick="openCity('voted', this, '#40596b')" id="defaultOpen">진행중인 투표</button>
<button class="tablink" onclick="openCity('unvoted', this, '#ff7058')">마감된 투표</button>

<div id="voted" class="tabcontent">
<h4>진행중인 투표</h4>
  <div class="tabcontentin">
  <p>내용 추가예정</p>
  </div>
</div>

<div id="unvoted" class="tabcontent">
<h4>마감된 투표</h4>
<div class="tabcontentin"> 
  <p>내용 추가예정</p> 
  </div>
</div>

<script>
function openCity(vote,elmnt,color) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "";
    }
    document.getElementById(vote).style.display = "block";
    elmnt.style.backgroundColor = color;

}
// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>     
</body>
