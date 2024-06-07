// ------------------------------------------------------------------------------------
// ARROW FUNCTIONS --------------------------------------------------------------------
/* 
There’s another very simple and concise syntax for creating functions, that’s often better
than Function Expressions.It’s called “arrow functions”, because it looks like this:

let func = (arg1, arg2, ..., argN) => expression

This creates a function func that accepts arguments arg1..argN, then evaluates 
the expression on the right side with their use and returns its result. In other words,
it’s the shorter version of:

let func = function(arg1, arg2, ..., argN) {
  return expression;
};
/*
function calc(a, b){
    return a * b ;
}
console.log(calc(2,3));
*/
/*
let res = function calc(a, b){
    return a * b ;
}
console.log(res(2,3));
*/
// Apply arrow functions -----------------
/*
let res = (a, b) => {
    return a * b ;
}
console.log(res(2,3));
*/
// Shorter version -----------------------
/*
let res = (a, b) =>  a * b 
console.log(res(2,3));
*/

// ------------------------------------------------------------------------------------
// SCHEDULING FUNCTIONS ---------------------------------------------------------------

// Task-1 : Print out 'hello' message every 1 seconds, stop it after 5 seconds -------- 
/* let timerId = setInterval( () => console.log('hello'), 1000);
// setInterval( () => console.log('hello'), 1000);

let stopit = ()=> clearInterval(timerId)
setTimeout(stopit, 5000);
*/

// TASK-2 : Ask to continue counting or not -------------------------------------------
/*
let timerId = setInterval( () => console.log('hello'), 1000);
let stopit = ()=> {
    let ans = prompt('Ask to continue: ');
    if (ans == 'no') {
        clearInterval(timerId)
    }
}

setTimeout(stopit, 5000);
*/

// ------------------------------------------------------------------------------------
// HIGHER ORDER FUNCTIONS -------------------------------------------------------------
// FOREACH, MAP, FILTER
/*
var pilots = [
    {
      id: 10,
      name: "Poe Dameron",
      years: 14,
    },
    {
      id: 2,
      name: "Temmin 'Snap' Wexley",
      years: 30,
    },
    {
      id: 41,
      name: "Tallissan Lintra",
      years: 16,
    },
    {
      id: 99,
      name: "Ello Asty",
      years: 22,
    }
  ];
*/

// FOREACH : for looping purposes ----------------------------------
/*
pilots.forEach( (pilot)=>{
    console.log(pilot.name);
});
*/
/*
const arr1 = pilots.forEach( (pilot)=>{
    console.log(pilot);
});
*/ 

// MAP : creates new array from existing array --------------------
/*
const res = pilots.map( (pilot)=>{
    return pilot.name;
});
console.log(res);
*/
// after mapping loop new array with foreach
/*
res.forEach(element => {
    console.log(element);
});
*/

// FILTER : takes element of array and applies some condition ----
/*
const filt = pilots.filter( (element)=> {
    return element.years >= 16; 
});
console.log(filt);
*/
// TASK: from filtered result to get new array : only names
// TASK: from filtered array loop results

// combining map and filter functions together
/*
const res = pilots
  .filter(function(pilot){
      return pilot.years > 20;
  })
  .map(function(elem){
      return `${elem.name} , ${elem.years}`;
  })
console.log(res);
*/

// short version with arrow functions
/*
const res = pilots
  .filter( pilot => pilot.years > 20 )
  .map( elem => `${elem.name} , ${elem.years}`)
console.log(res);
*/

// all 3 functions are together --------------- 
/*
const res = pilots
  .filter( pilot => pilot.years > 20 )
  .map( elem => `${elem.name} , ${elem.years}`)
  .forEach( el => console.log(el) );
*/