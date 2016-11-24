<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="/WEB-INF/views/Header.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Regestration</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- password validation script -->
<script type="text/javascript">
$(document).ready(function() {
	  $("#password2").keyup(validate);
	});


	function validate() {
	  var password1 = $("#password1").val();
	  var password2 = $("#password2").val();

	    
	 
	    if(password1 == password2) {
	       $("#validate-status").text("Passwords Match :)");        
	    }
	    else {
	        $("#validate-status").text("Passwords Don't Match :(");  
	    }
	    
	}
	</script>

<!-- country and state -->
<script>
var country_arr = new Array("Andaman and Nicobar Islands","Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chandigarh",
		"Chhattisgarh","Dadra and Nagar Haveli","Daman and Diu","Delhi","Goa","Gujarat","Haryana",
		"Himachal Pradesh","Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Lakshadweep","Madhya Pradesh","Maharashtra",
		"Manipur",
		"Meghalaya","Mizoram","Nagaland","Orissa","Pondicherry","Punjab","Rajasthan","Sikkim","Tamil Nadu","Tripura",
		"Uttar Pradesh","Uttaranchal","West Bengal");

// States
var s_a = new Array();
/* s_a[0]=""; */
s_a[1]="Alipur|Andaman Island| Anderson Island| Arainj-Laka-Punga| Austinabad| Bamboo Flat| Barren Island| Beadonabad|Betapur| Bindraban| Bonington| Brookesabad| Cadell Point| Calicut| Chetamale| Cinque Islands|Defence Island| Digilpur| Dolyganj| Flat Island| Geinyale| Great Coco Island| Haddo| Havelock Island| Henry Lawrence Island| Herbertabad| Hobdaypur| Ilichar| Ingoie| Inteview Island| Jangli Ghat| Jhon Lawrence Island| Karen|Kartara| KYD Islannd| Landfall Island|Little Andmand| Little Coco Island| Long Island| Maimyo| Malappuram| Manglutan| Manpur| Mitha Khari| Neill Island| Nicobar Island| North Brother Island| North Passage Island |North Sentinel Island| Nothen Reef Island| Outram Island| Pahlagaon| Palalankwe|Passage Island| Phaiapong| Phoenix Island| Port Blair| Preparis Island| Protheroepur| Rangachang| Rongat| Rutland Island| Sabari| Saddle Peak| Shadipur| Smith Island| Sound Island| South Sentinel Island| Spike Island| Tarmugli Island| Taylerabad| Titaije";
s_a[2]="Visakhapatnam	|Vijayawada|Guntur|	Nellore	|	Kurnool|	Kadapa	|	Rajahmundry|	Kakinada	|	Tirupati|	Anantapur|	Vizianagaram|	Eluru|	Ongole|	Nandyal|	Machilipatnam|	Adoni|	Tenali|	Proddatur	|	Chittoor|	Hindupur	|	Bhimavaram	|	Madanapalle	|	Guntakal	|	Srikakulam	|	Dharmavaram	|	Gudivada	|	Narasaraopet	|	Tadipatri	|	Tadepalligudem|	Amaravati|	Chilakaluripet";
s_a[3]="Aalo|Bhimsmaknagar|Itanagar|Tawang";
s_a[4]="Ara|Begusarai|Bhagalpur|Dharbanga|Gaya|Muzaffarpur|Patna|Purnia";
s_a[5]="Haryana|Naya Gaon|Panchakula|SAS Nagar";
s_a[6]="Ambikapur|Bilaspur|Bhilai|Dhamatri|Jagdalpur|Korba|Raigarh|Raipur|RajNangoan|";
s_a[7]="Dadra|Masat|Naroli|Samarvarni|Silvassa";
s_a[8]="Diu|Dharmapur|Umbergaon|Valsad|Vapi";
s_a[9]="Qutabgarh|Ujwa";
s_a[10]="";
s_a[11]="";
s_a[12]="";
s_a[13]="";
s_a[14]="";
s_a[15]="";
s_a[16]="";
s_a[17]="";
s_a[18]="";
s_a[19]="";
s_a[20]="";
s_a[21]="";
s_a[22]="";
s_a[23]="";
s_a[24]="";
s_a[25]="";
s_a[26]="";
s_a[27]="";
s_a[28]="";
s_a[29]="";
s_a[30]="";
s_a[31]="chennai|madurai";
s_a[32]="";
s_a[33]="";
s_a[34]="";
s_a[35]="Kolkatta";
function populateStates( countryElementId, stateElementId ){
	
	var selectedCountryIndex = document.getElementById( countryElementId ).selectedIndex;

	var stateElement = document.getElementById( stateElementId );
	
	stateElement.length=0;	// Fixed by Julian Woods
	stateElement.options[0] = new Option('Select City','-1');
	stateElement.selectedIndex = 0;
	
	var state_arr = s_a[selectedCountryIndex].split("|");
	
	for (var i=0; i<state_arr.length; i++) {
		stateElement.options[stateElement.length] = new Option(state_arr[i],state_arr[i]);
	}
}

function populateCountries(countryElementId, stateElementId){
	// given the id of the <select> tag as function argument, it inserts <option> tags
	var countryElement = document.getElementById(countryElementId);
	countryElement.length=0;
	countryElement.options[0] = new Option('Select State','-1');
	countryElement.selectedIndex = 0;
	for (var i=0; i<country_arr.length; i++) {
		countryElement.options[countryElement.length] = new Option(country_arr[i],country_arr[i]);
	}

	// Assigned all countries. Now assign event listener for the states.

	if( stateElementId ){
		countryElement.onchange = function(){
			populateStates( countryElementId, stateElementId );
		};
	}
}
</script>


<style>
h1 {
	font-size: 24px;
	color: white;
	font-weight: 600;
	margin-bottom: 30px;
	font-size: 24px;
}

.navbar {
	background-color: #660033;
	font-size: 18px !important;
}

.navbar .navbar-brand {
	color: #FFFFFF !important;
}

.navbar .li a {
	color: #FFF !important;
}

.navbar-nav li a:hover, .navbar-nav li.active a {
	color: #660033 !important;
	background-color: #FFCCCC !important;
}

.navbar-default .navbar-toggle {
	border-color: transparent;
	color: #FFCCCC !important;
}

footer .glyphicon {
	font-size: 24px;
	margin-bottom: 20px;
	color: #660033;
}

@media screen and (max-width: 768px) {
	.col-lg-4 {
		text-align: center;
		margin: 25px 0;
	}
	.btn-lg {
		width: 100%;
		margin-bottom: 35px;
	}
}

@media screen and (max-width: 480px) {
	.logo {
		font-size: 150px;
	}
}
</style>

</head>
<body id="myPage" style="background-color:  #FFCCCC">
		<center>
			<font face="Harlow Solid Italic"><h1>Registration</h1></font>
			<div class="container">
				<form:form action="reg" method="post" commandName="user"
					class="form-horizontal" role="form">
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="firstname">
							<spring:message text="First Name" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="firstname" class="form-control"
								placeholder="Enter first name" required="true"
								title="should not be empty" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="lastname">
							<spring:message text="Last Name" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input path="lastname" class="form-control"
								placeholder="Enter last name" required="true"
								title="should not be empty" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="age">
							<spring:message text="Age" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input type="number" min="18" path="age"
								class="form-control" placeholder="Enter age" required="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="gender">
							<spring:message text="Gender" />
						</form:label>
						<div class="col-lg-4 ">
							<form:radiobutton path="gender" name="optradio" value="Male" />
							Male
							<form:radiobutton path="gender" name="optradio" value="Female" />
							Female
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="mobileno">
							<spring:message text="Mobile No" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input pattern="[789][0-9]{9}" path="mobileno"
								class="form-control" placeholder="Enter mobile no"
								required="true"
								title="should be in the form of 10 digit starting with 789!" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="emailid">
							<spring:message text="E-Mail Id" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input type="email" path="emailid" class="form-control"
								placeholder="Enter email" required="true"
								title="should be in the form of abc@example.com" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="address">
							<spring:message text="Address" />
						</form:label>
						<div class="col-lg-4 ">
							<form:textarea class="form-control" type="text" rows="5"
								max="100" path="address" required="true"></form:textarea>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="country">
							<spring:message text="City" />
						</form:label>
						<div class="col-lg-4 ">
							<form:select name="country" id="country" path="country"
								class="form-control" placeholder="Enter " required="true" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="state">
							<spring:message text="State" />
						</form:label>
						<div class="col-lg-4 ">
							<form:select name="state" id="state" path="state"
								class="form-control" placeholder="Enter " required="true" />
						</div>
					</div>
					<br>
					<br>
					<script language="javascript">
							populateCountries("state","country");
							populateStates("state","country");
						</script>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="pincode">
							<spring:message text="Pincode" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input type="text" path="pincode" class="form-control"
								placeholder="Enter " required="true" title="should not be empty" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="username">
							<spring:message text="User Name" />
						</form:label>
						<div class="col-lg-4 ">
							<form:input type="text" path="username" class="form-control"
								placeholder="Enter user name as abc@example.com" required="true"
								title="should not be empty"/>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="password">
							<spring:message text="Password" />
						</form:label>
						<div class="col-lg-4 ">
							<form:password id="password1" path="password"
								class="form-control" placeholder="Enter password"
								required="true" title="should not be empty" />
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<form:label class="col-lg-4 control-label" path="password">
							<spring:message text="Re-Password" />
						</form:label>
						<div class="col-lg-4 ">
							<form:password id="password2" path="confirmpassword"
								class="form-control" placeholder="Re-Enter password"
								required="true" title="should be same as password" />
							<p id="validate-status"></p>
							<form:errors style="color:red" path="password" cssClass="error" />
						</div>
					</div>
					<br>
					<br>

					<form:button type="submit" class="btn btn-success">
						<spring:message text="Submit" />
					</form:button>
					<form:button type="reset" class="btn btn-danger">
						<spring:message text="Reset" />
					</form:button>
				</form:form>
			</div>

		</center>
	<br>
	<br>
	<%@include file="Footer.jsp"%>
</body>
</html>