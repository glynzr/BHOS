var sum = 0;
document.getElementById('add').addEventListener('click', function(e){
    var type = Number(document.orders.type.value);
        sizze = Number(document.orders.sizze.value);
        sum += type*sizze ;
    // print out order cost
    document.getElementById('totalcost').innerText = sum + ' azn' ;
    e.preventDefault();

    // UI side ---------------------------------
    const list = document.getElementById('tb');
    // Create tr element
    const row = document.createElement('tr');
    // get name of select option
    var e = document.getElementById("type");

    // get radio button text 
    var radioText = '',
        selectedRadio = document.querySelector('input[name="sizze"]:checked');
    if(selectedRadio) {
        radioText= document.querySelector(`label[for=${selectedRadio.id}]`).innerHTML;
    }

    // Insert cols
    row.innerHTML = `
      <td>${e.options[e.selectedIndex].text}</td>
      <td>${radioText}</td>
      <td><mark id="delete"> x </mark></td>
    `; 
    list.appendChild(row);
})
