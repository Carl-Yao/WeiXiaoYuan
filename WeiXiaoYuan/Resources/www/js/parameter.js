var parameters = getParameters();
String.prototype.Trim = function() 
{ 
return this.replace(/(^\s*)|(\s*$)/g, ""); 
} 
String.prototype.LTrim = function() 
{ 
return this.replace(/(^\s*)/g, ""); 
} 
String.prototype.RTrim = function() 
{ 
return this.replace(/(\s*$)/g, ""); 
} 
function getParameters() {
	var parameters = new Object();
	var url = location.href;
	//alert("getParameters-url:"+url);
	var start = url.indexOf("?");
	if (start == -1)
		return parameters;
	var ps = url.substr(start + 1, url.length);
	//alert("ps:"+ps);
	var arr = ps.split("&");
	for (var i = 0; i < arr.length; i++) {
		var p = arr[i].split("=");
		if (p.length != 2)
			continue;
		var key = p[0];
		var value = decodeURI(p[1]);
		//alert(key + "=" + value);
		parameters[key] = value;
	}
	return parameters;
}

function serializableParameters(parameters){
	var str = "";
	if(!parameters) return str;
	for(var key in parameters){
		str = str + key + "=" + parameters[key] + "&";
	}
	if(str.substring(str.length-1,str.length)=="&"){
		str = str.substring(0,str.length-1);
	}
	return str;
}

/*任意进制加密*/
function EnChTo(h){
    var str = new Array();
    for(var i=0;i<h.length;i++)
        str+=h.charCodeAt(i).toString(16)+";"; 
    return str.toString().Trim();
}
/*任意进制解密*/
function DeChTo(h){
    var str = "";
    var s=h.split(";");
    for(var i=0;i<s.length;i++){
    	var ascii = parseInt(s[i],16);
    	if(!isNaN(ascii)){
	    	var c = String.fromCharCode(ascii);
	        str+=c;
    	}
    }
    return str.Trim();
}
function encode(str){
	return EnChTo(str);
}
function decode(str){
	return DeChTo(str);
}
function initEasyJS(){
    window.EasyJS = {__callbacks: {},invokeCallback: function (cbID, removeAfterExecute){var args = Array.prototype.slice.call(arguments);args.shift();args.shift();for (var i = 0, l = args.length; i < l; i++){args[i] = decodeURIComponent(args[i]);}var cb = EasyJS.__callbacks[cbID];if (removeAfterExecute){EasyJS.__callbacks[cbID] = undefined;}return cb.apply(null, args);},call: function (obj, functionName, args){var formattedArgs = [];for (var i = 0, l = args.length; i < l; i++){if (typeof args[i] == "function"){formattedArgs.push("f");var cbID = "__cb" + (+new Date);EasyJS.__callbacks[cbID] = args[i];formattedArgs.push(cbID);}else{formattedArgs.push("s");formattedArgs.push(encodeURIComponent(args[i]));}}var argStr = (formattedArgs.length > 0 ? ":" + encodeURIComponent(formattedArgs.join(":")) : "");var iframe = document.createElement("IFRAME");iframe.setAttribute("src", "easy-js:" + obj + ":" + encodeURIComponent(functionName) + argStr);document.documentElement.appendChild(iframe);iframe.parentNode.removeChild(iframe);iframe = null;var ret = EasyJS.retValue;EasyJS.retValue = undefined;if (ret){return decodeURIComponent(ret);}},inject: function (obj, methods){window[obj] = {};var jsObj = window[obj];for (var i = 0, l = methods.length; i < l; i++){(function (){var method = methods[i];var jsMethod = method.replace(new RegExp(":", "g"), "");jsObj[jsMethod] = function (){return EasyJS.call(obj, method, Array.prototype.slice.call(arguments));};})();}}};
    
    EasyJS.inject("MyEasyJS", ["HttpFailCallBack:", "HttpSuccessDictionaryCallBack:", "HttpSuccessCallBack:", "AddEasyJS"]);
    MyEasyJS.AddEasyJS();
    return "";
}
//demo
//function doit(){
//    var f = document.f;
//    f.output.value = base64encode(utf16to8(f.source.value));
//    f.decode.value = utf8to16(base64decode(f.output.value));
//}


