
path_str:"D:/"
/ path_str:"/Users/hewei/data/"
path:hsym`$path_str

files:key path
check: {[f] (5_string[f]) like "12345678*.csv"}
inputs: files where check each files  / files:DEPBC12345678201806.csv, LOABC12345678201806.csv, LOAFC1234567801806.csv

FMD5: {(6#x),"",/string md5 x}

process:{
	filename:path_str,(-3_string[f]),"dat";
	DEP: flip `DataDT`T1`T2`T3!("****";",") 0: hsym[path_str,string[f]];
	LOA: flip `DataDT`T1`T2`T3`T4`T5!("**S***";",") 0: hsym[path_str,string[f]];
	LOA: update T3: FMD5 each T3 where T2 = `1;
	hsym[`$filename] 0: 1_"|" 0: DEP;
	hsym[`$filename] 0: 1_"|" 0: LOA
}

process each inputs