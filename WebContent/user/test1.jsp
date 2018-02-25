<html>
  <head>
    <title>reCAPTCHA demo: Explicit render for multiple widgets</title>
       <script src="../assets/js/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
    	  var verifyCallback = function(response) {
	    	  $.ajax({
					type : 'post',
					url : "../verify.do",
					data : {
						response : response
					},
					success : function(data) {
						alert(data);
					},
					error : function(data) {
						alert("error");
					}
				});
	     };
	     
    	  var onloadCallback = function() {
    	        grecaptcha.render('test', {
    	          'sitekey' : '6LdQ7kMUAAAAAIXA0mdWV7j9SQukYbGVcH637yaa',
    	          'callback' : verifyCallback,
    	          'theme' : 'light'
    	        });
    	  };
    	      
    	      
    </script>
  </head>
  <body>
    <div id="test"></div>
    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>
  </body>
</html>