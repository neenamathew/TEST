$(document).ready(function() {
var progressElem = $('#progressCounter');
var URL = "https://api.github.com/users/mralexgray/repos";
       
$("#loading").hide();
$("#addrow").hide();
$("#confirm").hide();
$("#refresh").hide();
    
$("#addbutton").click( function()
    { 
        $("#addrow").show();
        $("#addbutton").hide()
        $("#confirm").show();
     });    
 
$("#confirm").click(function ()
        {
            $("#addbutton").hide();
            $("#confirm").hide();
            $("#refresh").show();
            $("#mytable > tbody > tr").eq(1).after("<tr id=rowCount ><td>" + document.getElementById('value1').value+ "</td><td>" + document.getElementById('value2').value+ "</td><td>" + document.getElementById('value3').value+ "</td><td>" + document.getElementById('value4').value+ "</td><td>" + document.getElementById('value5').value+ "</td><td>" + document.getElementById('value6').value+ "</td><td>" + document.getElementById('value7').value+ "</td><td>" + document.getElementById('value8').value+ "</td></tr>");
            $("#addrow").hide();
  
        });

$("#refresh").on('click',function(){
                $("#addrow").hide();
                $("#refresh").hide();
                $("#addbutton").show();
                $("#rowCount").remove();
                });
  
var obj=$.ajax({
    type: 'GET',
    dataType: 'json',
    url: URL,
    cache: false,
    beforeSend: function () {
        $("#mytable").hide();
        $("#addbutton").hide();
        $('#loading').show();
        },
    complete: function () {
        $("#mytable").show();
        $("#addbutton").show();
        $("#loading").hide();
        },
    success: function (json) {
        for (var i = json.length - 1; i >= 0; i--) {
        $("#mytable > tbody:last").append("<tr><td>" + json[i].name + "</td><td>" + json[i].full_name + "</td><td>" + json[i].size +
        "</td><td>" + json[i].created_at + "</td><td>" + json[i].language + "</td><td>" + json[i].has_issues + "</td><td>" 
        + json[i].has_downloads + "</td><td>" + json[i].watchers + "</td></tr>");
        };
    }
});
});

