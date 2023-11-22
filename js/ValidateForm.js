//Only alphabets with spaces allowed (for name)
function alp(ele){
	var val = ele.value;
	var len = val.length;
	if(val.search(/[^a-zA-Z ]/) != -1){		// \W is for Not Alphabet	
		alert("ENTER ONLY ALPHABETS");
		ele.value = ele.value.substring(0,len-1);
		ele.focus();
	}
}


//Validation Function For Number Field Where Alphanumeric Characters Cannot Be inserted
//Invoked On onKeyUp Event
function num(ele){
	var val = ele.value;
	var len = val.length;
	if(val.search(/\D/) != -1){			// \D is For Not A Digit search i.e [^0-9]
		alert("ENTER ONLY NUMBERS");
		ele.value = ele.value.substring(0,len-1);
		ele.focus();
		return false;
 }
	 return true;


}
