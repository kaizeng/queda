\d .cron

ID:0;
events:([id:()]; cmd:(); time:(); mode:(); interval:());

MODE:`once`repeat`result;

add:{[cmd;time;mode;interval]
 ID+:1;
 events,:(ID; cmd; time; mode;(`int$`time$interval)%8.64e7);
 ID };

remove:{[id]
 d: exec id from events where id in ids;
 delete from `.cron.events where id in ids;
 d};

runEvents:{[ids]
 {[cmd] @[{$[-1h = type r: value x; r; 0b]};cmd;{"Fail to execute"; 0b}[cmd]]} each events[([]id:ids)]`cmd};

run:{
 ids: exec id from events where time <=.z.Z;
 returns: runEvents ids; 
 delete from `.cron.events where id in ids, mode = `once;
 success: ids where returns;
 delete from `.cron.events where id in success, mode = `results;
 update time:.z.Z|time + interval from `.cron.events where id in ids;
 }

\d .

.z.ts:{.cron.run[];}

.cron.ts:1000;
system "t ", string .cron.ts;

\
EXAMPLES:
.cron.add["show  `Hello"; .z.Z - 00:00:01; `repeat; 0];

