// var, let, const

// var name = 'John Doe';
// console.log(name);
// name = 'Steve Smith';
// console.log(name);

// // Init var
// var greeting;
// console.log(greeting);
// greeting = 'Hello';
// console.log(greeting);

// // letters, numbers, _, $
// // Can not start with number

// // Multi word vars
// var firstName = 'John'; // Camel case
// var first_name = 'Sara'; // Underscore
// var FirstName = 'Tom'; // Pascal case
// var firstname;

// LET
// let name;
// name = 'John Doe';
// console.log(name);
// name = 'Steve Smith';
// console.log(name);


// CONST
// const name = 'John';
// console.log(name);
// Can not reassign
// name = 'Sara';
// Have to assign a value
// const greeting;

const person = {
  name: 'John',
  age: 30
}

person.name = 'Sara';
person.age = 32;
// console.log(person);

// object destructuring
const { name, age } = person;
console.log(name, age);


// const numbers = [1,2,3,4,5];
// numbers.push(6);
// console.log(numbers);

let a = 10;
function f() {
    if (true) {
        let a = 9
        // It prints 9
        console.log(a);
    }
    console.log(a);
}
f()

// It prints 10
console.log(a)