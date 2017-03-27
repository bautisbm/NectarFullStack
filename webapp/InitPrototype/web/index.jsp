<%@page import="java.util.*, db.*" %>
<!DOCTYPE html>

<!-- Andrew Fuller -->

<html>
    <head>
        <title>SOL Test Scores</title>
        <!--<link href="hw4-sol.css" rel="stylesheet" type="text/css"> -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <h1>Query</h1>
        <!-- TODO Step 2: HTML Form -->

<form>
        <%
            String div_name = request.getParameter("div_name");
        %>
        <!--Division:<input type="text" name="div_name" id="div_name">-->
        
        
        
        <%--
          String sch_num = request.getParameter("sch_num");  
        --%>
        <!--sch_num:<input type="int" name="sch_num" id="sch_num">-->
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
                <%int[][] results = query.getData();%>
                
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
