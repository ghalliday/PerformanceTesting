//class=index
//class=keyedjoin

#onwarning (4522, ignore);

import $ as suite;
import suite.perform.config;
import suite.perform.format;
import suite.perform.files;
import suite.perform.util;

unsigned scale := IF(config.smokeTest, 0x10000, 0x100);
ds := DATASET(config.simpleRecordCount DIV scale, format.createSimple(1 + (COUNTER-1) * scale), DISTRIBUTED);

j := JOIN(ds, files.manyIndex123,
            RIGHT.id1a = util.byte(LEFT.id1, 0) AND 
            RIGHT.id1b = util.byte(LEFT.id1, 1) AND 
            RIGHT.id1c = util.byte(LEFT.id1, 2) AND 
            RIGHT.id1d = util.byte(LEFT.id1, 3) AND 
            RIGHT.id1e = util.byte(LEFT.id1, 4) AND 
            RIGHT.id1f = util.byte(LEFT.id1, 5) AND 
            RIGHT.id1g = util.byte(LEFT.id1, 6) AND 
            RIGHT.id1h = util.byte(LEFT.id1, 7)); 
cnt := COUNT(NOFOLD(j));

OUTPUT(cnt = config.simpleRecordCount DIV scale);
