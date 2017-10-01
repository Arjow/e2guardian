function(checkrequest)
# comment out the following line if you do not use 'local' list files
ifnot(greyset) returnif localcheckrequest
if(connect) return sslrequestcheck
ifnot(greyset) returnif exceptioncheck
if(refererin,refererexception) return setexception
ifnot(greyset) greycheck
ifnot(greyset) returnif bannedcheck
if(fullurlin, change) setmodurl
if(true) returnif embeddedcheck
# uncomment next line if local lists NOT used
#if(fullurlin,searchterms) setsearchterm
if(searchin,override) return setgrey
if(searchin,banned) return setblock
if(headerin,headermods) setheadermod
if(fullurlin, addheader) setaddheader
if(true) setgrey


function(checkresponse)
if(mimein, exceptionmime) return setexception
if(mimein, bannedmime) return setblock
if(extensionin, execeptionextension) setexception
if(extensionin, bannedextension) setblock

function(thttps-checkrequest)
#if(true) return setexception
# comment out the following line if you do not use 'local' list files
if(true) returnif localsslrequestcheck
if(true) returnif sslrequestcheck
if(fullurlin, change) setmodurl

function(icap-checkrequest)
# comment out the following line if you do not use 'local' list files
#ifnot(greyset) returnif localcheckrequest
#if(true) return setexception
if(connect) return icapsslrequestcheck
ifnot(greyset) returnif exceptioncheck
if(refererin,refererexception) return setexception
ifnot(greyset) greycheck
#ifnot(greyset) return setblock
ifnot(greyset) returnif bannedcheck
if(fullurlin, change) setmodurl
if(true) returnif embeddedcheck
# uncomment next line if local lists NOT used
if(fullurlin,searchterms) setsearchterm
if(searchin,override) return setgrey
if(searchin,banned) return setblock
if(headerin,headermods) setheadermod
if(fullurlin, addheader) setaddheader
if(true) setgrey

function(icap-checkresponse)
if(true) return checkresponse

function(embeddedcheck)
if(embeddedin, localexception) return false
if(embeddedin, localgrey) return false
if(embeddedin, localbanned) return setblock
if(embeddedin, exception) return false
if(embeddedin, grey) return false
if(embeddedin, banned) return setblock

function(localcheckrequest)
if(connect) return localsslrequestcheck
ifnot(greyset) returnif localexceptioncheck
ifnot(greyset) localgreycheck
ifnot(greyset) returnif localbannedcheck
if(fullurlin,searchterms) setsearchterm
if(searchin,localbanned) return setblock
#if(true) return false

function(localsslrequestcheck)
if(sitein, localexception) setexception
if(returnset) return sslreplace

function(sslreplace)
if(fullurlin,sslreplace) return setmodurl

function(localgreycheck)
if(urlin, localgrey) return setgrey

function(localbannedcheck)
if(urlin, localbanned) return setblock

function(localexceptioncheck)
if(urlin, localexception) return setexception

function(exceptioncheck)
if(urlin, exception) return setexception
if(headerin, exceptionheader) return setexception

function(sslexceptioncheck)
if(sitein, exception) setexception
if(returnset) return sslreplace

function(greycheck)
if(urlin, grey) return setgrey

function(bannedcheck)
if(urlin, banned) return setblock
if(headerin, bannedheader) return setblock

function(localsslcheckrequest)
if(sitein, localexception) return setexception
#if(sitein, localbanned) return setblock

function(sslrequestcheck)
if(true) returnif sslexceptioncheck
# use next line to have general MITM
if(true) setgomitm
# use next line instead of last to limit MITM to greylist
#if(sitein, greyssl) setgomitm

if(sitein, nocheckcert) setnocheckcert
if(true) sslreplace
#if(sitein, banned) return setblock

function(icapsslrequestcheck)
if(true) returnif sslexceptioncheck
if(true) sslreplace
if(sitein, banned) return setblock
