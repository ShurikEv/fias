#!/bin/bash
echo 'START update FIAS'

date --rfc-3339=seconds && echo 'START create schema import'
time psql -U postgres -d fias -wtc "CREATE SCHEMA IF NOT EXISTS import"
date --rfc-3339=seconds && echo 'FINISH create schema import'

date --rfc-3339=seconds && echo 'START import-update-dbf'
time bash /home/fias/cmd/import-update-dbf.sh
date --rfc-3339=seconds && echo 'FINISH import-update-dbf'

date --rfc-3339=seconds && echo 'START update-reference'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/update-reference.sql
date --rfc-3339=seconds && echo 'FINISH update-reference'

date --rfc-3339=seconds && echo 'START index-for-address-object'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/index-for-address-object.sql
date --rfc-3339=seconds && echo 'FINISH index-for-address-object'

date --rfc-3339=seconds && echo 'START update-address-object'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/update-address-object.sql
date --rfc-3339=seconds && echo 'FINISH update-address-object'

date --rfc-3339=seconds && echo 'START insert-address-object'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/insert-address-object.sql
date --rfc-3339=seconds && echo 'FINISH insert-address-object'

date --rfc-3339=seconds && echo 'START index-for-house'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/index-for-house.sql
date --rfc-3339=seconds && echo 'FINISH index-for-house'

date --rfc-3339=seconds && echo 'START update-house'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/update-house.sql
date --rfc-3339=seconds && echo 'FINISH update-house'

date --rfc-3339=seconds && echo 'START insert-house'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/insert-house.sql
date --rfc-3339=seconds && echo 'FINISH insert-house'

date --rfc-3339=seconds && echo 'START index-for-room'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/index-for-room.sql
date --rfc-3339=seconds && echo 'FINISH index-for-room'

date --rfc-3339=seconds && echo 'START update-room'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/update-room.sql
date --rfc-3339=seconds && echo 'FINISH update-room'

date --rfc-3339=seconds && echo 'START insert-room'
time psql -U postgres -d fias -wab \
    -f /home/fias/cmd/insert-room.sql
date --rfc-3339=seconds && echo 'FINISH insert-room'

echo 'FINISH update FIAS'
