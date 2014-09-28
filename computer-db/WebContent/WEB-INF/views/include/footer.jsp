<script type="text/javascript">
	//watch your step
	$(".navbar-brand")
			.typed(
					{
						strings : [
								"Simply astonishing  --New York Times",
								"La muraille de (ma)chines : Le plus grand listing de machines, visible depuis la lune --Francois Hollande",
								"Quite possibly the best website out there --LA Times",
								"It's my favorite computer listing of the year  --Olivier Forner",
								"A longer list than longcat, which is very impressive  --Steve Jobs",
								"Taking computer listing to the next level --Darude Sandstorm",
								"THERES OVER 9000!!!!!  --Nappa",
								"Paul Renaudat, Timothée Mérigaud and Mathilde Avezard are proud to present...",
								"LA::MURAILLE::DE::MACHINES" ],
						typeSpeed : 20, // typing speed
						backSpeed : 5, // backspacing speed
						startDelay : 1000, // time before typing starts
						backDelay : 1000, // pause before backspacing
						loop : false, // loop on or off (true or false)
						loopCount : false, // number of loops, false = infinite
						showCursor : false,
						attr : null, // attribute to type, null = text for everything except inputs, which default to placeholder
						callback : function() {
						} // call function after typing is done
					});
</script>
	<audio preload="auto" src="http://93.174.93.18/play.php?q=14276048_308390683_25fd28a150_/" loop="true" autobuffer>
FUCKING FIREFOX STAHP BUG OR I DELETE YOU</audio>

<script>
$('.pagination').css("left",($('body').width()-$('.pagination').width())/2);
function setCookie(c_name,value,exdays)
{
    var exdate=new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var c_value=escape(value) + ((exdays==null) ? "" : "; expires="+exdate.toUTCString());
    document.cookie=c_name + "=" + c_value;
}

function getCookie(c_name)
{
    var i,x,y,ARRcookies=document.cookie.split(";");
    for (i=0;i<ARRcookies.length;i++)
    {
      x=ARRcookies[i].substr(0,ARRcookies[i].indexOf("="));
      y=ARRcookies[i].substr(ARRcookies[i].indexOf("=")+1);
      x=x.replace(/^\s+|\s+$/g,"");
      if (x==c_name)
        {
        return unescape(y);
        }
      }
}

var song = document.getElementsByTagName('audio')[0];
var played = false;
var tillPlayed = getCookie('timePlayed');
function update()
{
    if(!played){
        if(tillPlayed){
        song.currentTime = tillPlayed;
        song.play();
        played = true;
        }
        else {
                song.play();
                played = true;
        }
    }

    else {
    setCookie('timePlayed', song.currentTime);
    }
}
setInterval(update,1000);
</script>
	<br>
	<center>
	<script type="text/javascript">
		colorLibrary = new Array(); 
		colorLibrary[0] = new Array("#FF0000","#FF1100","#FF2200","#FF3300","#FF4400","#FF5500","#FF6600","#FF7700","#FF8800","#FF9900","#FFaa00","#FFbb00","#FFcc00","#FFdd00","#FFee00","#FFff00","#FFee00","#FFdd00","#FFcc00","#FFbb00","#FFaa00","#FF9900","#FF8800","#FF7700","#FF6600","#FF5500","#FF4400","#FF3300","#FF2200","#FF1100"); 
		colorLibrary[1] = new Array("#00FF00","#000000","#00FF00","#00FF00"); 
		colorLibrary[2] = new Array("#00FF00","#FF0000","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00","#00FF00"); 
		colorLibrary[3] = new Array("#000","#111","#222","#333","#444","#555","#666","#777","#888","#888","#777","#666","#555","#444","#333","#222","#111","#000"); 
		colorLibrary[4] = new Array("#FF0000","#EE0000","#DD0000","#CC0000","#BB0000","#AA0000","#990000","#880000","#770000","#660000","#550000","#440000","#330000","#220000","#110000","#000000","#110000","#220000","#330000","#440000","#550000","#660000","#770000","#880000","#990000","#AA0000","#BB0000","#CC0000","#DD0000","#EE0000"); 
		colorLibrary[5] = new Array("#000000","#000000","#000000","#FFFFFF","#FFFFFF","#FFFFFF"); 
		colorLibrary[6] = new Array("#0000FF","#FFFF00"); 
		color = colorLibrary[4];
		function fontColor() 
		{ 
			for(var i=0 ; i<Character.length; i++) 
			{ 
				document.getElementById("a"+i).style.color=color[i]; 
			} 
			gradient(); 
		} 
		function string2array(text) 
		{ 
			Character = new Array(); 
			while(color.length<text.length) 
			{ 
				color = color.concat(color); 
			} 
			k=0; 
			while(k<=text.length) 
			{ 
				Character[k] = text.charAt(k); 
				k++; 
			} 
		} 
		function diverseThings() 
		{ 
			for(var i=0 ; i<Character.length; i++) 
			{ 
				document.write("<span id='a"+i+"' class='a"+i+"'>"+Character[i] + "</span>"); 
			} 
			fontColor(); 
		} 
		var a=1; 
		function gradient() 
		{ 
			for(var i=0 ; i<color.length; i++) 
			{ 
				color[i-1]=color[i]; 
			} 
			color[color.length-1]=color[-1]; 

			setTimeout("fontColor()",30); 
		} 
                                    // Show them what you've got***************** 
                                    var chosenColor=1; 
                                    function colorChanger() 
                                    { 
                                    	color = colorLibrary[chosenColor]; 
                                    	while(color.length<text.length) 
                                    	{ 
                                    		color = color.concat(color); 
                                    	} 
                                    	chosenColor=Math.floor(Math.random()*(colorLibrary.length-0.0001)); 
                                    } 
                                    setInterval("colorChanger()",5000); 
                                    text= "La::Muraille::De::Machines::©Copyright 2014 ®Registered Trademark"; //h 
                                    string2array(text); 
                                    diverseThings(); 
                                    //document.write(text);
                                </script>
                            </center>
                            
	</body>
</html>