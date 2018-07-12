.lib.findFile:{[f]
	f:$[type[f] in -10 10h; f; string f];
	if[type key hsym `$f; :f];
	d:.lib.PATH[where not " "~/:(),.lib.PATH];
	$[any r: 0h <> type each key each ` sv/: (hsym each `$d), \:`$f;
	  d[r?1b], "/",f;
	  ""]
	};

.lib.loadFile:{[f]
  r:.lib.findFile f;
  if[`log in key`; .log.debug "Loading file:", r];
  if[r ~ ""; .log.debug "File ", (raze string f), " not found"];
  system "l ", r;
 };



/
 .lib.findFile "cron.q"