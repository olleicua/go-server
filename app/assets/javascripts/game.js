// compiled from Hot Cocoa Lisp

var format = function(f,v){var i=0;return f.replace(/~([a-zA-Z0-9_]*)~/g,function(_,k){if(k===''){k=i;i++;}if(v[k]===undefined){return'';}return v[k];})}, post_hyphen_move;

// (def post-move
// 	 (# (move)
// 		(($ "body").append (format 
// 							(cat "<form id='move-form' style='display:none;' me"
// 								 "thod='post' action='/games/~~/move'><input ty"
// 								 "pe='hidden' name='authenticity_token' value='"
// 								 "~~'><input type='hidden' name='move' value='~"
// 								 "~' /></form>")
// 							[ ((location.href.split "/").pop)
// 							  ((($ "meta").last).attr "content")
// 							  move ] ))
// 		(($ "#move-form").submit)))

post_hyphen_move = (function(move) { $("body").append(format(("<form id='move-form' style='display:none;' me" + "thod='post' action='/games/~~/move'><input ty" + "pe='hidden' name='authenticity_token' value='" + "~~'><input type='hidden' name='move' value='~" + "~' /></form>"), [location.href.split("/").pop(), $("meta").last().attr("content"), move])); return $("#move-form").submit(); });

// ($ (# ()
// 	  (($ "table#game.my_turn td.point").click
// 	   (# ()
// 		  (post-move (($ this).data "coords"))))))

$((function() {  return $("table#game.my_turn td.point").click((function() {  return post_hyphen_move($(this).data("coords")); })); }));