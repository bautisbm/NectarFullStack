var divisions = [
    [1, "Accomack County"],
    [2, "Albemarle County"],
    [101, "Alexandria City"],
    [3, "Alleghany County"],
    [4, "Amelia County"],
    [5, "Amherst County"],
    [6, "Appomattox County"],
    [8, "Augusta County"],
    [9, "Bath County"],
    [10, "Bedford County"],
    [11, "Bland County"],
    [12, "Botetourt County"],
    [102, "Bristol City"],
    [13, "Brunswick County"],
    [14, "Buchanan County"],
    [15, "Buckingham County"],
    [103, "Buena Vista City"],
    [16, "Campbell County"],
    [17, "Caroline County"],
    [19, "Charles City County"],
    [20, "Charlotte County"],
    [104, "Charlottesville City"],
    [22, "Clarke County"],
    [202, "Colonial Beach"],
    [106, "Colonial Heights City"],
    [107, "Covington City"],
    [23, "Craig County"],
    [24, "Culpeper County"],
    [25, "Cumberland County"],
    [108, "Danville City"],
    [26, "Dickenson County"],
    [27, "Dinwiddie County"],
    [28, "Essex County"],
    [109, "Falls Church City"],
    [30, "Fauquier County"],
    [31, "Floyd County"],
    [32, "Fluvanna County"],
    [135, "Franklin City"],
    [33, "Franklin County"],
    [34, "Frederick County"],
    [110, "Fredericksburg City"],
    [111, "Galax City"],
    [35, "Giles County"],
    [36, "Gloucester County"],
    [37, "Goochland County"],
    [38, "Grayson County"],
    [39, "Greene County"],
    [40, "Greensville County"],
    [42, "Hanover County"],
    [43, "Henrico County"],
    [44, "Henry County"],
    [45, "Highland County"],
    [114, "Hopewell City"],
    [46, "Isle of Wight County"],
    [49, "King and Queen County"],
    [48, "King George County"],
    [50, "King William County"],
    [51, "Lancaster County"],
    [52, "Lee County"],
    [137, "Lexington City"],
    [54, "Louisa County"],
    [55, "Lunenburg County"],
    [56, "Madison County"],
    [143, "Manassas City"],
    [144, "Manassas Park City"],
    [116, "Martinsville City"],
    [57, "Mathews County"],
    [58, "Mecklenburg County"],
    [59, "Middlesex County"],
    [62, "Nelson County"],
    [118, "Norfolk City"],
    [65, "Northampton County"],
    [66, "Northumberland County"],
    [119, "Norton City"],
    [67, "Nottoway County"],
    [68, "Orange County"],
    [69, "Page County"],
    [70, "Patrick County"],
    [120, "Petersburg City"],
    [71, "Pittsylvania County"],
    [142, "Poquoson City"],
    [121, "Portsmouth City"],
    [72, "Powhatan County"],
    [73, "Prince Edward County"],
    [74, "Prince George County"],
    [75, "Prince William County"],
    [122, "Radford City"],
    [78, "Rappahannock County"],
    [79, "Richmond County"],
    [124, "Roanoke City"],
    [81, "Rockbridge County"],
    [82, "Rockingham County"],
    [139, "Salem City"],
    [84, "Scott County"],
    [85, "Shenandoah County"],
    [86, "Smyth County"],
    [87, "Southampton County"],
    [88, "Spotsylvania County"],
    [126, "Staunton City"],
    [127, "Suffolk City"],
    [90, "Surry County"],
    [91, "Sussex County"],
    [92, "Tazewell County"],
    [93, "Warren County"],
    [94, "Washington County"],
    [130, "Waynesboro City"],
    [95, "Westmoreland County"],
    [207, "West Point"],
    [131, "Williamsburg-James City County"],
    [132, "Winchester City"],
    [96, "Wise County"],
    [97, "Wythe County"],
    [98, "York County"]
];



var schools = {
	1: [[70, "Nandua High"], [540, "Arcadia High"], [580, "Chincoteague High"]],
    2: [[140, "Western Albemarle High"], [880, "Albemarle High"], [890, "Murray High"], [1052, "Monticello High"]],
    3: [[310, "Alleghany High"]],
    4: [[10, "Amelia County High"]],
    5: [[750, "Amherst County High"]],
    6: [[260, "Appomattox County High"]],
    8: [[660, "Buffalo Gap High"], [670, "Fort Defiance High"], [680, "Riverheads High"], [720, "Wilson Memorial High"], [730, "Stuarts Draft High"]],
    9: [[140, "Bath County High"]],
    10: [[1180, "Liberty High"], [1190, "Staunton River High"], [1212, "Jefferson Forest High"]],
    12: [[430, "James River High"], [440, "Lord Botetourt High"]],
    13: [[650, "Brunswick High"]],
    14: [[990, "Grundy High"], [1000, "Council High"], [1020, "Hurley High"], [1042, "Twin Valley High"]],
    15: [[700, "Buckingham County High"]],
    16: [[200, "Altavista High"], [222, "Rustburg High"], [542, "William Campbell High"], [720, "Brookville High"]],
    17: [[460, "Caroline High"]],
    19: [[100, "Charles City County High"]],
    20: [[460, "Randolph-Henry High"]],
    22: [[10, "Clarke County High"]],
    24: [[50, "Eastern View High"], [480, "Culpeper County High"], [583, "Culpeper County High Ext Annex"]],
    25: [[151, "Cumberland High"]],
    26: [[275, "Ridgeview High School"]],
    27: [[500, "Dinwiddie County High"]],
    28: [[10, "Essex High"]],
    30: [[510, "Kettle Run High"], [701, "Fauquier High"], [851, "Liberty High"]],
    31: [[660, "Floyd County High"]],
    32: [[260, "Fluvanna County High"]],
    33: [[1311, "Franklin County High"], [1484, "Franklin County High-Ramsey"]],
    34: [[30, "James Wood High"], [581, "Sherando High"], [584, "Millbrook High"]],
    35: [[461, "Giles High"], [470, "Narrows High"]],
    36: [[260, "Gloucester High"]],
    37: [[220, "Goochland High"]],
    38: [[421, "Grayson County High"], [423, "Grayson County High Career & Technical Education"], [430, "Grayson Highlands School"]],
    39: [[72, "William Monroe High"]],
    40: [[200, "Greensville County High"]],
    42: [[62, "Atlee High"], [370, "Lee Davis High"], [400, "Patrick Henry High"], [554, "Hanover High"]],
    43: [[96, "Glen Allen High"], [140, "Mills E. Godwin High"], [160, "Deep Run High"], [190, "Highland Springs High"], [191, "Highland Springs Technical Center"], [410, "Douglas S. Freeman High"], [580, "Varina High"], [600, "John Randolph Tucker High"], [610, "Henrico High"], [640, "Highland Springs Elementary"], [670, "Hermitage High"]],
    44: [[10, "Bassett High"], [20, "Magna Vista High"]],
    45: [[110, "Highland Elementary"], [220, "Highland High"]],
    46: [[40, "Smithfield High"], [250, "Windsor High"]],
    48: [[120, "King George High"]],
    49: [[280, "Central High"]],
    50: [[130, "King William High"]],
    51: [[10, "Lancaster High"]],
    52: [[300, "Lee High"], [880, "Thomas Walker High"]],
    54: [[602, "Louisa County High"]],
    55: [[560, "Central High"]],
    56: [[221, "Madison County High"]],
    57: [[190, "Mathews High"]],
    58: [[980, "Bluestone  High"], [990, "Park View High"]],
    59: [[90, "Middlesex High"]],
    62: [[710, "Nelson County High"]],
    65: [[350, "Northampton High"]],
    66: [[40, "Northumberland High"]],
    67: [[301, "Nottoway High"]],
    68: [[330, "Orange County High"]],
    69: [[110, "Luray High"], [380, "Page County High"]],
    70: [[700, "Patrick County High"]],
    71: [[1680, "Dan River High"], [1700, "Gretna High"], [1720, "Chatham High"], [1730, "Tunstall High"]],
    72: [[11, "Powhatan High"], [130, "Powhatan Junior High"]],
    73: [[400, "Prince Edward County High"]],
    74: [[20, "Prince George High"], [270, "N.B. Clements Junior High"]],
    75: [[60, "Woodbridge High"], [80, "Osbourn Park High"], [140, "Potomac High"], [290, "Battlefield High"], [300, "Freedom High"], [530, "Brentsville District High"], [680, "Stonewall Jackson High"], [690, "Gar-Field High"], [710, "C.D. Hylton High"], [870, "Forest Park High"], [1060, "Patriot High"]],
    78: [[230, "Rappahannock County High"]],
    79: [[210, "Rappahannock High"]],
    81: [[22, "Rockbridge County High"]],
    82: [[20, "Spotswood High"], [391, "East Rockingham High"], [850, "Turner Ashby High"], [870, "Broadway High"]],
    84: [[260, "Rye Cove High"], [770, "Gate City High"], [780, "Twin Springs High"]],
    85: [[770, "Strasburg High"], [780, "Central High"], [790, "Stonewall Jackson High"]],
    86: [[250, "Northwood High"], [460, "Chilhowie High"], [700, "Marion Senior High"]],
    87: [[690, "Southampton High"]],
    88: [[20, "Courtland High"], [370, "Spotsylvania High"], [381, "Chancellor High"], [506, "Massaponax High"], [510, "Riverbend High"], [800, "Gates - Alternative High School Program"]],
    90: [[10, "Surry County High"]],
    91: [[340, "Sussex Central High"]],
    92: [[821, "Richlands High"], [890, "Tazewell High"], [940, "Graham High"]],
    93: [[230, "Warren County High"], [250, "Skyline High"]],
    94: [[1030, "Abingdon High"], [1040, "John S. Battle High"], [1050, "Patrick Henry High"], [1060, "Holston High"], [1070, "High Point Elementary"]],
    95: [[120, "Washington & Lee High"]],
    96: [[652, "Eastside High"], [1000, "Central High"], [1010, "Union High"]],
    97: [[202, "Rural Retreat High"], [721, "George Wythe High"], [760, "Fort Chiswell High"]],
    98: [[20, "Bruton High"], [30, "York High"], [230, "Tabb High"], [332, "Grafton High"]],
    101: [[210, "T.C. Williams High"]],
    102: [[60, "Highland View Elementary"], [80, "Virginia High"]],
    103: [[62, "Parry McCluer High"]],
    104: [[140, "Charlottesville High"]],
    106: [[40, "Colonial Heights High"]],
    107: [[350, "Covington High"]],
    108: [[210, "George Washington High"], [1374, "Galileo Magnet High"]],
    109: [[251, "George Mason High"]],
    110: [[40, "James Monroe High"]],
    111: [[31, "Galax High"]],
    114: [[120, "Hopewell High"]],
    116: [[110, "Martinsville High"]],
    118: [[10, "Matthew Fontaine Maury High"], [390, "Granby High"], [580, "Norview High"], [840, "Lake Taylor High"], [880, "Booker T Washington High"], [2116, "Norfolk Alternative High"]],
    119: [[20, "J.I. Burton High"]],
    120: [[200, "Petersburg High"], [211, "Vernon Johns Junior High"]],
    121: [[240, "I.C. Norcom High"], [500, "Churchland High"], [1660, "Woodrow Wilson High"], [1765, "Highland Biltmore Site"]],
    122: [[41, "Radford High"]],
    124: [[110, "Highland Park Elementary"], [390, "Patrick Henry High"], [400, "William Fleming High"]],
    126: [[30, "Robert E. Lee High"]],
    127: [[240, "Nansemond River High"], [300, "Lakeland High"], [395, "King`s Fork High"]],
    130: [[600, "Waynesboro High"]],
    131: [[90, "Lafayette High"], [202, "Jamestown High"], [204, "Warhill High"]],
    132: [[40, "John Handley High"]],
    135: [[20, "Franklin High"]],
    139: [[70, "Salem High"]],
    142: [[10, "Poquoson High"]],
    143: [[370, "Osbourn High"]],
    144: [[30, "Manassas Park High"]],
    202: [[21, "Colonial Beach High"]],
    207: [[290, "West Point High"]]
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