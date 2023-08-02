LOAD DATA LOCAL INFILE     '/home/ubuntu/...'
INTO TABLE                 pickup
COLUMNS TERMINATED BY      '\t'
LINES TERMINATED BY        '\r\n'
IGNORE                     1 LINES
;