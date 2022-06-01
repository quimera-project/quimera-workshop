#!/bin/sh
eval $IMPORTS

# lpstat=$(lpstat -a 2>/dev/null)
# printer="$printer,$($JO type="raw" text="$lpstat")"
# printer="$($JO type="nested" subchecks="[$printer]")"

# system_profiler=$(system_profiler SPPrintersDataType 2>/dev/null)
# printer="$printer,$($JO type="raw" text="$system_profiler")"
# printer="$($JO type="nested" subchecks="[$printer]")"