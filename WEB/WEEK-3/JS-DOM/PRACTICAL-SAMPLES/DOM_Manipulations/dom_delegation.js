/* instead of creating two events/functions we'll create one event and
   will define which button is clicked.
*/

// get the element
const element = document.querySelector('#buttons');

// initial value for the counter
var counter = 0;

// trigger event listener for the element
element.addEventListener("click", (e) => {
	//alert(e.target.id);
    (e.target.id == 'increase') ? ++counter : --counter
    // updating h2 element text with counter value
    document.getElementsByTagName('h2')[0].innerText = counter; 
});