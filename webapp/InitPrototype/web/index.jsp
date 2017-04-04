<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>


<html>
    <head>
        <title>Stem vs Non-Stem</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script source="https://w3.cs.jmu.edu/mayfiecs/cs474/project/gp4/divsch.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.13/css/jquery.dataTables.css">
        <script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.13/js/jquery.dataTables.js"></script>

        <script type="text/javascript">
            $(document).ready(function(){
                $('#non-stem').DataTable(); 
                $('#stem').DataTable();
            });		
        </script>
        
        <!--<link rel="stylesheet" type="text/css" href="background.css" />-->
         <!--    background-image: url("hottestMixtape2017.jpg"); -->
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
                background-image: url("hottestMixtape2017.jpg");
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;               
            }
        
        </style>
    </head>
    <body>
        <h1 style="text-align: center">Stem vs Non-Stem Academic Achievement</h1>

        <!-- TODO Step 2: HTML Form -->
	
	<a id ="postsec" href="postsecEnroll.jsp" >Click to view Post Secondary Enrollment</a>

        <form method="get">
        
        <label for="div_numStem">Stem Division:</label>
        <select name="div_numStem" id="div_numStem">
            <option value="7">Arlington County</option>
            <option value="18">Carroll County</option>
            <option value="21">Chesterfield County</option>
            <option value="29">Fairfax County</option>
            <option value="41">Halifax County</option>
            <option value="53">Loudoun County</option>
            <option value="60">Montgomery County</option>
            <option value="63">New Kent County</option>
            <option value="77">Pulaski County</option>
            <option value="80">Roanoke County</option>
            <option value="83">Russell County</option>
            <option value="89">Stafford County</option>
            <option value="112">Hampton City</option>
            <option value="113">Harrisonburg City</option>
            <option value="115">Lynchburg City</option>
            <option value="117">Newport News City</option>
            <option value="123">Richmond City</option>
            <option value="128">Virginia Beach City</option>
            <option value="136">Chesapeake City</option>
        </select>
        
        <%
            //String div_nameNonStem = request.getParameter("div_nameNonStem");
        %>
        <!--Division:<input type="text" name="div_name" id="div_name">-->
        <label for="div_num">Non-Stem Division:</label>
        <select id="div_num" name="div_num">
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

        <%
            //String subject = request.getParameter("subject");
        %>
        <!--Division:<input type="text" name="div_name" id="div_name">-->
        <label for="subject">Subject:</label>
        <select name="subject" id="subject">
            <option value="MATH">MATH</option>
            <option value="SCI">SCI</option>
            <option value="ENGR">ENGR</option>
            <option value="ENGW">ENGW</option>
            <option value="HIST">HIST</option>
        </select>

        
	<label for="race">Race:</label>
	<select name="race" id="race">
		<option value="ALL">ALL</option>
		<option value="0">unspecified</option>
		<option value="1">American Indian/Alaska Native</option>
		<option value="3">Black or African/American</option>
		<option value="4">Hispanic of any race</option>
		<option value="5">White</option>
		<option value="6">Native Hawaiian/Other Pacific Islander</option>
		<option value="99">Two or more races, non-Hispanic</option>
	</select>
        
        <br><br>
        
	<label for="gender">Gender:</label>
	<select name="gender" id="gender">
		<option value="ALL">ALL</option>
		<option value="M">M</option>
		<option value="F">F</option>
	</select>


	<label for="disabil">Disability:</label>
	<select name="disabil" id="disabil">
		<option value="ALL">ALL</option>
		<option value="Y">Y</optio n>
		<option value="N">N</option>
	</select>

	<label for="lep">LEP:</label>
	<select name="lep" id="lep">
		<option value="ALL">ALL</option>
		<option value="Y">Y</option>
		<option value="N">N</option>
	</select>

	<label for="disadva">Disadvantaged:</label>
	<select name="disadva" id="disadva">
		<option value="ALL">ALL</option>
		<option value="Y">Y</option>
		<option value="N">N</option>
	</select>
        <br><br>
	<input type="submit">
</form>
        <%
            Query query = new Query(request);
        %>
        <script>
            document.getElementById("div_numStem").value = "<%= query.div_numStem %>";
            document.getElementById("div_num").value = "<%= query.div_num %>";
            document.getElementById("subject").value = "<%= query.subject %>";
            document.getElementById("race").value = "<%= query.race %>";
            document.getElementById("gender").value = "<%= query.gender %>";
            document.getElementById("disabil").value = "<%= query.disabil %>";
            document.getElementById("lep").value = "<%= query.lep %>";
            document.getElementById("disadva").value = "<%= query.disadva %>";
        </script>

        
        
        
        <% 
           Object[] results = query.getNonStemData().toArray();                    
           Object[] results2 = query.getStemData().toArray();
        %>        
        
        <div style="align-content: center; max-width: 940px">
          <h1 style='text-align: center'>Results</h1>
            <div style="float: left;padding:10px">
                <!--<h2>Non-STEM</h2> -->
                <table style="text-align: center" id="non-stem" class="display">
                    <caption>Non-STEM</caption>
                    <thead>
                        <tr bgcolor="lightyellow">
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

            
            <div style="float: left;padding:10px">
              <!--  <h2>STEM</h2> -->
              <table style="text-align: center" id="stem" class="display">
                    <caption>STEM</caption>
                    <thead>
                        <tr bgcolor="lightyellow">
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
        

        <div id="chart_div" style="float: left; width: 700px; height: 350px; border: 1px solid black;"></div>
        <script type="text/javascript">
            google.charts.load('current', {packages: ['line']});
            google.charts.setOnLoadCallback(drawChart);

                
            function drawChart() {
                var data = new google.visualization.DataTable();

                data.addColumn('string', 'sch_year');
                //data.addColumn('string', 'div_name');
                data.addColumn('number', 'Non-Stem');
                data.addColumn('number', 'Stem');

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
                    title: 'Stem vs Non-Stem SOL Average Scores'
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
            }
            
            
        </script>
        


    </body>
</html>
