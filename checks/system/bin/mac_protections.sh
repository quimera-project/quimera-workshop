#!/bin/sh
eval $IMPORTS

# ⋘ Gatekeeper ⋙
spctl=$(spctl --status 2>/dev/null)
if [ $? -eq 0 ]; then
  case "$spctl" in
    *disabled*) gatekeeper=$($JO type="question" query="Is Gatekeeper enabled?" answer="$($JO text="No" level="high")") ;;
    *) gatekeeper=$($JO type="question" query="Is Gatekeeper enabled?" answer="Yes") ;;
  esac
else
  gatekeeper=$($JO type="question" query="Is Gatekeeper enabled?" answer="$($JO text="Couldn't be found" level="missing")")
fi

# ⋘ Sleepimage ⋙
sysctl=$(sysctl vm.swapusage 2>/dev/null | grep "encrypted")
if [ $? -eq 0 ]; then
  case "$sysctl" in
    *encrypted*) sleepimage=$($JO type="question" query="Is Sleepimage encrypted?" answer="Yes") ;;
    *) sleepimage=$($JO type="question" query="Is Sleepimage encrypted?" answer="No") ;;
  esac
else
  sleepimage=$($JO type="question" query="Is Sleepimage encrypted?" answer="No")
fi

# ⋘ XProtect ⋙
# (system_profiler SPInstallHistoryDataType 2>/dev /null | grep -A 4 "XProtectPlistConfigData" | tail -n 5 | grep -Iv "^$") || echo_no

# ⋘ SIP ⋙
csrutil=$(csrutil status 2>/dev/null)
if [ $? -eq 0 ]; then
  case "$csrutil" in
    *disabled*) sip=$($JO type="question" query="Is SIP enabled?" answer="No") ;;
    *enabled*) sip=$($JO type="question" query="Is SIP enabled?" answer="Yes") ;;
    *) sip=$($JO type="question" query="Is SIP enabled?" answer="$($JO text="Couldn't be found" level="missing")") ;;
  esac
else
  sip=$($JO type="question" query="Is SIP enabled?" answer="No")
fi

# ⋘ JAMF ⋙
( (jamf checkJSSConnection 2>/dev/null) && jamf=$($JO type="question" query="Is this machine connected to JAMF?" answer="Yes") ) || jamf=$($JO type="question" query="Is this machine connected to JAMF?" answer="$($JO text="Couldn't be found" level="missing")")

# ⋘ AD ⋙
( (dsconfigad -show) && ad=$($JO type="question" query="Is this machine connected to an Active Directory?" answer="Yes") ) || ad=$($JO type="question" query="Is this machine connected to an Active Directory?" answer="No")

