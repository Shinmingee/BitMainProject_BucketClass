(function () {
	// Function-level strict mode syntax
	'use strict';
}());

function baseUrl(path) {
	const BASE_URL = 'http://localhost:9999';
	return `${BASE_URL}${path}`;
}

function deleteRequest(path) {
	return fetch(baseUrl(path), {
		method: 'DELETE', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer' // no-referrer, *client
	}).then(response => response.json());
}

function getRequest(path) {
	console.log(path);
	return fetch(baseUrl(path), {
		method: 'GET', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer' // no-referrer, *client
	}).then(response => response.json());
}

function patchRequest(path, body = {}) {
	let contentType, data;
	if (typeof body === 'FormData') {
		contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
		data = body;
	} else {
		contentType = 'application/json; charset=UTF-8';
		data = JSON.stringify(body);
	}
	// Default options are marked with *
	return fetch(baseUrl(path), {
		method: 'PATCH', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		headers: {
			'Content-Type': contentType
		},
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer', // no-referrer, *client
		body: data // body data type must match "Content-Type" header
	}).then(response => response.json());
}

function postRequest(path, body = {}) {
	let contentType, data;
	if (typeof body === 'FormData') {
		contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
		data = body;
	} else {
		contentType = 'application/json; charset=UTF-8';
		data = JSON.stringify(body);
		console.log(data, "데이터 전송 성공!!!!!");
	}
	// Default options are marked with *
	return fetch(baseUrl(path), {
		method: 'POST', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		headers: {
			'Content-Type': contentType
		},
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer', // no-referrer, *client
		body: data // body data type must match "Content-Type" header
	}).then(response => response.json());
}

function putRequest(path, body = {}) {
	let contentType, data;
	if (typeof body === 'FormData') {
		contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
		data = body;
	} else {
		contentType = 'application/json; charset=UTF-8';
		data = JSON.stringify(body);
	}
	// Default options are marked with *
	return fetch(baseUrl(path), {
		method: 'PUT', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		// cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
		headers: {
			'Content-Type': contentType
		},
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer', // no-referrer, *client
		body: data // body data type must match "Content-Type" header
	}).then(response => response.json());
}

function postRequest1(path, body) {
	// Default options are marked with *
	return fetch(baseUrl(path), {
		method: 'POST', // *GET, POST, PUT, DELETE, etc.
		// mode: 'cors', // no-cors, cors, *same-origin
		cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
		// credentials: 'same-origin', // include, *same-origin, omit
//        headers: {
//            'Content-Type': 'multipart/form-data'
//        },
		// redirect: 'follow', // manual, *follow, error
		// referrer: 'no-referrer', // no-referrer, *client
		body: body // body data type must match "Content-Type" header
	}).then(response => response.json());
}

function updateProviderProfile(object) {
	return postRequest1('/provider/mypage/update', object);
}

function updateCustomerProfile(object){
	return postRequest1('/customer/mypage/update', object);
}


function loginRequest(credential) {
	return getRequest('/signup');
}

function createTodo(todo) {
	return postRequest("http://localhost:5000/todos", todo);
}

function deleteTodo(id) {
	return deleteRequest(`/todo/${id}`);
}

function listTodo(page = 1, size = 10) {
	return getRequest(`/todo?page=${page}&size=${size}`);
}

function updateTodo(id, todo) {
	return patchRequest(`/todo/${id}`, todo);
}

function toggleTodo(id) {
	return patchRequest(`/todo/${id}/toggle`);
}

function createMember(member) {
	return postRequest('/signup', member);
}

function providerProfile(content){
	return getRequest(content);
}

function emailDuplicateCheck(content){
	return postRequest('/signup/check-email', content);
}

function listService(page = 1, size = 10) {
	return getRequest(`/todo?page=${page}&size=${size}`);
}

function singleService(id) {
	console.log(id+"번째 서비스 페이지를 요청한다");
	return getRequest(`/single-service/${id}`);
}

function searchRequest(searchCondition) {
	return postRequest(`/service-listing`, searchCondition);
}

const Apis = {
		deleteRequest,
		getRequest,
		patchRequest,
		postRequest,
		putRequest,
		loginRequest,
		postRequest1,

		listService,
		singleService,
		searchRequest,

		createMember,
		createTodo,
		deleteTodo,
		listTodo,
		updateTodo,
		toggleTodo,
		
		emailDuplicateCheck,
		providerProfile,
		updateProviderProfile,
		updateCustomerProfile,
};
