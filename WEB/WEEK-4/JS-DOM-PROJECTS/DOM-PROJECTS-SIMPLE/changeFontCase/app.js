var txt = document.getElementById("content");
// first approach (target to document BODY)
/*document.addEventListener('click', (e) => {
	if (e.target.tagName == 'BUTTON') {
    	if(e.target.id == 'aa'){
    		txt.style.textTransform = 'lowercase';
    	}
    	else if(e.target.id == 'AA'){
    		txt.style.textTransform = 'uppercase';
    	}
    	else{
    		txt.style.textTransform = 'capitalize';
    	}
  	}	
})*/

// second approach (we target DIV by ID #butts), more shorter
document.querySelector('#butts').addEventListener('click', (e) => {
    if(e.target.id == 'aa'){
    	txt.style.textTransform = 'lowercase';
    }
    else if(e.target.id == 'AA'){
    	txt.style.textTransform = 'uppercase';
    }
    else{
    	txt.style.textTransform = 'capitalize';
    }
})