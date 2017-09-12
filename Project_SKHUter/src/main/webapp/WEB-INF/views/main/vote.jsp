<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<body>
<button class="tablink" onclick="openCity('voted', this, '#40596b')" id="defaultOpen">진행중인 투표</button>
<button class="tablink" onclick="openCity('unvoted', this, '#ff7058')">마감된 투표</button>
<div id="voted" class="tabcontent">
  <h3>진행중인 투표</h3>
  <p>내용 추가예정</p>
</div>

<div id="unvoted" class="tabcontent">
  <h3>마감된 투표</h3>
  <p>내용 추가예정</p> 
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
