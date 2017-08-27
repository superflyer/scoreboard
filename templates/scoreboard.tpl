  <head>
  	<title>Scoreboard</title>
  	<link href="static/superflyer.css" type="text/css" rel="stylesheet"/>
	<script type="text/javascript">
		% for p in scores:
		function increment{{p}}() {
			document.increment{{p}}.submit();
		}
		% end
	</script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  	
  	<meta name="format-detection" content="telephone=no">
  	
       <style type="text/css">
		    
		    #availabilityCodesContiner{
		    	padding-left:7px;
		    }
		    
		    #availabilityCodesContiner h3,
		    #availabilityCodesContiner label{
		    	font-weight:bold;
		    }
       		
       </style>
  
  	
  	<style>
  		#mobileAppBanner{
  			color: white;
			padding: 14px;
			font-weight: bold;
			background-color: #3062A1;
			font-size: 17px;
  		}
  		#mobileAppBanner a.yes-please{
  			text-decoration: none;
			text-align: center;
			color: white;
			font-weight: bold;
			display: block;
			box-shadow: black 0px 2px 2px;
			background: -webkit-gradient(linear, left top, left bottom, from(#2F4158), to(#253141));
			padding: 20px;
			border-radius: 15px;
			border: 1px solid #1F2A39;
			margin-top:10px;
  		}
  		#mobileAppBanner a.no-thanks{
  			float: right;
			margin-top: 20px;
			text-decoration: none;
			color: #DDD;
			font-size: smaller;
			cursor: pointer;
			font-weight:bold;
  		}
  		.clear{
  			clear:both;
  		}
  		#mobileAppAndroidBanner,
  		#mobileAppItunesBanner{
  			display:none;
  		}
  	</style>
  </head>
  
  <body>
  


   	<div id="content">
   	<table>
   	% for p in scores:
   	<tr>
   		<form action="/increment" name="increment{{p}}" method="post">
			<input type="hidden" name="scoringPlayer" value="{{p}}">
			<input type="hidden" name="allPlayers" value="{{'-'.join(scores.keys())}}">
		</form>
	   	<td>{{p}}</td>
	   	<td>{{scores[p]}}</td>
	   	<td><a href="javascript: increment{{p}}()"><span><img src='/static/up.png'></span></a></td>
   	</tr>
   	% end
   	</table>
   	</div>

  </body>
</html>
