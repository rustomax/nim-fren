## Converts filenames in a specific directory to a uniform format
## <prefix><random alphanumerix suffix>.<extension>
##
## Example: ./fren ~/Pictures/Incoming/ futuristic-
## index.jpg -> futuristic-A5X9.jpg

import os
import passgen

if paramCount() != 2:
    echo "usage:"
    echo "  picren <dir> <prefix>"
    quit(-1)

let dir = paramStr(1)
let prefix = paramStr(2)
let glob = joinPath(dir, "/*")

# Check if source directory exists, otherwise exist with error
if not existsDir(dir):
    echo "ERROR: Source directory doesn't exist"
    quit(-2)

# Reporpsing my password generation library
# to generate random filename suffixes
let pg = newPassGen(passlen = 4, flags={fUpper, fDigits})

# Get filenames of files in source directory
# and attempt renaming them according to provided pattern
try:
    for file in walkFiles glob:
        let old_fullname = file
        let (_, fname, fext) = splitFile(file)
        let new_fname = prefix & pg.getPassword() & fext
        let new_fullname = joinPath(dir, new_fname)
        echo fname & fext & " -> " & new_fname
        moveFile(old_fullname, new_fullname)
except OSError:
    let e = getCurrentException()
    echo "ERROR: " & e.msg