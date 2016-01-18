function checkUserName(name, email, contact, query) {
    var url = "MailSend.aspx?act=sendmail&name=" + name + "&email=" + email + "&contact=" + contact + "&query=" + query;
    var xmlHttp = createXMLHttpRequest();  // create  xmlHttp  object
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState) {
            if (xmlHttp.status == 200) {

                var res = xmlHttp.responseText;
                if (res == "-1") {
                    
                } else if (res == "0") {
                    unamemsg.innerHTML = "<span style='color:blue;font-size:12px'>Thank you. We will get in touch with you.</span>";
                } else if (res == "1") {
                    
                }
                
            } else {
                unamemsg.innerHTML = "<span style='color:blue;font-size:12px'>Thank you. We will get in touch with you.</span>";    
            }
        }
        document.getElementById("name").value = "";
        document.getElementById("email").value = "";
        document.getElementById("phone").value = "";
        document.getElementById("Capcha").value = "";
        document.getElementById("message").value = "";
        document.getElementById("CapchaEntered").value = "";
    };
    

    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
}

//very importent!!
function createXMLHttpRequest() {
    var xmlHttp;
    // IE
    if (window.ActiveXObject) {
        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
        // Mozilla
    else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
    } else {
        //alert("XHR not created");
    }
    return xmlHttp;
}