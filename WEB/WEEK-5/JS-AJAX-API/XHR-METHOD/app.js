document.getElementById('button').addEventListener("click", loadData);

function loadData(){
    // Create an XHR Object
    const xhr = new XMLHttpRequest(); // instantiating a new Object

    // OPEN method for xhr object. We use GET request
    xhr.open('GET', 'data.txt', true);

    // Optional: used for spinners/loaders
    xhr.onprogress = function(){
        console.log('ReadyState: ', xhr.readyState);
    }

    // Loading data
    xhr.onload = function(){
        if(this.status === 200){
            console.log(this.responseText);
            document.getElementById('output').innerHTML = ` <h4> ${this.responseText} </h4> `;
        }
    }

    // Sending data to work
    xhr.send();
}

// HTTP Statuses:---
// 200 : "OK"
// 403 : "Forbidden"
// 404 : "Not Found"

// ReadyState values: ------------------------
// 0: request not initialized
// 1: server connection established
// 2: request received
// 3: processing request
// 4: request is finished and response is ready