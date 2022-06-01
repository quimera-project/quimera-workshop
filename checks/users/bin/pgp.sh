#!/bin/sh
eval $IMPORTS

exit 1

# if [ $(command -v gpg 2>/dev/null) ]; then
#     gpg=$($JO type=checkbox query="gpg binary" passed=true)
#     if [ $(gpg --list-keys 2>/dev/null | wc -c) -gt 0 ]; then
#         gpg="$gpg,$($JO type=raw content=$($JO -a "keys"))"
#     fi
#     binaries="$binaries$($JO type="nested" subchecks="[$gpg]"),"
# else
#     binaries="$binaries$($JO type="checkbox" query="gpg binary" passed=false),"
# fi

# if [ $(command -v netpgpkeys 2>/dev/null) ]; then
#     netpgpkeys=$($JO type=checkbox query="netpgpkeys binary" passed=true)
#     if [ $(netpgpkeys --list-keys 2>/dev/null | wc -c) -gt 0 ]; then
#         netpgpkeys="$netpgpkeys,$($JO type=raw content=$($JO -a "keys"))"
#     fi
#     binaries="$binaries$($JO type="nested" subchecks="[$netpgpkeys]"),"
# else
#     binaries="$binaries$($JO type="checkbox" query="netpgpkeys binary" passed=false),"
# fi

# if [ $(command -v netpgp 2>/dev/null) ]; then
#     netpgp=$($JO type=checkbox query="netpgp binary" passed=true)
#     binaries="$binaries$($JO type=nested subchecks="[$netpgp]"),"
# else
#     binaries="$binaries$($JO type="checkbox" query="netpgp binary" passed=false),"
# fi

# if [ "$binaries" ]; then
#     echo "[${binaries%?}]"
#     exit 0
# fi

# exit 1