--let's start with the JavaScript code we would add to react to messages coming through ports:

var app = Elm.Spelling.fullscreen();

app.ports.check.subscribe(function(word){
    var suggestions = spellCheck(word);
    app.ports.suggestions.send(suggestions);
});

--We start by initializing our Elm program that has two ports: check and suggestions .
--Strings will be coming out of the check port, so we subscribe to those messages.
--Whenever we get a word, our callback is going to run it through our spell-checking library
--and then feed the result back to Elm through the suggestions port.

this.spellCheck = function(){
    return ["juan", "juancho"];
}    