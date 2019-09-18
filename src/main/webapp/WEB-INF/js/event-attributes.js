//추천되지 않는 예전 방식

// function checkUsername(){
	// var elMsg = document.getElementById('feedback');
	// var elUsername = document.getElementById('username');
	// if(elUsername.value.length < 4){
		// elMsg.textContent = '이름은 다섯 글자 이상이어야 합니다.';
	// }else{
		// elMsg.textContent = '';
	// }
// }

//개선된 방식1
// function checkUsername(){
	// var elMsg = document.getElementById('feedback');
	// if(this.value.length < 5){
		// elMsg.textContent = 'Username must be 5 characters or more';
	// }else{
		// elMsg.textContent = '';
	// }
// }
// var el = document.getElementById('username');
// el.addEventListener('blur',checkUsername, false);

//개선된 방식2
document.getElementById('username').addEventListener('blur', function(){
	var elMsg = document.getElementById('feedback');
	if(this.value.length < 5){
		elMsg.textContent = '이름은 다섯 글자 이상이어야 합니다.';
	}else{
		elMsg.textContent = '';
	}
}, false);