
function fillCityGB22601() {
	aCity = areaDataGB2260.split(",");
	var j = 1;
	for (i = 1; i <= aCity.length; i++) {
		if (aCity[i - 1].substring(2, 6) == "0000") {
			document.getElementById("province1").options[j] = new Option(aCity[i - 1].substring(7, aCity[i - 1].length), aCity[i - 1].substring(0, 6));
			j++;
		}
	}
}
function setCityGB22601(provinceCode) {
	var j = 1;
	var provinceCode = provinceCode / 10000;
	for (i = 1; i <= aCity.length; i++) {
		if (aCity[i - 1].substring(0, 2) == provinceCode && aCity[i - 1].substring(2, 6) != "0000" && aCity[i - 1].substring(4, 6) == "00") {
			document.getElementById("city1").options[j] = new Option(aCity[i - 1].substring(7, aCity[i - 1].length), aCity[i - 1].substring(0, 6));
			j++;
		}
	}
	document.getElementById("city1").length = j;
	getAreaGB22601("000000");
	document.getElementById("county1").innerHTML="<option value=\"\" selected=\"selected\">==请选择区==</option>";
}
function setCountyGB22601(cityCode) {
	var j = 1;
	var cityCode = cityCode / 100;
	for (i = 1; i <= aCity.length; i++) {
		if (aCity[i - 1].substring(0, 4) == cityCode && aCity[i - 1].substring(4, 6) != "00") {
			document.getElementById("county1").options[j] = new Option(aCity[i - 1].substring(7, aCity[i - 1].length), aCity[i - 1].substring(0, 6));
			j++;
		}
	}
	document.getElementById("county1").length = j;
}
function getAreaGB22601() {
	document.getElementById("area1").value = "000000";
	if (document.getElementById("province1").value != "") {
		document.getElementById("area1").value = document.getElementById("province1").value;
	}
	if (document.getElementById("city1").value != "") {
		document.getElementById("area1").value = document.getElementById("city1").value;
	}
	if (document.getElementById("county1").value != "") {
		document.getElementById("area1").value = document.getElementById("county1").value;
	}
}
function setAreaGB22601() {
	for (i = 1; i <= document.getElementById("province1").length; i++) {
		if (document.getElementById("province1").options[i - 1].value.substring(0, 2) == document.getElementById("area1").value.substring(0, 2)) {
			document.getElementById("province1").selectedIndex = i - 1;
		}
	}
	setCityGB22601(document.getElementById("province1").value);
	for (i = 1; i <= document.getElementById("city1").length; i++) {
		if (document.getElementById("city1").options[i - 1].value.substring(0, 4) == document.getElementById("area1").value.substring(0, 4)) {
			document.getElementById("city1").selectedIndex = i - 1;
		}
	}
	setCountyGB22601(document.getElementById("city1").value);
	for (i = 1; i <= document.getElementById("county1").length; i++) {
		if (document.getElementById("county1").options[i - 1].value == document.getElementById("area1").value) {
			document.getElementById("county1").selectedIndex = i - 1;
		}
	}
}
fillCityGB22601();
setAreaGB22601();
// end dq.js
//封装方法开始
function getFullArea1(){
	var qm="";
	var areaNameAndCode="";
	for(var i=0;i<document.getElementById('province1').options.length;i++){
		if(document.getElementById('province1').options[i].selected == true&&document.getElementById('province1').value!=''){
			qm=document.getElementById('province1').options[i].text;
			areaNameAndCode=document.getElementById('province1').options[i].text+"|"+document.getElementById('province1').value;
			break;
		}
	}
	for(var i=0;i<document.getElementById('city1').options.length;i++){
		if(document.getElementById('city1').options[i].selected == true&&document.getElementById('city1').value!=''){
			qm+=document.getElementById('city1').options[i].text;
			areaNameAndCode+=","+document.getElementById('city1').options[i].text+"|"+document.getElementById('city1').value;
			break;
		}
	}
	for(var i=0;i<document.getElementById('county1').options.length;i++){
		if(document.getElementById('county1').options[i].selected == true&&document.getElementById('county1').value!=''){
			qm+=document.getElementById('county1').options[i].text;
			areaNameAndCode+=","+document.getElementById('county1').options[i].text+"|"+document.getElementById('county1').value;
			break;
		}
	}
	return areaNameAndCode;
}
function setFullArea1(areaCode){
	var areaCodes = areaCode.split(",");
	if(areaCodes.length!=3){
		return false;
	}else{
		for(var i=0;i<document.getElementById('province1').options.length;i++){
			if(document.getElementById('province1').options[i].value==areaCodes[0]){
				document.getElementById('province1').options[i].selected=true;
				setCityGB22601(areaCodes[0]);
				getAreaGB22601();
				break;
			}
		}
		for(var i=0;i<document.getElementById('city1').options.length;i++){
			if(document.getElementById('city1').options[i].value==areaCodes[1]){
				document.getElementById('city1').options[i].selected=true;
				setCountyGB22601(areaCodes[1]);getAreaGB22601();
				break;
			}
		}
		for(var i=0;i<document.getElementById('county1').options.length;i++){
			if(document.getElementById('county1').options[i].value==areaCodes[2]){
				document.getElementById('county1').options[i].selected=true;
				getAreaGB22601();
				break;
			}
		}
	}
}
function getSingleArea(areaCode){
	var areaDatas=areaDataGB2260.split(",");
	for(var i=0;i<areaDatas.length;i++){
		if(areaDatas[i].split("|")[0]==areaCode){
			return areaDatas[i].split("|")[1];	
		}
	}
}
//封装方法结束
