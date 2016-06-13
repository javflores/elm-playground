--elm make src/MyThing.elm --output=my-thing.js
--will generate something like:

var Elm = {};
Elm.MyThing = {
    fullscreen: function() { /* take over the <body> */ },
    embed: function(node) { /* take over the given node */ },
    worker: function() { /* run the program with no UI */ }
};

--To embed the Elm program in an HTML node
<div id="my-thing"></div>
<script src="my-thing.js"></script>
<script>
    var node = document.getElementById('my-thing');
    var app = Elm.MyThing.embed(node);
</script>