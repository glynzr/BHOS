// BASIC TASKS --------------------------------------------------------------------

// TASK-1 : Get name and age from user prompt and display them on the page
/*
const nname = prompt('What is your name?: ')
const age = prompt('What is your age?: ')

console.log(nname, age);
const message = `
    <h1>Your credentials: </h1>
    <ul>
        <li> ${nname} </li>
        <li> ${age} </li>
    </ul>
`;
document.write(message);
*/

// TASK-2 : Get name and age from user prompt and append them into an array, after that
// display them on the page

// const nname = prompt('What is your name?: ');
// const age = prompt('What is your age?: ');
const arr1 = []
// traditional way
/*
arr1.push(nname, age);
console.log(arr1);
*/
// like an array of object
/*
arr1.push({'nname':{nname}, 'age':{age}})
console.log(arr1)
*/
// SUBTASK : several users to add: --------------------------------------------------
for(let i = 0; i < 4; i++){
    const nname = prompt('What is your name?: ');
    const age = prompt('What is your age?: ');
    arr1.push({'nname':{nname}, 'age':{age}})
}
console.log(arr1);

// display only user names
arr1.map( (elm)=> {
    return elm.nname;
}).forEach( (el)=> {
    console.log(el.nname)
}); 