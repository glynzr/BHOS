document.querySelector('button').addEventListener('click', function(){
    console.log(document.getElementById('txt').value);
    console.log(document.querySelector('select').value);
    selectradio = document.querySelector('input[name="rad"]:checked');
    var radioText = '';
    if(selectradio){
        //console.log(selectradio.value);
        // IF reading text
        radioText = document.querySelector(` label[for=${selectradio.id}] `).innerHTML;
        console.log(radioText);
    }else{
        alert('please select radio button');
    }
    //document.forms['form_name']['input_name'].value;  BY NAME!!!
    
    console.log(document.forms['frm']['rad'].value);

    var arr = [];
    var checkboxes = document.querySelectorAll('input[type=checkbox]:checked');
    // using for
    // for (let i=0; i < checkboxes.length; i++){
    //     arr.push(checkboxes[i].value);
    // }
    // using map
    checkboxes.forEach( (checks) => {
        arr.push(checks.value);
    });
    console.log(arr);
})
