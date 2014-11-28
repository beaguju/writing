// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function show() { 
        if(document.getElementById('addition').style.display=='none') { 
            document.getElementById('addition').style.display='block'; 
        } 
        return false;
    } 
    function hide() { 
        if(document.getElementById('addition').style.display=='block') { 
            document.getElementById('addition').style.display='none'; 
        } 
        return false;
    }   