// TASK-1
/*
document.getElementsByTagName('button')[0].addEventListener('click', () => {
    var res;
    var numm = document.getElementById('num').value;
    let radvalue = document.querySelector('input[name="rad"]:checked').id;
    console.log(radvalue);
    if (radvalue == 'azn') {
        res = numm * 1.7
    } else {
        res = numm / 1.7
    }
    console.log(res);
});
*/

// TASK-2
document.getElementById('butto').addEventListener('click', (el) => {
    el.preventDefault();
    //alert('salam');
    var task = document.getElementById('task').value;
    console.log(task);
    document.getElementById('body').innerHTML += `<li> ${task} </li>`;
});