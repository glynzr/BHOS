// Repo : https://github.com/axios/axios

// GET
//document.getElementById('button1').addEventListener('click', getTodos);
// POST
document.getElementById('button2').addEventListener('click', addTodo);
// PUT/PATCH
document.getElementById('button3').addEventListener('click', updateTodo);


// using GET request
/*
function getTodos(){
    //axios.get('https://jsonplaceholder.typicode.com/todos')
    axios({
        method: 'get',
        url: 'https://jsonplaceholder.typicode.com/todos'
    })
    .then((response) => {
      // handle success
      //console.log(response);
      return response.data;
    })
    .then((allusers) => {
        console.log(allusers);
        output = '';
        allusers.forEach(post => {
            //console.log(post.title);
            output += `<p> ${post.title} </p>`
        });
        document.getElementById('output').innerHTML = output;
    })
    .catch((error) => {
      // handle error
      console.log(error);
    });
}
*/

// get, using ASYNC AWAIT function
/*
async function getTodos() {
    try {
      const response = await axios.get('https://jsonplaceholder.typicode.com/todos');
      console.log(response);
      // lets continue
      const allposts = await response.data;
      output = '';
      allposts.forEach(post => {
          //console.log(post.title);
          output += `<p> ${post.title} </p>`
      });
      document.getElementById('output').innerHTML = output;
    } catch (error) {
      console.error(error);
    }
}
*/

// using POST
function addTodo(){
    axios({
        method: 'post',
        url: 'https://jsonplaceholder.typicode.com/todos',
        data: {title: 'New Todo', completed: false}
    })
    .then( (response) => {
        console.log(response.data);
        document.getElementById('output').innerText = JSON.stringify(response.data);
    })
    .catch((error) => {
        // handle error
        console.log(error);
      });
}


// using PUT/PATCH
function updateTodo(){

}