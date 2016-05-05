
<cfinclude template="includes/header.cfm">
	
<cfif url.pm NEQ ''>
	<cfset session.pm = 1>
</cfif>

<cfif url.iframe NEQ ''>
	<cfset session.ifram = 1>
</cfif>
	



	
 <!---INCLUDE BODY TOP HTML--->
<cfinclude template="includes/bodyTop-over.cfm">
	
	<div class="row">
	<div class="col-sm-12 col-xs-12">    
		
			<cfinclude template="includes/marketing-overview.cfm">

    </div><!--/span-->
  
</div><!--/row-->

    
	
	<!---INCLUDE FOOTER INCLUDE--->
	<cfinclude template="includes/footer.cfm">

  </body>
</html>


<!---reset number at 1st of year

YYNNNN  year two digits and then increment job number up to four digits--->

<script src="../bootstrap3/js/bootstrap.min.js"></script>
<script src="../bootstrap3/js/moment.js"></script>
<script src="../bootstrap3/js/bootstrap-datetimepicker.min.js"></script>

<script src="https://api.trello.com/1/client.js?key=b8648e40362f05ff091b5fd8bd35066f"></script>

<script type="text/javascript">

function newRow($table,cols){
		
    $row = $('<tr/>');
    for(i=0; i<cols.length; i++){
        $col = $('<td/>');
        $col.append(cols[i]);
        $row.append($col);
    }
    $table.append($row);
}

var onAuthorize = function() {
    updateLoggedIn();
	var token = Trello.token();
    
    Trello.members.get("me", function(member){
        $("#fullName").text(member.fullName);
        
        var $cards = $("<div>").text("Loading Boards...").appendTo("#outputCards");
/*
		  Trello.get("boards/54946b573211f2755865a768/lists", function(x) {
		       $cards.empty();
		       $.each(x, function(ix, y) {
					var pmgCheck = $('<button type="button" class="btn btn-default" id="' + y.id +'"  aria-expanded="false" >').text(y.name);
					$(pmgCheck).appendTo($cards); 
					
					

					});

        		});
	
		*/

	    //  Output all PMG Work Lists
	    Trello.get("boards/54946b573211f2755865a768/cards/open", function(x) {
	       $.each(x, function(ix, y) {
				if ( y.name.indexOf("#") >= 0 ) {
					var str = y.name.split("#").pop().split(" ");

					var spanName = ".trello-" + str[1];
					var spanNote = "#row-" + str[1];
					var spanStatus = ".trelloList-" + str[1];
					var cardLabels = ".cardLabel-" + str[1];
					var cardLabelsTwo = ".cardLabel-" + str[1];
					var expandLabels = ".expand-" + str[1];
				}
				else  {
					var str = y.name.split(" ");

					var spanName = ".trello-" + str[0];
					var spanNote = "#row-" + str[0];
					var spanStatus = ".trelloList-" + str[0];
					var cardLabels = ".cardLabel-" + str[0];
					var cardLabelsTwo = ".cardLabels-" + str[0];
					var expandLabels = ".expand-" + str[0];
				}	
					
					var currentList = y.idList;
					var currentLabels = y.idLabels.toString();	
						
					$(spanName).empty();
					
					var pmgCheck = $("<a href='" + y.url + "'>").text(y.name.split("#").pop().substr(7));
					
					$(pmgCheck).appendTo(spanName);
					
				
					if (currentLabels.indexOf(',') > -1) {
						var currentLabelsArray = currentLabels.split(','); 
						for(var i=0;i<currentLabelsArray.length;i++){
							var spanAdd = $("<span>").addClass(currentLabelsArray[i] + " trello-labels").text(currentLabelsArray[i]);
						//	var spanAddTwo = $("<span>").addClass(currentLabelsArray[i] + " trello-labels").text(currentLabelsArray[i]);
							
							$(cardLabels).append(spanAdd);
						//	$(cardLabelsTwo).append(spanAddTwo);
						}
					}
					else {
						$(cardLabels).append("<span>");
						$(cardLabels + " span").text(currentLabels).addClass(currentLabels + " trello-labels");
					//	$(cardLabelsTwo).append("<span>");
					//	$(cardLabelsTwo + " span").text(currentLabels).addClass(currentLabels + " trello-labels");
					}
						
		
					
					Trello.get("boards/54946b573211f2755865a768/lists/", function(x) {
					      $.each(x, function(ix, y) {
							
							if( currentList == y.id ) {
								$(spanStatus).empty();
								$(spanStatus).text(y.name);
								$(spanNote).addClass(y.name.toString().toLowerCase().replace(/(^\s+|[^a-zA-Z0-9 ]+|\s+$)/g,"").replace(/ /g, '-'));
							}
						});

	        		});
					
					
					Trello.get("boards/54946b573211f2755865a768/labels/", function(x) {
					 	$.each(x, function(ix, y) {
						/*	if (y.color != 'null' || y.color != '') {
									if( currentLabels  == y.id ) {
										$(cardLabels).text( y.name );
										$(cardLabels).addClass(y.color);
										$(expandLabels).addClass(y.color);
									
									}
								}
								else {
										if( currentLabels  == y.id ) {
											$(cardLabels).append('<span>' + y.name + '</span>');
											$(cardLabels + " span").addClass("undefined");
										}
								} */
								
								var labelConvert = y.id.toString();
								$(expandLabels + " a.btn").removeClass("btn-primary").addClass("btn-default");
								if($('.trello-labels').hasClass(labelConvert)){
									$(cardLabels + " .trello-labels."+labelConvert).text( y.name ); 
									$(cardLabels + " .trello-labels."+labelConvert).addClass( y.color ); 
									
							//		$(cardLabelsTwo + " .trello-labels."+labelConvert).addClass( y.color ); 
			
								}
								
						
								
								
							});

		        		});
					
					
					
				
					
					

				});

    		});

			Trello.get("boards/54946b573211f2755865a768/cards/closed", function(x) {
		       $.each(x, function(ix, y) {
					if ( y.name.indexOf("#") >= 0 ) {
						var str = y.name.split("#").pop().split(" ");

						var spanName = ".trello-" + str[1];
						var spanNote = "#row-" + str[1];
						var spanStatus = ".trelloList-" + str[1];

						$(spanName).empty();
						$(spanStatus).empty();
						
						$(spanName + ' .btn-info').hide();

						var pmgCheck = $("<a href='" + y.url + "'>").text(y.name.split("#").pop().substr(7));

						$(pmgCheck).appendTo(spanName);
						$(spanNote).addClass('alert alert-danger');
						$(spanStatus).text('Archived On PMG.');

					
						}

					});

	    		});
	
							
	 
    });

};

var updateLoggedIn = function() {
    var isLoggedIn = Trello.authorized();
    $("#loggedout").toggle(!isLoggedIn);
    $("#loggedin").toggle(isLoggedIn);        
};
    
var logout = function() {
    Trello.deauthorize();
    updateLoggedIn();
};
                          
Trello.authorize({
	name: "PMG Marketing Overview Form",
    interactive:false,
	scope: { write: true, read: true, account: true },
    success: onAuthorize
});

$("#connectLink")
.click(function(){
    Trello.authorize({
		name: "PMG Marketing Overview Form",
		scope: { write: true, read: true, account: true },
        type: "popup",
        success: onAuthorize
    })
});
    
$("#disconnect").click(logout);

	$( document ).ready(function() {
		
			
		$('[data-toggle="tooltip"]').tooltip();
		$('[data-toggle="popover"]').popover();
		
		
	
	});

	
</script>