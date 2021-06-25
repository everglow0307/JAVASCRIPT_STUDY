<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#add-btn{
		padding: 5px 10px;
		border: 0;
		background: #f80;
		color:white;
		border-radius:2px;
	}
	
	ul{
		padding: 0;
		list-style-position: inside;
	}
	
	li{
		border-botton:1px solid #999;
		padding: 5px 0
	}
	.active{background:#abc;}
</style>
</head>
<body>
<h1 id="title">할일 목록</h1><hr>
	<button id="add-btn">목록 추가</button>
	
	<ul id="list">
		<li>제목1</li>
		<li>제목2</li>
		<li>제목3</li>
		<li>제목4</li>
	</ul>
<script>
	let title= document.getElementById("title");
	let list = document.getElementById("list");
	let li = list.getElementsByTagName("li");
	let addBtn = document.getElementById("add-btn");
	
	// 이벤트 리스너
	list.addEventListener('click',activeItem);
	
	
	// 이벤트리스터는 정적인 문서 객체만 제어할 수 있기 때문에,
	//동적으로 추가되는 요소는 인식하지 못한다.
	//때문에 event객체의 target.nodeName속성을 이용해야 한다.
	
	//event.target.parentNode 부모노드
	//event.target.children	   자식노드
	//event.target.previousSibling  이전 형제
	//event.target.nextSibling		다음 형제
	
	function activeItem(event){
		//클릭한 노드가 li일 때
		if(event.target.nodeName == 'LI'){
			title.innerHTML = event.target.innerText;
			
		//목록 스타일 초기화	
		for(let i=0;i<event.target.parentNode.children.length;i++){
			event.target.parentNode.children[i].removeAttribute("class");
		}
		
		//클릭한 목록 스타일 지정
		event.target.setAttribute("class","active");
		
		} //end if
	}//end function
	
	//목록 추가
	addBtn.addEventListener('click',function(){
		let text = prompt("제목 입력");
		list.innerHTML += "<li>"+text+"</li>";
	});
	
</script>

</body>
</html>