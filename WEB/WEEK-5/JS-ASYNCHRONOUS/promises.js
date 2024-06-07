// Problem: Post loaded before the create post. How to solve the problem?
// using PROMISES 
posts = [
    { title: 'Post One', body: 'This is post One' },
    { title: 'Post Two', body: 'This is post Two' }
];

// getting posts from server, with 1 second delay
function getPosts(){
    setTimeout( () => {
        let output = '';
        posts.forEach( (post, index) => {
            output += `<li> ${post.title} </li>`;
        });
        document.querySelector('div').innerHTML = output;
    }, 1000 );
}

// creating posts, which will delay 2 seconds.
function createPosts(post){
    // we'll return a Promise
    return new Promise( (resolve, reject) => {
        setTimeout( () => {
            posts.push(post);

            const error = false;
            // if success resolve, if not reject
            if(!error){
                resolve();
            }else{
                reject('Error: something wrong!');
            }
        }, 2000);
    });
}

// call function with .then
// Single Promise ---------------------------------------------------------
/*
createPosts({ title: 'Post Three', body: 'This is post Three'})
    .then(getPosts)
    .catch(err => console.log(err));
*/


// ASYNCH AWAIT METHOD ----------------------------------------------------
// before running getPosts function, wait for createPosts function
async function init(){
    await(createPosts({ title: 'Post Three', body: 'This is post Three'}));
    getPosts();
}
init();


// ASYNCH AWAIT with FETCH ------------------------------------------------
async function fetchUsers(){
    const res  = await fetch('https://jsonplaceholder.typicode.com/users');
    const data = await res.json();
    console.log(data);
}
fetchUsers();


// Multi Promises: Promise.all 
/*
const promise1 = Promise.resolve('hello world!');
const promise2 = 10;
const promise3 = new Promise( (resolve, reject) => {
    setTimeout(resolve, 2000, 'Goodbye')
});
// the last promise from : https://jsonplaceholder.typicode.com/users
//const promise4 = fetch('https://jsonplaceholder.typicode.com/users');
const promise4 = fetch('https://jsonplaceholder.typicode.com/users').then(
    res => res.json()
);

Promise.all([promise1, promise2, promise3, promise4])
    .then(values => console.log(values));
*/