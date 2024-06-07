// ToDo Applikasiya -----------------------------------------------------------------
// LIST(MASSIV) Metodu

var ul = document.querySelector('.collection');
var butt = document.getElementsByClassName('btn')[0];
var clr = document.getElementsByClassName('clear-tasks')[0];

butt.addEventListener('click', addTask);  // yeni task elave etmek ucun funksiya
clr.addEventListener('click', delTask);   // butun tasklari silmek ucun funksiya

const allTasks = []; // butun tasklarin siyahisi

// yeni task elave etmek ucun funksiya
function addTask(e){
    e.preventDefault();
    let taskVal = document.querySelector('#task');
    if (taskVal.value.length >= 3){
        allTasks.push(taskVal.value);
        displayTasks();   
    }else{
        alert('Duzgun kontent daxil edin!');
    }
    taskVal.value = '';
}

// butun tasklari ekrana cixarmaq ucun funksiya
function displayTasks(ts){
    content = ''
    allTasks.forEach((task, index)=>{
        content += `<li> ${task} <span class="delete-item" onClick="removeTask(${index})"> x </span></li>`;
    });
    ul.innerHTML = content;
}

// taski silmek ucun funksiya, oturulen index parametrine gore
function removeTask(index){
    if(confirm('Are you sure?')){
        allTasks.splice(index, 1);  // index-e esasen 1 element silmek
        displayTasks();
    }
}

// butun tasklari silmek ucun funksiya
function delTask(e){
    allTasks = [];  // siyahini boshaltmaq 
    displayTasks();
    e.preventDefault();
}