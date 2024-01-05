/usr/bin/sed -i "" 's/END = "end".freeze/END_ENUM = "end".freeze/' $1
/usr/bin/sed -i "" 's/END]/END_ENUM]/' $1
