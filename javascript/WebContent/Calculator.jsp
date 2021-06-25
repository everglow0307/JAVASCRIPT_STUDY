<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<style>
	/*label{
		float: left;
		width: 80px;
	}*/
	/*input, label{
		display:block;
		margin-bottom:10px;
	}*/
	
	caption{font-size:32px;}
	table{width:320px;}
	table, th{background: #333;}
	th{
		padding-right: 10px;
		height:80px;
	}
	td{
		height: 75px;
		text-align:center;
	}
	th > input{
		width: 100%;
		border: none;
		background: #333; color: white;
		text-align: right; font-size: 48px;
	}
	td > input[type="button"]{
		width: 100%; height: inherit;
		color: #333; font-size: 36px;
		border: none;
	}
	
	
</style>
</head>
<body>
	
	<form name="cal">
		<table>
			<caption>계산기</caption>
			<tr>
				<th colspan="4"><input type="text" name="result" value="0"></th>
			</tr>
			<tr>
				<td><input type="button" value="7"></td>
				<td><input type="button" value="8"></td>
				<td><input type="button" value="9"></td>
				<td><input type="button" value="+"></td>
			</tr>
			<tr>
				<td><input type="button" value="4"></td>
				<td><input type="button" value="5"></td>
				<td><input type="button" value="6"></td>
				<td><input type="button" value="-"></td>
			</tr>
			<tr>
				<td><input type="button" value="1"></td>
				<td><input type="button" value="2"></td>
				<td><input type="button" value="3"></td>
				<td><input type="button" value="*"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="0"></td>
				<td><input type="button" value="%"></td>
				<td><input type="button" value="/"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" class="cls_btn" value="clear"></td>
				<td colspan="2"><input type="button" class="result_btn" value="="></td>
			</tr>
		</table>
	</form>
	<script>
		//form요소에 접근하는 방식
		//1. document.formName.typeName.속성
		//2. document.forms['formname']['typename'].속성
	
		let inp = document.forms['cal'];
		let input = inp.getElementsByTagName('input');
		let cls_btn = document.getElementsByClassName("cls_btn")[0];
		let result_btn = document.getElementsByClassName("result_btn")[0];
		
		//숫자 및 사칙 연산 버튼 이벤트 바인딩===================================================
		for(let i = 0; i < input.length ; i++){
			// 숫자와 사칙 연산자만 입력 처리
			if(input[i].value != '=' && input[i].value != "clear"){
				input[i].onclick = function(){
					calc(this.value);
				}
			}//end if
		}//end for
		
		//초기화 버튼====================================================================
		cls_btn.onclick = function(){
			clr();
		}
		//결과 버튼 ====================================================================
		result_btn.onclick = function(){
			try{
				my_result();
			}catch(err){
				let result = inp['result'];
				result.value = '입력 오류';
			}
		}
		
		//계산 결과 처리 함수===============================================================
		function my_result(){
			let result = document.forms['cal']['result'];
			
			//eval()은 입력된 문자열(result.value 값)을 그대로 명령어로 처리할 수 있게 해줌.
			var calc = eval(result.value);
			
			//결과창에 표시
			inp['result'].value = calc;
		}
		
		//계산기 입력 처리 함수==============================================================
		function calc(value){
			//입력이 들어가면 0을 지움
			if(inp['result'].value==0){
				inp['result'].value='';
			}
			
			//입력 값을 결과에 출력
			inp['result'].value += value;
		}
		
		//계산기 초기화==================================================================
		function clr(){
			inp['result'].value=0;
		}
	</script>
</body>
</html>