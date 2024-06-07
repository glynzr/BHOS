document.getElementById('button1').addEventListener("click", loadCustomer);
document.getElementById('button2').addEventListener("click", loadCustomers);

// Loading single customer
function loadCustomer(){
    // Create an XHR Object
    const xhr = new XMLHttpRequest(); // instantiating a new Object

    // OPEN method for xhr object. We use GET request
    xhr.open('GET', 'customer.json', true);

    // Loading data
    xhr.onload = function(){
        if(this.status === 200){
            console.log(this.responseText);
            const customer = JSON.parse(this.responseText); // parsing to JS Object
            //console.log(customer);
            // lets output Object 
            const output = `
                <ul>
                    <li> ID: ${customer.id} </li>
                    <li> Name: ${customer.name} </li>
                    <li> Company: ${customer.company} </li>
                    <li> Phone: ${customer.phone} </li>
                </ul>
            `;
            document.getElementById('customer').innerHTML = output;
        }
    }

    // Sending data to work
    xhr.send();
}

// Loading customers
function loadCustomers(){
    // Create an XHR Object
    const xhr = new XMLHttpRequest(); // instantiating a new Object

    // OPEN method for xhr object. We use GET request
    xhr.open('GET', 'customers.json', true);

    // Loading data
    xhr.onload = function(){
        if(this.status === 200){
            //console.log(this.responseText);
            const customers = JSON.parse(this.responseText); // parsing to JS Object
            //console.log(customers);
            // lets output Array Object
            let output = ''; 
            customers.forEach( (objs) => {
                console.log(objs);
                output += `
                    <ul>
                        <li> ID: ${objs.id} </li>
                        <li> Name: ${objs.name} </li>
                        <li> Company: ${objs.company} </li>
                        <li> Phone: ${objs.phone} </li>
                    </ul>
                `;
            });
            document.getElementById('customers').innerHTML = output;
        }
    }

    // Sending data to work
    xhr.send();
}
