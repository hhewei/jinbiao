files: key `:D:/
check: {[f] (5_string[f]) like "12345678*.csv"}
inputs: files where check each files  / files:DEPBC12345678201806.csv, LOABC12345678201806.csv, LOAFC1234567801806.csv

FMD5: {(6#x),"",/string md5 x}

process:{
	name: ":D:/",(-3_string[f]),"dat";
	DEP: flip `DataDT`T1`T2`T3!("****";",") 0: `$":D:/", string[f];
	LOA: flip `DataDT`T1`T2`T3`T4`T5!("**S***";",") 0: `$":D:/", string[f];
	LOA: update T3: FMD5 each T3 where T2 = `1;
	(`$"",name) 0: 1_"|" 0: DEP;
	(`$"",name) 0: 1_"|" 0: LOA
}

process each inputs
