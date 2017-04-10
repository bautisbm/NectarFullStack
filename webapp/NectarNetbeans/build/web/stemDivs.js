var divisions = [ 
	[7, "Arlington County"],
	[18, "Carroll County"],
	[21, "Chesterfield County"],
    [29, "Fairfax County"],
    [41, "Halifax County"],
    [53, "Loudoun County"],
    [60, "Montgomery County"],
    [63, "New Kent County"],
    [77, "Pulaski County"],
    [80, "Roanoke County"],
    [83, "Russell County"],
    [89, "Stafford County"],
    [112, "Hampton City"],
    [113, "Harrisonburg City"],
    [115, "Lynchburg City"],
    [117, "Newport News City"],
    [123, "Richmond City"],
    [128, "Virginia Beach City"],
    [136, "Chesapeake City"]
];

var schools = {
    7: [[618, "Arlington Mill High "],  [450, "Wakefield High"], [80, "Washington Lee High"], [330, "Yorktown High"]],
	18: [[1230, "Carroll County High"]],
	21: [[740, "Clover Hill High"], [840, "Cosby High"], [770, "James River High"], [10, "Lloyd C. Bird High"], [632, "Manchester High"], [530, "Matoaca High"], [580, "Meadowbrook High"], [320, "Midlothian High"], [280, "Monacan High"], [610, "Thomas Dale High"]],
	29: [[20,"Fairfax High"],[660,"Annandale High"],[131,"Chantilly High"],[2201,"Bryant Alternative High"],[1260,"Woodson High"],[1710,"Oakton High"],[1060,"Madison High"],[2228,"Westfield High"],[790,"McLean High"],[900,"West Potomac High"],[420,"Mount Vernon High"],[32,"Herndon High"],[1371,"Thomas Jefferson High for Science and Technology"],[2211,"Mountain View Alternative High"],[1070,"Stuart High"],[1990,"South Lakes High"],[190,"Fairfax County Adult High"],[1270,"Edison High"],[200,"Centreville High"],[1290,"Marshall High"],[1020,"Lee High"],[1610,"West Springfield High"],[1100,"Falls Church High"],[1460,"Langley High"],[2241,"South County High"]],
	41: [[10,"Halifax County High"]],
	53: [[1060,"Rock Ridge High"],[680,"Loudoun Valley High"],[31,"Dominion High"],[370,"John Champe High School"],[850,"Stone Bridge High"],[60,"Park View High"],[590,"Woodgrove High"],[200,"Tuscarora High"],[420,"Briar Woods High"],[140,"Potomac Falls High"],[120,"Freedom High"],[900,"Heritage High"],[740,"Broad Run High"],[660,"Loudoun County High"]],
	60: [[650,"Auburn High"],[904,"Eastern Montgomery High"],[760,"Blacksburg High"],[770,"Christiansburg High"]],
	63: [[20, "New Kent High"]],
	77: [[10, "Pulaski County Senior High"]],
	80: [[610,"Glenvar High"],[520,"Northside High"],[630,"William Byrd High"],[754,"Hidden Valley High"],[470,"Cave Spring High"]],
	83: [[140,"Lebanon High"],[791,"Castlewood High"],[540,"Honaker High"]],
	89: [[20,"Stafford Senior High"],[421,"Brooke Point High"],[430,"Mountain View High"],[30,"North Stafford High"],[424,"Colonial Forge High"]],
	112:[[430,"Bethel High"],[280,"Hampton High"],[50,"Phoebus High"],[320,"Kecoughtan High"]],
	113:[[12, "Harrisonburg High"]],
	115:[[260,"E.C. Glass High"],[130,"Heritage High"]],
	117:[[1396,"Woodside High"],[1395,"Heritage High"],[1220,"Menchville High"],[280,"Denbigh High"],[1405,"Achievable Dream Middle/High"],[1070,"Warwick High"]],
	123:[[452,"Richmond Community High"],[850,"Armstrong High"],[1510,"Huguenot High"],[730,"John Marshall High"],[20,"Thomas Jefferson High"],[90,"Open High"],[741,"George Wythe High"]],
	128:[[530,"Bayside High"],[960,"Ocean Lakes High"],[10,"Green Run High"],[1030,"Landstown High"],[620,"Kempsville High"],[850,"Salem High"],[321,"Princess Anne High"],[30,"Frank W. Cox High"],[920,"Tallwood High"],[610,"First Colonial High"],[440,"Floyd Kellam High"]],
	136:[[160,"Norfolk Highlands Primary"],[960,"Grassfield High"],[80,"Oscar F. Smith High"],[120,"Great Bridge High"],[830,"Indian River High"],[100,"Deep Creek High"],[890,"Hickory High"],[840,"Western Branch High"]]
};

// populates the division dropdown
update_div = function() {
    var sel = document.getElementById("div_num");
    sel.options.length = 0;
    sel.options[0] = new Option("ALL", "0");
    sel.selectedIndex = 0;
    // create an option for each division
    for (var i = 0; i < divisions.length; i++) {
        var div = divisions[i];
        var opt = document.createElement("option");
        opt.value = div[0];
        opt.textContent = div[1];
        sel.appendChild(opt);
    }
};

// populates the school dropdown (for the current division)
update_sch = function() {
    var sel = document.getElementById("div_num");
    var list = schools[sel.value];
    sel = document.getElementById("sch_num");
    sel.options.length = 0;
    sel.options[0] = new Option("ALL", "0");
    sel.selectedIndex = 0;
    // if the div_num is valid, add the schools
    if (list === undefined) {
        return;
    }
    for (var i = 0; i < list.length; i++) {
        var sch = list[i];
        var opt = document.createElement("option");
        opt.value = sch[0];
        opt.textContent = sch[1];
        sel.appendChild(opt);
    }
};