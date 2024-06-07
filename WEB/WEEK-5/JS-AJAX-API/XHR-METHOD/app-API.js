document.querySelector('.get-jokes').addEventListener("click", getJokes);

// Loading customers
function getJokes(e){

    const number = document.querySelector('input[type="number"]').value;

    //Create an XHR Object
    const xhr = new XMLHttpRequest(); // instantiating a new Object

    //OPEN method for xhr object. We use GET request
    xhr.open('GET', `http://api.icndb.com/jokes/random/${number}`, true);


    // Loading data
    xhr.onload = function(){
        if(this.status === 200){
            const response = JSON.parse(this.responseText); //parsinf JSON to Object
            console.log(response);
            // looping an array and displaying
            let output = '';
            if(response.type === 'success'){
                // jokes are located in response.value object
                response.value.forEach( (joke) => {
                    output += `
                        <li> ${joke.id}. Joke: ${joke.joke}  </li>
                    `;
                });
            }else{
                output += 'can not reach the API';
            }
            document.querySelector('.jokeList').innerHTML = output;
        }
    }

    //Sending data to work
    xhr.send();

    e.preventDefault();
}
