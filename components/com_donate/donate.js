

function openpopup(href,left,top,width,height){
	
	myRef = window.open(href,'mywin','left='+left+',top='+top+',width='+width+',height='+height+',toolbar=1,resizable=0');

}

function togglePayment(f){
	
	if(f.options[f.options.selectedIndex].value == "CC"){
		document.getElementById('check').style.display = "none";
		document.getElementById('cc').style.display = "block";
	}else{
		document.getElementById('check').style.display = "block";
		document.getElementById('cc').style.display = "none";	
	}
	
}

function checkUsername(username)
{
var url = 'index2.php?option=com_donate&task=checkusername&username='+escape(username)+'&no_html=1';
var xmlHttp;
var available = 0;

try
  {
  // Firefox, Opera 8.0+, Safari
  xmlHttp=new XMLHttpRequest();
  }
catch (e)
  {
  // Internet Explorer
  try
    {
    xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
    }
  catch (e)
    {
    try
      {
      xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
      }
    catch (e)
      {
      alert("Your browser does not support AJAX!");
      return false;
      }
    }
  }
  xmlHttp.onreadystatechange=function()
    {
    if(xmlHttp.readyState==4)
      {
      	available=parseInt(xmlHttp.responseText);

      	if(available > 0){
      		document.getElementById('username_check').innerHTML = "<span class='highlight'>Username not available/invalid!</span>";
      		document.getElementById('username_valid').value = 0;
      	}else{
      		document.getElementById('username_check').innerHTML = "Username available";
      		document.getElementById('username_valid').value = 1;
      	}
      	
      }
    }
  xmlHttp.open("GET",url,true);
  xmlHttp.send(null);
  
}


function trimStates(f){
	
	var statesFound = false;
	//remove all items from the state drop-down
	if(f.options.selectedIndex > 0){
		
		var country = f.options.selectedIndex;
		
		//blank out the state list
		var state = document.getElementById('state');
		if(state){
			state.options.length = 0;	
		}
		
		
		if(country != 223){
		
			//disable the post code format message
			document.getElementById('postal_format').style.visibility='hidden';
		}else{
			document.getElementById('postal_format').style.visibility='visible';
		}
		
		//repopulate with only the correct states;
		var statelist = document.getElementById('state_list');
		
		if(statelist){
			//get the code/name pairs |AZ,Arizona
			var statepairs = statelist.value.split("|");
		
			if(statepairs){
				
				for (var zz in statepairs){
					
					if(statepairs){
						
						try{
								
							if(statepairs[zz]){
								var newstate =statepairs[zz].split(",");
							}
					
							if(newstate){
							
								if(newstate[2] == country){
									statesFound = true;
									state.options[state.options.length] = new Option(newstate[1],newstate[0]);
								}
									
							}
												
						}catch(e){}
							
					}
					
				}
				
			}
		
		}

		if(statesFound == false){
			state.disabled=true;
		}else{
			state.disabled=false;
		}
			
		
	}
	
}