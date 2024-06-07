//alert('hello');
//console.log('aleykum salam');

// Variables: var, let, const ------------------------------------------------
var nname = 'Rahim';
var age = 19;
var numb = 19.99;
var cellphone;

console.log(typeof nname);
console.log(typeof age);
console.log(typeof numb);
console.log(typeof cellphone);

age = 29;
console.log(age);

// const surname = 'Khalid';
// surname = 'Hamid';
// console.log(surname);

// const for array and objects
const arr1 = ['Asif', 'Vasif', 'Agasif'];

const obj1 = {
    nname1: 'Alim',
    age1: 33
};

// obj1.name = 'Vasim';
// obj1.age = 44;
console.log(obj1.name, obj1.age);

// destructuring the object
const { nname1, age1 } = obj1;
console.log(nname, age);

// using LET

// let a = 10
// function f() {
//     if (true) {
//         let a = 9;
//         console.log(a);
//     }
//     console.log(a);
// }
// f();
// // it will print 10
// console.log(a);

// Type conversion: ---------------------------------------------------------
var age = '19';
console.log(typeof Number(age));
console.log(parseInt('199.99'));

var name1 = 'Asif';
var name2 = 'Vasif';
console.log(name1 + name2);

// Strings -------------------------------------------------------------------
const nme = 'John';
const surname = 'Atkinson';
const agge = 19;
const city = "Kanzas";

// mess = '<ul><li>' + nme + '</li><li>' + surname + '</li><li>' + agge + '</li></ul>'
// document.write(mess);

// Template literals: -------------------------------------------------------
/*
mess = `
    <ul>
        <li> ${nme} </li>
        <li> ${surname} </li>
        <li> ${agge} </li>
        <li> ${city} </li>
        <li> ${agge > 18 ? 'below 18' : 'above 18'} </li >
        <li> Year of Birth: ${2023 - agge} </li>
    </ul >
    `;
document.write(mess);
*/

// ARRAYS -------------------------------------------------------------------
/*
const arr2 = [23, 55, 88, 99];
const arr3 = ['Apple', 'Banana', 'Lemon', "Kiwi"];
const arr4 = [22, 'Apple', true, undefined, { a: 55, b: 77 }];

console.log(arr4.length);
// mutating arrays
arr3.push('Corn'); // at end
arr3.unshift('Tomato');
console.log(arr3); // in front

// delete elements: pop, shift
// splice()
arr3.splice(1, 2);
console.log(arr3);

// concat
const arr5 = ['Lemon', "Kiwi"];
const arr6 = ['Apple', 'Banana'];
// console.log(arr5.concat(arr6));
console.log([...arr5, ...arr6]);
*/

// CONDITIONAL STATMENTS
/*
const id = '100';
if (id === 100) {
    alert('correct')
} else {
    alert('not correct')
}

const id2 = 100;
if (id > 100) {
    alert('above 100')
} else if (id < 100) {
    alert('below 100')
} else {
    alert('equal')
}
*/
// LOGICAL AND: &&
// LOGICAL OR: ||

// CONDITIONAL STATMENTS ------------------------------------------------------
/*
const id = '100';
if (id === 100) {
    alert('correct')
} else {
    alert('not correct')
}
// TERNRY OPERATION
console.log(id === 100 ? 'correct' : 'incorrect');
*/

// FUNCTIONS ------------------------------------------------------------------
/*
function calc(a, b) {
    return a * b;
}
console.log(calc(5, 3));

// self invoked function
(function () {
    console.log('self invoked');
})();

(function (name) {
    console.log(name, 'salam');
})('Ahmad');

// Property method
const todo = {
    add: () => { console.log('Add todo...') },
    edit: function () { console.log('Edit todo...') }
};
todo.add();
todo.edit();
*/

// LOOPING ------------------------------------------------------------------
/*
for (let i = 0; i < 10; i++) {
    console.log('hello');
    if (i == 5) {
        break;
    }
}

const cars = ['honda', 'ford', 'alpha romeo'];
for (let i = 0; i < cars.length; i++) {
    console.log(cars[i]);
}
for (x in cars) {
    console.log(x, cars[x]);
}
// FOREACH ---------------------------------
cars.forEach(function (car) {
    console.log(car);
});

age = prompt('what is your age: ')
console.log(age);
*/

// HIGH ORDER FUNCTIONS : FOREACH, MAP, FILTER ---------------------------------
// ARROW FUNCTIONS ---------------------------

// let func = (rg1, rg2, arg3, ... , agN) => expression

// function calcc(a, b) {
//     return a * b;
// }

let calcc = (a, b) => a * b;

// SCHEDULING FUNCTIONS ------------------------------------------------------
//setInterval(() => console.log('hello', 1000));
/*
let timerId = setInterval(() => console.log('hello'), 1000);
// clearInterval() ------
let stopit = () => {
    let ans = prompt('Ask to continue?: ')
    if (ans == 'no') {
        clearInterval(timerId);
    }
}
setTimeout(stopit, 5000);
*/

// FOREACH -------------------------------
var pilots = [
    {
        id: 10,
        name: 'Musa Manarov',
        years: 14
    },
    {
        id: 19,
        name: 'Isa Manafov',
        years: 16
    },
    {
        id: 20,
        name: 'Liza Manarov',
        years: 22
    }
];

pilots.forEach(element => {
    console.log(element.name, element.years);
});

// MAP function -----------------------------
// const res = pilots.map((pilot) => {
//     return pilot.name;
// });

// console.log(res);

// // FILTER -----------------------------------
// const res2 = pilots.filter((pilot) => {
//     return pilot.years >= 16;
// });
// console.log(res2);

const res = pilots
    .filter((pilot) => pilot.years >= 16)
    .map((elem) => elem.name);
console.log(res);