/**
 * 이크립스 javascript 파일에서 semi-dolon expected 에러가 발생 해결
 * -이클립스 종료후 {에러 발생한 wrokspace}\.metadata\.plugins\org.elipse.core.resouces\.projects\{project name}이동
 * - 해당 경로에 .markers 파일을 삭제후 이클립스 재시작
 * 
 */

const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
const reName  = /^[가-힣]{2,10}$/ ;
const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;


//유효성 검사에 사용할 상태변수
let isUidOk = false;
let isPassOk = false;
let isNameOk = false;
let isNickOk = false;
let isEmailOk = false;
let isHpOk = false;




window.onload = function(){
	
	const btncheckUid= document.getElementById("btncheckUid");
	const btnSendEmail= document.getElementById("btnSendEmail");
	const btnAuthEmail= document.getElementById("btnAuthEmailCode");
	const registerForm = document.getElementsByTagName('form')[0];
	const resultId = document.getElementsByClassName("resultId")[0];	
	const resultPass = document.getElementsByClassName("resultPass")[0];
	const resultName = document.getElementsByClassName("resultName")[0];
	const resultNick = document.getElementsByClassName("resultNick")[0];
	const resultEmail = document.getElementsByClassName("resultEmail")[0];
	const auth = document.getElementsByClassName("auth")[0];
	const resultHp = document.getElementsByClassName("resultHp")[0];
	
	

	btncheckUid.onclick = function(){
		alert('click');
		const value = registerForm.uid.value; 
		//1.아이디 유효성 검사
		if(!value.match(reUid)){
			resultId.innerText = '아이디가 유효하지 않습니다.';
			resultId.style.color='red';
			return;
		}
	
		//중복체크
		fetch('/jboard/user/checkUser.do?type=uid&value='+value)
			.then(resp => resp.json())
			.then(data => {
				
				console.log(data);
				
				if(data.result >0){
					resultId.innerText = '이미 사용중인 아이디 입니다.';
					resultId.style.color='red';
					isUidOk=false;

				}else{
					resultId.innerText='사용 가능한 아이디 입니다.';
					resultId.style.color='green';
					isUidOk=true;
				}
				

			}).catch(err =>{
				
				console.log(err);
				
			})/* 중복체크 끝 */
			
			
		
		
		
		
	}/* btncheckUid end */
	
	
	
	
	
	
	//비밀번호 일치 검사
	//해당 input에서 빠져나올때 일어나는 이벤트 
	registerForm.pass2.addEventListener('focusout',function(){
		
		const pass1 = registerForm.pass1.value;
		const pass2 = registerForm.pass2.value;
		//2. 비밀번호 유효성 검사  
		if(!pass1.match(rePass)){
			resultPass.innerText='비밀번호가 유효하지 않습니다.';
			resultPass.style.color='red';
			return;
		}
		
		
		
		if(pass1 == pass2){
			resultPass.innerText='비밀번호가 일치합니다.';
			resultPass.style.color='green';
			isPassOk=true;
		}else{
			resultPass.innerText='비밀번호가 일치하지 않습니다.';
			resultPass.style.color='red';
			isPassOk=false;

		}
		
	});  /*비밀번호 이벤트 종료  */
	
	//3. 이름 유효성 검사 
	
	registerForm.name.addEventListener('focusout',function(){
		
		const name= registerForm.name.value;
		
		console.log(name);
		if(!name.match(reName)){
			resultName.innerText = '이름 형식에 맞지 않습니다.';
			resultName.style.color='red';	
			isNameOk= false;
			return;
		}else{
			resultName.innerText="";
			isNameOk= true;
		}
		
	})/*이름 유효성 검사 끝*/
	
	
	registerForm.nick.addEventListener('focusout',function(){
			
			const value= registerForm.nick.value;
			
			console.log(value);
			
			if(!value.match(reNick)){
				resultNick.innerText='유효하지 않습니다.'
				resultNick.style.color='red';
				isNickOk  = false;
				return;
			}else{
				resultNick.innerText="";
			}
			
			//중복확인
			fetch('/jboard/user/checkUser.do?type=nick&value='+value)
				.then(resp => resp.json())
				.then(data=>{
					console.log(data);
					if(data.result > 0 ){
						resultNick.innerText='이미 사용중인 별명입니다.';
						resultNick.style.color='red';
						isNickOk=false;

					}else{
						resultNick.innerText='사용 가능한 별명입니다.';
						resultNick.style.color='green';
						isNickOk=true;
					}
				}).catch(err =>{
					
					console.log(err);
					
				})
			
			
		})/*별명 유효성 검사 끝*/
	
	
		
		/* 이메딜 유효성 검사*/
		
		let preventDbclick=false;
		btnSendEmail.onclick = async function(){
		
		
			
			const email = registerForm.email.value;
			
			console.log("here1")
			
			//이중 클릭 방지
			if(preventDbclick){
				return;
			}
			if(!email.match(reEmail)){
				resultEmail.innerText= "유효한 이메일이 아닙니다."
				resultEmail.style.color='red';
				return;
			}
			
			
			try{
				preventDbclick=true;
				console.log("here3")

				const response = await fetch('/jboard/user/checkUser.do?type=email&value='+email);
				const data = await response.json();
				console.log(data);
				
				if(data.result>0){
					resultEmail.innerText='이미 존재하는 이메일입니다.';
					resultEmail.style.color='red';
					preventDbclick=false;
					return;
				}else{
					resultEmail.innerText = '이메일을 인증코드를 확인하세요.';
					resultEmail.style.color='green';
					auth.style.display = 'block';
					
					
				}
				
			}catch(e){
				console.log(e);
			}
			
		
			
		}/* 이메딜 유효성 검사 끝 */
		

		btnAuthEmail.onclick = function(){
			
			const code = registerForm.auth.value;
			
			fetch('/jboard/user/checkUser.do', {
					method: 'POST',
					body: JSON.stringify({"code":code})
				})
				.then(resp => resp.json())
				.then(data => {
					console.log(data);
					
					if(data.result > 0){
						resultEmail.innerText = '이메일이 인증되었습니다.';
						resultEmail.style.color = 'green';
						isEmailOk=true;

					}else{
						resultEmail.innerText = '유효한 인증코드가 않습니다.';
						resultEmail.style.color = 'red';
						isEmailOk=false;

					}
					
				})
				.catch(err => {
					console.log(err);
				});
			
			
		}
		
		
		/*휴대폰 유효성 검사  */
		registerForm.hp.addEventListener('focusout',async function(){
		
			const hp = registerForm.hp.value;
			
			try{
				const response = await fetch('/jboard/user/checkUser.do?type=hp&value='+hp);
				const data = await response.json();
				
				console.log(data);
				
				if(data.result>0){
					resultHp.innerText='이미 사용중인 휴대폰번호 입니다.';
					resultHp.style.color='red';
					isHpOk=false;

				}else{
					resultHp.innerText='';
					isHpOk=true;
				}
				
			}catch(err){
				console.log(err);
			}
			
		})
		
		
		
		//죄종 폼 전송 유효성 검사
		registerForm.onsubmit = function(){
			
			//아이디 유효성 검사 완료 여부
			if(!isUidOk){
				alert('아이디가 유효하지 않습니다.');
				return false;
			}
			
			//비밀번호 유효성 검사 완료 여부
			if(!isPassOk){
				alert('비밀번호가 유효하지 않습니다.');
				return false;
			}
			//이름 유효성 검사 완료 여부
			if(!isNameOk){
				alert('이름이 유효하지 않습니다.');
				return false;
			}
			//별명 유효성 검사 완료 여부
			if(!isNickOk){
				alert('별명이 유효하지 않습니다.');
				return false;
			}
			//이메일 유효성 검사 완료 여부
			if(!isEmailOk){
				alert('이메일이 유효하지 않습니다.');
				return false;
			}
			//휴대폰 유효성 검사 완료 여부
			if(!isHpOk){
				alert('휴대폰 번호가 유효하지 않습니다.');
				return false;
			}
			return true;
		}
	
	
}