let x = 55; y = 155; z = 255;
// JS DOM elements
//console.log(x + y + z);
//document.write(x + y + z);
//alert(x + y + z);

// changing element's content via innerText
document.getElementById('res').innerText = (x + y + z);
function change(){
    //document.getElementById('hh').style.color = 'yellow';
    //document.getElementById('hh').style.backgroundColor = 'green';
    
    // changing style by set attribute
    document.getElementById('hh').setAttribute('style', 'color:red; font-size: 55px; letter-spacing: 5px; background-color: yellow');
    
    // most recommended. changing style by classList.add method
    document.getElementById('res').classList.add('style1');

    // toggling in class
    document.getElementById('res').classList.toggle('style1');

    var prRes = prompt();
    document.getElementById('pr').innerHTML = prRes;
}