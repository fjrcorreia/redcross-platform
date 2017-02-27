

var GLOBALS;

var urlParams;
(window.onpopstate = function () {
    var match,
        pl     = /\+/g,  // Regex for replacing addition symbol with a space
        search = /([^&=]+)=?([^&]*)/g,
        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
        query  = window.location.search.substring(1);

    urlParams = {};
    while (match = search.exec(query))
       urlParams[decode(match[1])] = decode(match[2]);
})();

/*
 * Login Section
 */

 var LOCAL_USERS = {
     "default" : {
         "user-info" : {
             "name" : "Voluntario",
             "email" : "rescuer@redcross.dom"
         }
     },
     "ruben@coelho.dom" : {
         "password" : "123qwe",
         "user-info" : {
             "name" : "Ruben Coelho",
             "email" : "ruben@coelho.dom"
         }
     },
     "tony@ramos.dom" : {
         "password" : "123qwe",
         "user-info" : {
             "name" : "Tony Ramos",
             "email" : "tony@ramos.dom"
         }
     }

 };


function get_global_session(){
    if (GLOBALS === undefined){
        console.log("Init Globlas...");
        GLOBALS = {};
    }
    var ss = GLOBALS['SS_SESSION'];
    if (ss === undefined){
        console.log("Created a Session");
        ss = {};
        GLOBALS['SS_SESSION'] = ss;
    }
    return ss;
}


function set_session_user(principal){
    var session = get_global_session();
    session['SS_USER'] = principal;
    GLOBALS['SS_SESSION']  = session;
}


function submit_login_error(username){
    var error_message = "email ou password invalidos";
    console.log("Error Login["+username+"]: " + error_message);
}

function submit_login_success(principal){
    console.log("Login Success: {"+principal.email+", "+principal.name+"}")
    set_session_user(principal);
    var cur_location = window.location.href;
    var nxt_location = cur_location.replace("login.html", "escala.html?u="+principal.email);
    console.log("changing to: " + nxt_location);
    window.location.replace(nxt_location);
}

function submit_login(){
    console.log("Init::Login");
    var form = document.getElementById('form-user-signin');
    var fr_username = form.fr_username.value;
    var fr_password = form.fr_password.value;
    console.log("Submit Action");
    console.log("User: " + fr_username);
    var user_entry = LOCAL_USERS[fr_username];
    if (user_entry !== undefined){
        if (user_entry.password === fr_password){
            var user = user_entry['user-info'];
            console.log("Found Valid user: " + user);
            submit_login_success(user);
            return;
        }
    }

    // Login as failed
    submit_login_error(fr_username);
}



/*
* Escala
*/

function get_session_user(){
    var username = urlParams['u'];
    var user = LOCAL_USERS['default'];
    user = user['user-info'];
    if (username !== undefined){
        if (LOCAL_USERS[username] !== undefined){
            user = LOCAL_USERS[username];
            user = user['user-info'];
        }
    }

    return user;
}

/*
* Requires jquery
*/
function init_user_info(){
    var principal = get_session_user();
    $('.session-username').text(principal.name);
}
