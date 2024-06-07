let x = 55; y = 44; z = 66;

// document.getElementById('res').innerText = x + y + z;

// function change() {
//     // document.getElementById('hh').style.color = 'red';
//     // document.getElementById('hh').style.backgroundColor = 'greenyellow';
//     // document.getElementById('hh').classList.add('style1');
//     document.getElementById('hh').classList.toggle('style1');

//     var pRes = prompt('Add your name: ');
//     //document.getElementById('pr').innerText = pRes;
//     document.getElementById('pr').innerHTML = `<h2>Prompt result:</h2> ${pRes} `;

//     document.getElementById('bd').style.backgroundColor = 'yellow';
// }

// with 2 functions
/*
let bb = document.getElementById('butto');

bb.addEventListener('click', () => {
    document.getElementById('bd').style.backgroundColor = 'yellow';
});

var counter = 0;
function increase() {
    counter++;
    document.getElementById('coun').innerText = counter;
}
function decrease() {
    counter--;
    document.getElementById('coun').innerText = counter;
}
*/

// DOM delegation: with 1 function

const element = document.getElementById('buttons')
var counter = 0
element.addEventListener('click', (el) => {
    //console.log(el.target.id);
    // if (el.target.id == 'plus') {
    //     counter++
    // } else {
    //     counter--
    // }
    (el.target.id == 'plus') ? counter++ : counter--
    document.getElementById('coun').innerText = counter;
});

// TASK: create two buttons. By each click on 'plus' button increase font size 
// by 2px, by clicking on 'minus' button decrease font size by 2px;  

const ele = document.getElementById('forfonts');
var ffont = 12;

ele.addEventListener('click', (el) => {
    (el.target.id == 'plus') ? ffont++ : ffont--;
    document.getElementById('texto').style.fontSize = ffont + 'px';
});
