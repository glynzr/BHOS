// pulling text from TEXT file
document.getElementById('button1').addEventListener('click', getText);
// pulling text from JSON file
document.getElementById('button2').addEventListener('click', getJson);
// pulling text from external API
document.getElementById('button3').addEventListener('click', getApi);

// posting data to API
document.getElementById('addPost').addEventListener('submit', addPost);

// pulling text from TEXT file
function getText() {
	//console.log('text file will be here')
	fetch('text.txt')
		.then(function(res){
			return res.text()
		})
		.then(function(data){
			console.log(data);
			document.getElementById('output').innerHTML = data;
		})
		.catch(function(err){
			console.log(err);
		});
}

// pulling data from JSON file
function getJson() {
	fetch('post.json')
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			// lets grab json data using loop
			jsonData = "";
			data.forEach(function(element){
				//console.log(element);
				jsonData += `<li><b>${element.title}</b>. ${element.body}</li>`;
			});
			document.getElementById('output').innerHTML = jsonData;
		})
		.catch(function(err){
			console.log(err);
		});
}

// pulling data from External API
function getApi() {
	fetch('https://jsonplaceholder.typicode.com/posts')
		.then(function(res){
			return res.json()
		})
		.then(function(data){
			console.log(data);
			// lets grab json data using loop
			apiData = "";
			data.forEach(function(post, index){
				console.log(post);
				apiData += `<h4>${index+1} ${post.title}</h4> <p>${post.body}</p>`;
			});
			document.getElementById('output').innerHTML = apiData;
		})
		.catch(function(err){
			console.log(err);
		});
}

// posting data to external API
function addPost(e){
	e.preventDefault();

	let title = document.getElementById('title').value;
	let body = document.getElementById('body').value;

	fetch('https://jsonplaceholder.typicode.com/posts', {
		method: 'POST',
		headers: {
			'Accept': 'application/json, text/plain, */*',
			'Content-type': 'application/json',
			'Origin': 'http://localhost:3000'
		},
		body: JSON.stringify({title: title, body: body})
	})
	.then((res) => res.json())
	.then((data) => console.log(data));
}