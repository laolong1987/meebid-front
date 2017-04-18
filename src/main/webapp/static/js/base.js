/**
 * Created by gaoyang on 17/4/18.
 */
function topage(url){
    var page=$("#jumppage").val();
    window.location.href=url+"?page="+page;
}


function keyUp(ob){
    ob.value=ob.value.replace(/\D/g,'')
}