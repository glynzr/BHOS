// define UI variables
const form = document.querySelector('#task-form');
const taskInput = document.querySelector('#task');
const taskList = document.querySelector('.collection');
const clearBtn = document.querySelector('.clear-tasks');
const filter = document.querySelector('#filter');

// call function: load all event listeners
loadEventListeners();

// create function: load all event listeners
function loadEventListeners(){
	// add task event
	form.addEventListener('submit', addTask);

	// remove task event
	taskList.addEventListener('click', removeTask);

	// clear all tasks
	clearBtn.addEventListener('click', clearAllTasks);

	// filter tasks
	filter.addEventListener('keyup', filterTasks);
}

// Add task function
function addTask(e){

	if (taskInput.value === '') {
		alert('Add a task!');
	}

	// create li element
	const li = document.createElement('li');
	li.className = 'collection-item';
	// create a text node and append it to li
	li.appendChild(document.createTextNode(taskInput.value));
  	// Create new link element
  	const link = document.createElement('a');
  	// Add class
  	link.className = 'delete-item secondary-content';
  	// Add icon html
  	link.innerHTML = '<i class="fa fa-remove"></i>';
  	// Append the link to li
  	li.appendChild(link);

	// Append li to UL
	taskList.appendChild(li);

	// clear input
	taskInput.value = '';

	e.preventDefault();
}

// Remove task function
function removeTask(e){
	// we targeting each task, it gives us i element, but we need to reach 
	// li element, which is parent of a element
	//console.log(e.target);
	if(e.target.parentElement.classList.contains('delete-item')){
		if(confirm('Are you sure?')){
			e.target.parentElement.parentElement.remove();
		}
	}
}

// Clear all tasks
function clearAllTasks(){
	// version-1
	//taskList.innerHTML = "";
	// second version using loop
	while(taskList.firstChild){
		taskList.removeChild(taskList.firstChild);
	}
}

// Filter tasks
function filterTasks(e){
	const text = e.target.value.toLowerCase();
	//console.log(text);
	document.querySelectorAll('.collection-item').forEach(function(allC){
		const item = allC.firstChild.textContent;
		if(item.toLowerCase().indexOf(text) != -1){
			allC.style.display = 'block';
		}else{
			allC.style.display = 'none';
		}
	});
}