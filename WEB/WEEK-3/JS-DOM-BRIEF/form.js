// FORM ELEMENTS ---------------------------------------------------------------

document.getElementById('getit').addEventListener('click', () => {
    // 1. value by ID
    let txt1 = document.getElementById('txt').value;
    console.log(txt1);
    //alert(txt1);
    // 2. value by class name
    let surname = document.getElementsByClassName('name')[1].value;
    console.log(surname);
    // 3. value by tagname
    let age = document.getElementsByTagName('input')[2].value;
    console.log(age);
    // 4. value by querySelector
    //let user = document.querySelector('#user').value;
    //let user = document.querySelector('.user').value;
    //let user = document.querySelector('input[type="number"]').value;
    let user = document.querySelector('[name="age"]').value;
    console.log(user);
    //5. value by querySelectorAll
    let us = document.querySelectorAll('[name="us"]')[0].value;
    console.log(us);

    // value from radio button
    let radvalue = document.querySelector('input[name="rad"]:checked').value;
    console.log(radvalue);

});

