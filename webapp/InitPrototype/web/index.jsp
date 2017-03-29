<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>

<!-- Andrew Fuller -->

<html>
    <head>
        <title>SOL Test Scores</title>
        <!--<link href="hw4-sol.css" rel="stylesheet" type="text/css"> -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <!--<link rel="stylesheet" type="text/css" href="background.css" />-->
    </head>
    <body>
        <h1>Query</h1>
        <!-- TODO Step 2: HTML Form -->

<form>
        <%
            String div_nameStem = request.getParameter("div_name");
        %>
        <!--Division:<input type="text" name="div_name" id="div_name">-->
        <label for="div_name">Stem Division:</label>
        <select name="div_name" id="div_numStem">
            <option value="0">ALL</option>
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
            String div_nameNonStem = request.getParameter("div_name");
        %>
        <!--Division:<input type="text" name="div_name" id="div_name">-->
        <label for="div_name">Non-Stem Division:</label>
        <select name="div_name" id="div_numNonStem">
            <option value="0">ALL</option>
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
		<option value="Y">Y</option>
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
            document.getElementById("div_name").value = "<%= query.div_name %>";
            document.getElementById("subject").value = "<%= query.subject %>";
            document.getElementById("race").value = "<%= query.race %>";
            document.getElementById("gender").value = "<%= query.gender %>";
            document.getElementById("disabil").value = "<%= query.disabil %>";
            document.getElementById("lep").value = "<%= query.lep %>";
            document.getElementById("disadva").value = "<%= query.disadva %>";
        </script>

        <!--
        <h1>Results</h1>
        <table style="text-align: center">
            <thead>
                <tr bgcolor="lightyellow">
                    <th>sch_year</th>
                    <th>ENGR</th>
                    <th>ENGW</th>
                    <th>HIST</th>
                    <th>MATH</th>
                    <th>SCI</th>
                </tr>
            </thead>
            <tbody>
                <!-- TODO Step 4: HTML Table 
                <%//int[][] results = query.getData();%>
                
                <%
                  /*for(int x = 0; x < 9; x++)
                  {
                       if(x%2==0)
                           out.println("<tr bgcolor='red'>");
                       else
                           out.println("<tr bgcolor='orange'>");
                       for(int y = 0; y < 6; y++)
                       { 
                           out.println("<td>" + results[x][y] + "</td>");
                       }
                       out.println("</tr>");
                  }*/
                %>    
            </tbody>
        </table>
        -->
        
        
        <h1>Chart</h1>
        <div id="chart_div" style="width: 700px; height: 350px;"></div>
<!--
        <script type="text/javascript">
            google.charts.load('current', {packages: ['corechart', 'line']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = new google.visualization.DataTable();

                data.addColumn('string', 'sch_year');
                data.addColumn('number', 'ENGR');
                data.addColumn('number', 'ENGW');
                data.addColumn('number', 'HIST');
                data.addColumn('number', 'MATH');
                data.addColumn('number', 'SCI');

                //int[][] results = query.getData();

                data.addRows([
                    // TODO Step 5: JavaScript Data
                            <%-- <%
                                 /*
                                 //this
                                for(int x = 0; x < 9; x++)
                                {
                                    //is
                                    */
                             %>
                                    //["<%= //results[x][0]%>",
                             <%
                                 /*
                                    //wicked
                                    for(int y = 1; y < 6; y++)
                                    {
                                    */
                             %>
                                         /*
                                         //confusing
                                         <%=// results[x][y]%>,
                                             */
                             <%
                                    //}
                             %>// ],
                             <%
                                //}   
                             %>
                            --%>
                ]);

                var options = {
                    hAxis: {
                        title: 'Year'
                    },
                    vAxis: {
                        title: 'Score'
                    },
                };

                var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
                chart.draw(data, options);
            }
        </script>
-->
    </body>
</html>
