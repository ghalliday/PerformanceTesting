//class=memory
//class=sort

import $ as suite;
import suite.perform.config;
import suite.perform.format;
import suite.perform.files;

ds := files.generateSimple();

s := sort(ds, id3 % 0x100000, local);  // limit to 1M unique keys

output(COUNT(NOFOLD(s)) = config.simpleRecordCount);
