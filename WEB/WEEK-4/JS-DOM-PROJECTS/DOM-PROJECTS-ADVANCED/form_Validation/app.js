const form = document.querySelector('#form');
const username = document.querySelector('#username');
const password = document.querySelector('#password');

form.addEventListener('submit', (e) => {
    e.preventDefault();
    
    // function to check inputs: checkInputs()
    checkInputs();
});

function checkInputs(){
    // get elements values
    const usernameValue = username.value.trim();
    const passwordValue = password.value.trim();

    if (usernameValue.length < 5){
        // set error function
        setError(username, 'Username Error!');
    } else {
        // set success function
        setSuccess(username);
    }

    // continue the same with password!
    if (passwordValue.length < 8){
        // set error function
        setError(password, 'Wrong Password!');
    } else {
        // set success function
        setSuccess(password);
    }
}

function setError(input, message){
    const formElement = input.parentElement;
    const small = formElement.querySelector('small');
    // highlight error text
    small.innerText = message;
    // highlight error border with red
    formElement.className = "error";
}

function setSuccess(input){
    const formElement = input.parentElement;
    formElement.classList.remove("error");
    const small = formElement.querySelector('small');
    small.innerText = '';
}