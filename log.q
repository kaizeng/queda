.log.levels:`fatal`error`warn`info`debug!til 5;
.log.level:`info;
.log.levelnum:3;

.log.out:{[p;l;m]
 if[levelnum >=1; -1 (string .z.Z), " : ", p, "\t",m];
 }

.log.fatal: out[`FATAL; levels `fatal]