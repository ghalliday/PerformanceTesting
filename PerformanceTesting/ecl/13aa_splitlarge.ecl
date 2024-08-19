//class=memory
//class=sort

import $ as suite;
import suite.perform.config;
import suite.perform.format;
import suite.perform.files;

ds := DATASET(config.largeRecordCount, format.createParent(COUNTER, config.largeRecordChildren, 0), DISTRIBUTED);

ds2 := (+)(ds, ds, ordered);

output(COUNT(NOFOLD(ds2)) = config.largeRecordCount * 2);
