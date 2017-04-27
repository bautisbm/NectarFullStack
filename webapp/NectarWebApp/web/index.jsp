<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stem vs Non-Stem Academic Achievement</title>
    
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script source="https://w3.cs.jmu.edu/mayfiecs/cs474/project/gp4/divsch.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="toolbar.css">
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>
        
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('#non-stem').DataTable(); 
                $('#stem').DataTable();
            });		
        </script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('#non-stem2').DataTable(); 
                $('#stem2').DataTable();
            });		
        </script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                $('#non-stem3').DataTable(); 
                $('#stem3').DataTable();
            });		
        </script>
        
        
         <style>
             
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 10px;
            }
            caption {
                font-weight: bold;
                font-size: 150%;
            }
            body {
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;               
            }
            
            
            
        </style>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="css/freelancer.min.css" rel="stylesheet">
    
    

    <!-- Custom Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    
    <link href="css/styles.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Data-bassnectar</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#mission">Our Mission</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#grad">Graduation Rate</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#sol">SOL Scores</a>
                    </li>
                    <li class="page-scroll">
                        <a href="#post">Postsecondary Enrollment</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container" id="maincontent" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                        <h1 class="name">Stem vs Non-Stem Academic Achievement</h1>
                        <hr class="whiteLine">
                        <span class="skills">Apps4VA, Team: Data-bassnectar</span>
                        <p>Brandon Bautista, Mike Bittner, Connor Fowler, Andrew Fuller</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    
     <!-- Mission Section -->
    <section class="success" id="mission">
        <div class="container">
            
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class = "missionHeadline">Our Mission</h2>
                    <hr class="blueLine">
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-4">
                    <h2>Graduation Rate</h2>
                    <p class = "blackText">We take a look at the number of diplomas received from students who attend STEM and Non-STEM schools to show a positive correlation between attending a STEM academy and higher graduation rates</p>
                </div>
                <div class="col-lg-4">
                    <h2>SOL Scores</h2>
                    <p class = "blackText">We examine the SOL scores from STEM and Non-STEM schools in order to prove the that the average SOL scores from STEM schools tend to be higher</p>
                </div>
                
                <div class = "col-lg-4">
                    <h2>Post Sec Enrollment</h2>
                    <p class = "blackText">We hope to demonstrate that those who attend STEM academies tend to have a higher admittance rate to colleges and universities</p>
                </div> 
               
            </div>
        </div>
    </section>
     
     
     <section class = "navyBckgrnd">
          <div class ="row">
            <div class ="col-md-12">
                
                <h2 class = "whiteText">Select Counties to Compare</h2>
                <hr class="whiteLine">
                
            </div><!-- end of col --> 
        </div><!-- end of row --> 
         
          <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                 <form method="get">
 
        <label class ="paddingLeft" for="div_numStem">Stem Division:</label>
        <select name="div_numStem" id="div_numStem">
            <option disabled selected value> Arlington County - 2008 </option>
            <option value="7">Arlington County - 2008</option>
            <option value="18">Carroll County - 2011</option>
            <option value="21">Chesterfield County - 2010</option>
            <option value="29">Fairfax County - 2013</option>
            <option value="41">Halifax County - 2008</option>
            <option value="53">Loudoun County - 2008</option>
            <option value="60">Montgomery County - 2013</option>
            <option value="63">New Kent County - 2012</option>
            <option value="77">Pulaski County - 2013</option>
            <option value="80">Roanoke County - 2012</option>
            <option value="83">Russell County - 2008</option>
            <option value="89">Stafford County - 2008</option>
            <option value="112">Hampton City - 2014</option>
            <option value="113">Harrisonburg City - 2013</option>
            <option value="115">Lynchburg City - 2013</option>
            <option value="117">Newport News City - 2013</option>
            <option value="123">Richmond City - 2009</option>
            <option value="128">Virginia Beach City - 2012</option>
            <option value="136">Chesapeake City - 2012</option>
        </select>
        
        <label class ="paddingLeft" for="div_num">Non-Stem Division:</label>
        <select id="div_num" name="div_num">
                <option disabled selected value> Accomack County </option>            
         	<option value="1">Accomack County</option>
        	<option value="2">Albemarle County</option>
        	<option value="101">Alexandria City</option>
        	<option value="3">Alleghany County</option>
        	<option value="4">Amelia County</option>
        	<option value="5">Amherst County</option>
        	<option value="6">Appomattox County</option>
        	<option value="8">Augusta County</option>
        	<option value="9">Bath County</option>
        	<option value="10">Bedford County</option>
        	<option value="11">Bland County</option>
        	<option value="12">Botetourt County</option>
        	<option value="102">Bristol City</option>
        	<option value="13">Brunswick County</option>
        	<option value="14">Buchanan County</option>
        	<option value="15">Buckingham County</option>
        	<option value="103">Buena Vista City</option>
        	<option value="16">Campbell County</option>
        	<option value="17">Caroline County</option>
        	<option value="19">Charles City County</option>
        	<option value="20">Charlotte County</option>
        	<option value="104">Charlottesville City</option>
        	<option value="22">Clarke County</option>
        	<option value="202">Colonial Beach</option>
        	<option value="106">Colonial Heights City</option>
        	<option value="107">Covington City</option>
        	<option value="23">Craig County</option>
        	<option value="24">Culpeper County</option>
        	<option value="25">Cumberland County</option>
        	<option value="108">Danville City</option>
        	<option value="26">Dickenson County</option>
        	<option value="27">Dinwiddie County</option>
        	<option value="28">Essex County</option>
        	<option value="109">Falls Church City</option>
        	<option value="30">Fauquier County</option>
        	<option value="31">Floyd County</option>
        	<option value="32">Fluvanna County</option>
        	<option value="135">Franklin City</option>
        	<option value="33">Franklin County</option>
        	<option value="34">Frederick County</option>
        	<option value="110">Fredericksburg City</option>
        	<option value="111">Galax City</option>
        	<option value="35">Giles County</option>
        	<option value="36">Gloucester County</option>
        	<option value="37">Goochland County</option>
        	<option value="38">Grayson County</option>
        	<option value="39">Greene County</option>
        	<option value="40">Greensville County</option>
        	<option value="42">Hanover County</option>
        	<option value="43">Henrico County</option>
        	<option value="44">Henry County</option>
        	<option value="45">Highland County</option>
        	<option value="114">Hopewell City</option>
        	<option value="46">Isle of Wight County</option>
        	<option value="49">King and Queen County</option>
        	<option value="48">King George County</option>
        	<option value="50">King William County</option>
        	<option value="51">Lancaster County</option>
        	<option value="52">Lee County</option>
        	<option value="137">Lexington City</option>
        	<option value="54">Louisa County</option>
        	<option value="55">Lunenburg County</option>
        	<option value="56">Madison County</option>
        	<option value="143">Manassas City</option>
        	<option value="144">Manassas Park City</option>
        	<option value="116">Martinsville City</option>
        	<option value="57">Mathews County</option>
        	<option value="58">Mecklenburg County</option>
        	<option value="59">Middlesex County</option>
        	<option value="62">Nelson County</option>
        	<option value="118">Norfolk City</option>
        	<option value="65">Northampton County</option>
        	<option value="66">Northumberland County</option>
        	<option value="119">Norton City</option>
        	<option value="67">Nottoway County</option>
        	<option value="68">Orange County</option>
        	<option value="69">Page County</option>
        	<option value="70">Patrick County</option>
        	<option value="120">Petersburg City</option>
        	<option value="71">Pittsylvania County</option>
        	<option value="142">Poquoson City</option>
        	<option value="121">Portsmouth City</option>
        	<option value="72">Powhatan County</option>
        	<option value="73">Prince Edward County</option>
        	<option value="74">Prince George County</option>
        	<option value="75">Prince William County</option>
        	<option value="122">Radford City</option>
        	<option value="78">Rappahannock County</option>
        	<option value="79">Richmond County</option>
        	<option value="124">Roanoke City</option>
        	<option value="81">Rockbridge County</option>
        	<option value="82">Rockingham County</option>
        	<option value="139">Salem City</option>
        	<option value="84">Scott County</option>
        	<option value="85">Shenandoah County</option>
        	<option value="86">Smyth County</option>
        	<option value="87">Southampton County</option>
        	<option value="88">Spotsylvania County</option>
        	<option value="126">Staunton City</option>
        	<option value="127">Suffolk City</option>
        	<option value="90">Surry County</option>
        	<option value="91">Sussex County</option>
        	<option value="92">Tazewell County</option>
        	<option value="93">Warren County</option>
        	<option value="94">Washington County</option>
        	<option value="130">Waynesboro City</option>
        	<option value="95">Westmoreland County</option>
        	<option value="207">West Point</option>
        	<option value="131">Williamsburg-James City County</option>
        	<option value="132">Winchester City</option>
        	<option value="96">Wise County</option>
        	<option value="97">Wythe County</option>
        	<option value="98">York County</option>
        </select>
        <br><br>
        
         <label class ="paddingLeft" for="subject">Subject:</label>
        <select name="subject" id="subject">
            <option disabled selected value> -- select an option -- </option>            
            <option value="MATH">MATH</option>
            <option value="SCI">SCI</option>
            <option value="ENGR">ENGR</option>
            <option value="ENGW">ENGW</option>
            <option value="HIST">HIST</option>
        </select>

        <br><br>
        
	<input type="submit">
    </form>
            </div> <!-- end of col --> 
        </div> <!-- end of row 2 --> 
         
         
         
         
         
     </section>
    
    <!-- Graduation Rate Section -->
    <section class="greySection" id="grad">
        
        <div class ="row">
            <div class ="col-md-12">
                
                <h2 class = "missionHeadline">Graduation Rates</h2>
                <hr class="blueLine">
                
            </div><!-- end of col --> 
        </div><!-- end of row --> 
                
       
        
          <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                   <div style="align-content: center; ">
           
          <h2 id = "subheadline">Results</h2>
            </div>
        <div id="chart_div2" style="float: left; width: 100%; height: 350px; border: 1px solid black;"></div>
            </div> 
        </div> 
        
        
        <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                
        <%
            GraduateCountAction graduateAction = new GraduateCountAction(request);
        %>  
        </tbody>

        <script>
            document.getElementById("div_numStem").value = "<%= graduateAction.div_numStem %>";
            document.getElementById("div_num").value = "<%= graduateAction.div_num %>";
            var stem_grad_div_ID = document.getElementById("div_numStem");
            var stem_grad_div = stem_grad_div_ID.options[stem_grad_div_ID.selectedIndex].text;
            var grad_div_ID = document.getElementById("div_num");
            var grad_div = grad_div_ID.options[grad_div_ID.selectedIndex].text;
        </script>


        <% 
           Object[] nonStemG = graduateAction.getNonStemData().toArray();                    
           Object[] stemG = graduateAction.getStemData().toArray();
        %>       
        
     
            <div style="align-content: center; max-width: 940px">
          <h1 style='text-align: center'></h1>
            <div style="float: left;padding:10px">
                <!--<h2>Non-STEM</h2> -->
                <table style="text-align: center" id="non-stem3" class="display">
                    <caption>Non-STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Graduate Count</th>
                        </tr>
                    </thead>
                        <tbody>

                           <%
                                for(int x = 0; x < nonStemG.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + nonStemG[x].toString() + "</td>");
                                    out.println("<td>" + nonStemG[x + 1].toString() + "</td>");
                                    out.println("<td>" + nonStemG[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");
                            %>  
                        </tbody>
                </table>
            </div>

            
            <div style="float: left;padding:10px">
              <!--  <h2>STEM</h2> -->
              <table style="text-align: center" id="stem3" class="display">
                    <caption>STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Graduate Count</th>
                        </tr>
                    </thead>
                        <tbody>

                           <%
                                for(int x = 0; x < stemG.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + stemG[x].toString() + "</td>");
                                    out.println("<td>" + stemG[x + 1].toString() + "</td>");
                                    out.println("<td>" + stemG[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");
                            %>  
                        </tbody>
                </table>
            </div>
        </div>
                        
                
        
        <%
            Object[] nonStemGradPercentage = graduateAction.getAvgNonStemData().toArray();                    
            Object[] stemGradPercentage = graduateAction.getAvgStemData().toArray();      
        %>
        
        <script type="text/javascript">
            google.charts.load('current', {packages: ['line']});
            google.charts.setOnLoadCallback(drawChart);
                
            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'sch_year');
                data.addColumn('number', grad_div);
                data.addColumn('number', stem_grad_div);
                data.addRows([
                
                <%
                    for(int x = 0; x < stemGradPercentage.length; x += 2)
                    {
                        out.println("[ ");
                        out.println("\"" + stemGradPercentage[x].toString() + "\",");
                        out.println(nonStemGradPercentage[x + 1]  + ",");
                        if (x < stemGradPercentage.length)
                            out.println(stemGradPercentage[x + 1]  + ",");
                        out.println(" ], "); 
                        
                    }                 
                %>                                   
                ]);
               
          
                var options = {
                    chart: {
                    title: 'Stem vs Non-Stem Graduation Rates'
                     },                
                    
                    hAxis: {
                        title: 'Year'
                    },
                    vAxis: {
                        title: 'Graduate Percentage'
                    }
                };
                var chart = new google.charts.Line(document.getElementById('chart_div2'));
                chart.draw(data, google.charts.Line.convertOptions(options));
                
                $(window).resize(function(){
                    drawChart();
                });
            }

            
        </script>
                
            </div> 
        </div><!-- end of row 3 --> 

    </section>

    <!-- Portfolio Grid Section -->
    <section id="sol">
        
        <div class ="row">
            <div class ="col-md-12">
                
                <h2 class = "missionHeadline">SOL Scores</h2>
                <hr class="blueLine">
                
            </div><!-- end of col --> 
        </div><!-- end of row --> 

         
                
        <div class ="row">
            <div class ="col-md-7 col-md-offset-2">
                 <form method="get">
 
        
</form>
            </div> <!-- end of col --> 
        </div> <!-- end of row 2 --> 
        
          <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                   <div style="align-content: center; ">
           
          <h2 id = "subheadline">Results</h2>
            </div>
        <div id="chart_div" style="float: left; width: 100%; height: 350px; border: 1px solid black;"></div>
            </div> 
        </div> 
        
        
        <div class ="row">
            <div class ="col-md-10 col-md-offset-2">
                
        <%
            Query query = new Query(request);
        %>  
        </tbody>

        <script>
            document.getElementById("div_numStem").value = "<%= query.div_numStem %>";
            document.getElementById("div_num").value = "<%= query.div_num %>";
            document.getElementById("subject").value = "<%= query.subject %>";
            var stem_sol_div_ID = document.getElementById("div_numStem");
            var stem_sol_div = stem_sol_div_ID.options[stem_sol_div_ID.selectedIndex].text;
            var non_stem_sol_div_ID = document.getElementById("div_num");
            var non_stem_sol_div = non_stem_sol_div_ID.options[non_stem_sol_div_ID.selectedIndex].text;
        </script>


        
        
        
        <% 
           Object[] results = query.getNonStemData().toArray();                    
           Object[] results2 = query.getStemData().toArray();
        %>        
        
     
            <div style="float: left;padding:20px">
                <!--<h2>Non-STEM</h2> -->
                <table style="text-align: center" id="non-stem" class="display">
                    <caption>Non-STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Score</th>
                        </tr>
                    </thead>
                        <tbody>

                           <%
                                for(int x = 0; x < results.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + results[x].toString() + "</td>");
                                    out.println("<td>" + results[x + 1].toString() + "</td>");
                                    out.println("<td>" + results[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");

                            %>  
                        </tbody>
                </table>
            </div>

            
            <div style="float: left;padding:20px">
              <!--  <h2>STEM</h2> -->
              <table style="text-align: center" id="stem" class="display">
                    <caption>STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Score</th>
                        </tr>
                    </thead>
                        <tbody>
                            <%
                                for(int x = 0; x < results2.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + results2[x].toString() + "</td>");
                                    out.println("<td>" + results2[x + 1].toString() + "</td>");
                                    out.println("<td>" + results2[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");
                            %>  
                        </tbody>
                </table>
            </div>
        </div>
                        
                
        
        <%
            Object[] stem = query.getAvgStemData().toArray();    
            Object[] non_stem =  query.getAVGNonStemData().toArray();      
        %>
        
      <!-- put back here amanda --> 
        <script type="text/javascript">
            google.charts.load('current', {packages: ['line']});
            google.charts.setOnLoadCallback(drawChart);

                
            function drawChart() {
                var data = new google.visualization.DataTable();

                data.addColumn('string', 'sch_year');
                data.addColumn('number', non_stem_sol_div);
                data.addColumn('number', stem_sol_div);

                data.addRows([
                
                <%
                    for(int x = 0; x < non_stem.length; x += 3)
                    {

                        out.println("[ ");
                        out.println("\"" + non_stem[x].toString() + "\",");
                        //out.println("\"" + res[x + 1].toString() + "\",");
                        out.println(non_stem[x + 2]  + ",");
                        if (x < stem.length)
                            out.println(stem[x + 2]  + ",");
                        out.println(" ], "); 
                        
                    }                 
                 %>                                   
                ]);
               
          
                var options = {
                    chart: {
                    title: 'Stem vs Non-Stem Average Scores'
                     },                
                    
                    hAxis: {
                        title: 'Year'
                    },
                    vAxis: {
                        title: 'Score'
                    },

                };

                var chart = new google.charts.Line(document.getElementById('chart_div'));
                chart.draw(data, google.charts.Line.convertOptions(options));
                
                $(window).resize(function(){
                    drawChart();
                });
            }
            
            </script>
                
            </div> 
        </div><!-- end of row 3 --> 

        
    </section>
                
    <section class="greySection" id="post">
        
        <div class ="row">
            <div class ="col-md-12">
                
                <h2 class = "missionHeadline">Postsecondary Enrollment</h2>
                <hr class="blueLine">
                
            </div><!-- end of col --> 
        </div><!-- end of row --> 
                
        <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                 <form method="get">
</form>
            </div> <!-- end of col --> 
        </div> <!-- end of row 2 --> 
        
          <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                   <div style="align-content: center; ">
           
          <h2 id = "subheadline">Results</h2>
            </div>
        <div id="chart_div1" style="float: left; width: 100%; height: 350px; border: 1px solid black;"></div>
            </div> 
        </div> 
        
        
        <div class ="row">
            <div class ="col-md-6 col-md-offset-3">
                
        <%
            PostsecEnrollAction action = new PostsecEnrollAction(request);
        %>  
        </tbody>

        <script>
            document.getElementById("div_numStem").value = "<%= action.div_numStem %>";
            document.getElementById("div_num").value = "<%= action.div_num %>";
            var stem_postsec_div_ID = document.getElementById("div_numStem");
            var stem_postsec_div = stem_postsec_div_ID.options[stem_postsec_div_ID.selectedIndex].text;
            var non_stem_postsec_div_ID = document.getElementById("div_num");
            var non_stem_postsec_div = non_stem_postsec_div_ID.options[non_stem_postsec_div_ID.selectedIndex].text;
        </script>


        <% 
           Object[] nonStem = action.getNonStemData().toArray();                    
           Object[] stem1 = action.getStemData().toArray();
        %>       
        
     
            <div style="align-content: center; max-width: 940px">
          <h1 style='text-align: center'></h1>
            <div style="float: left;padding:10px">
                <!--<h2>Non-STEM</h2> -->
                <table style="text-align: center" id="non-stem2" class="display">
                    <caption>Non-STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Enrollment Total</th>
                        </tr>
                    </thead>
                        <tbody>

                           <%
                                for(int x = 0; x < nonStem.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + nonStem[x].toString() + "</td>");
                                    out.println("<td>" + nonStem[x + 1].toString() + "</td>");
                                    out.println("<td>" + nonStem[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");
                            %>  
                        </tbody>
                </table>
            </div>

            
            <div style="float: left;padding:10px">
              <!--  <h2>STEM</h2> -->
              <table style="text-align: center" id="stem2" class="display">
                    <caption>STEM</caption>
                    <thead>
                        <tr bgcolor=#e9f4fc>
                            <th>Year</th>
                            <th>School</th>
                            <th>Enrollment Total</th>
                        </tr>
                    </thead>
                        <tbody>

                           <%
                                for(int x = 0; x < stem.length; x += 3)
                                {
                                    out.println("<tr>");
                                    out.println("<td>" + stem1[x].toString() + "</td>");
                                    out.println("<td>" + stem1[x + 1].toString() + "</td>");
                                    out.println("<td>" + stem1[x + 2].toString() + "</td>");
                                    out.println("</tr>");
                                }
                                    out.println("</tr>");
                            %>  
                        </tbody>
                </table>
            </div>
        </div>
                        
                
        
        <%
            Object[] nonStem2 = action.getAvgNonStemData().toArray();                    
            Object[] stem2 = action.getAvgStemData().toArray();      
        %>
        
      <!-- put back here amanda --> 
        <script type="text/javascript">
            google.charts.load('current', {packages: ['line']});
            google.charts.setOnLoadCallback(drawChart);
                
            function drawChart() {
                var data = new google.visualization.DataTable();
                data.addColumn('string', 'sch_year');
                data.addColumn('number', non_stem_postsec_div);
                data.addColumn('number', stem_postsec_div);
                data.addRows([
                
                <%
                    for(int x = 0; x < nonStem2.length; x += 2)
                    {
                        out.println("[ ");
                        out.println("\"" + nonStem2[x].toString() + "\",");
                        out.println(nonStem2[x + 1]  + ",");
                        if (x < stem2.length)
                            out.println(stem2[x + 1]  + ",");
                        out.println(" ], "); 
                        
                    }                 
                %>                                   
                ]);
               
          
                var options = {
                    chart: {
                    title: 'Stem vs Non-Stem Enrollment Total'
                     },                
                    
                    hAxis: {
                        title: 'Year'
                    },
                    vAxis: {
                        title: 'Enrollment Total'
                    },
                };
                var chart = new google.charts.Line(document.getElementById('chart_div1'));
                chart.draw(data, google.charts.Line.convertOptions(options));
                
                $(window).resize(function(){
                    drawChart();
                });
            }
            
            
        </script>
                
            </div> 
        </div><!-- end of row 3 --> 

    </section>

    <!-- Footer -->
    <footer class="text-center">
        <div class="footer-above">
            <div class="container">
                <div class="row">
                    <div class="footer-col col-md-4">
                        <h3>Location</h3>
                        <p>800 South Main Street
                            <br>Harrisonburg, VA 22807</p>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>Back to Top</h3>
                        <ul class="list-inline">
                            <li>
                                <a href="#" class="btn-social btn-outline"><span class="sr-only">Facebook</span><i class="fa fa-angle-up"></i></a>
                            </li>
     
                        </ul>
                    </div>
                    <div class="footer-col col-md-4">
                        <h3>About Freelancer</h3>
                        <p>Brandon, Mike, Connor, and Andrew are all senior CS majors at JMU</a>.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; 2016
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
    <div class="scroll-top page-scroll hidden-sm hidden-xs hidden-lg hidden-md">
       
            <i class="fa fa-chevron-up"></i>
        
    </div>



    <!-- Plugin JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>

    <!-- Theme JavaScript -->
    <script src="js/freelancer.min.js"></script>

</body>

</html>
