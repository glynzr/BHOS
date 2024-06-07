// ToDo Applikasiya -----------------------------------------------------------------
// DOM metodu

var ul = document.querySelector('.collection');
var butt = document.getElementsByClassName('btn')[0];
var clr = document.getElementsByClassName('clear-tasks')[0];

butt.addEventListener('click', addTask);       // yeni task elave etmek ucun funksiya
ul.addEventListener('click', removeTask);      // mueyyen taski silmek ucun funksiya
clr.addEventListener('click', clearAllTasks);  // butun tasklari silmek ucun funksiya

// yeni task elave etmek ucun funksiya
function addTask(e){
    e.preventDefault();
    let taskVal = document.querySelector('#task');
    let li = document.createElement('li');
    li.innerHTML = taskVal.value;

    if (taskVal.value.length >= 3){
        const link = document.createElement('span'); // span elementi yaradaq
        link.className = 'delete-item'; // elemente class elave edek
        link.innerHTML = ' x '; // x - iconu elave edek
        li.appendChild(link);   // span elementi siyahi icerisine yerleshdirek
        ul.appendChild(li);     // her bir siyahi elementini ul teqine yerleshdirek
        taskVal.value = "";     // input elementini boshaldaq 
    }else{
        alert('Duzgun kontent daxil edin!');
    }
}

// mueyyen taski silmek ucun funksiya
function removeTask(de){
    //if(de.target.className == 'delete-item'){
    if(de.target.classList.contains('delete-item')){
        if(confirm('Are you sure?')){
            de.target.parentElement.remove();
        }
    }
}

// butun tasklari silmek ucun funksiya
function clearAllTasks(er){
    er.preventDefault();
    ul.innerHTML = "";
}