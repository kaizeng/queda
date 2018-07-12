\d .log

levels:`fatal`error`warn`info`debug!til 5;
level:`info;
levelnum:3;

out:{[p;l;m]
 if[levelnum >=1; -1 (string .z.Z), " : ", p, "\t",m];
 }

fatal: out["FATAL"; levels `fatal];
error: out["ERROR"; levels `error];
warn : out["WARN" ; levels `warn];
info : out["INFO" ; levels `info];
debug: out["DEBUG"; levels `debug];

format:{[m] (string .z.Z), " : ", m}

setLevel:{
	.log.info "Setting log level to ", string x;
	`.log.levelnum set levels x;
	`.log.level set x;
 }


\d .