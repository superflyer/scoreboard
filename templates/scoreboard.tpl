  <head>
  	<title>Scoreboard</title>
    <link rel="stylesheet" href="/static/base.css" type="text/css">
	<script type="text/javascript">
		% for p in scores:
		function increment{{p}}() {
			document.increment{{p}}.submit();
		}
		function decrement{{p}}() {
			document.decrement{{p}}.submit();
		}
		% end
	</script>

	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
  	
  	<meta name="format-detection" content="telephone=no">
  	 
  </head>
  
  <body>
  


   	<div id="content">
   	<table>
   	% for p in scores:
   	<tr>
   		<form action="/{{'-'.join(scores.keys())}}" name="increment{{p}}" method="post">
			<input type="hidden" name="scoringPlayer" value="{{p}}">
			<input type="hidden" name="pointChange" value="1">
		</form>
   		<form action="/{{'-'.join(scores.keys())}}" name="decrement{{p}}" method="post">
			<input type="hidden" name="scoringPlayer" value="{{p}}">
			<input type="hidden" name="pointChange" value="-1">
		</form>
	   	<td><h1>{{p.capitalize()}}</h1></td>
	   	<td><h1>{{scores[p]}}</h1></td>
	   	<td><a href="javascript: increment{{p}}()"><span>
	   		<img src='/static/up.png' width=40 height=40></span></a>
   		</td>
	   	<td><a href="javascript: decrement{{p}}()"><span>
	   		<img src='/static/down.png' width=40 height=40></span></a>
   		</td>
   	</tr>
   	% end
   	</table>
   	</div>

  </body>
</html>
