// Simulation: Imagine we are dealing with the posts from server-side
/*
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

// creating posts, which will delay 2 seconds
function createPosts(post){
    setTimeout(  () => {
        posts.push(post);
    }, 2000);
}

// calling functions
createPosts({ title: 'Post Three', body: 'This is post Three'});
getPosts();
*/

// Problem: Post loaded before the create post. How to solve the problem?
// using CALLBACKS 
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

// creating posts, which will delay 2 seconds. second parameter will be callback
// you can use any name instead of callback, but this is common practice!
function createPosts(post, callback){
    setTimeout(  () => {
        posts.push(post);
        // calling callback function
        callback();
    }, 2000);
}

// calling createPosts function, and second parameter will getPosts function
createPosts({ title: 'Post Three', body: 'This is post Three'}, getPosts);