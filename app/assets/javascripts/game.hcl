(def post-move
	 (# (move)
		(($ "body").append (format 
							(cat "<form id='move-form' style='display:none;' me"
								 "thod='post' action='/games/~~/move'><input ty"
								 "pe='hidden' name='authenticity_token' value='"
								 "~~'><input type='hidden' name='move' value='~"
								 "~' /></form>")
							[ ((location.href.split "/").pop)
							  ((($ "meta").last).attr "content")
							  move ] ))
		(($ "#move-form").submit)))

($ (# ()
	  (($ "table#game.my_turn td.point").click
	   (# ()
		  (post-move (($ this).data "coords"))))))