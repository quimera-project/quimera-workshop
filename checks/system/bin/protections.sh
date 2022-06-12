#!/bin/sh
eval $IMPORTS

# ⋘ SELinux ⋙
if [ "$(sestatus 2>/dev/null)"]; then
  case "$(sestatus 2>/dev/null | grep "SELinux status")" in
    *disabled*) selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="No" level="medium")") ;;
    *) selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="Yes" level="info")") ;;
  esac
elif [ "$(command -v selinuxenabled 2>/dev/null)" ]; then
  if [ "$(selinuxenabled 2>/dev/null)" ]; then
    selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="Yes" level="info")")
  else
    selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="No" level="medium")")
  fi
elif [ "$(command -v getenforce 2>/dev/null)" ]; then
  if [ "$(getenforce 2>/dev/null)" = "Disabled" ]; then
    selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="No" level="medium")")
  else
    selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="Yes, in $(getenforce 2>/dev/null) mode" level="info")")
  fi
else
  selinux=$($JO type="question" query="Is SELinux enabled?" answer="$($JO text="Couldn't be found" level="missing")")
fi


# ⋘ AppArmor ⋙
apparmor=$(
if [ "$(command -v aa-status 2>/dev/null)" ]; then
  if [ "$(aa-status --enabled >/dev/null)" ]; then
    $JO type="question" query="Is AppArmor enabled?" answer="$($JO text="Yes" level="info")"
  else
    $JO type="question" query="Is AppArmor enabled?" answer="$($JO text="No" level="medium")"
  fi
elif [ "$(command -v apparmor_status 2>/dev/null)" ]; then
  if [ "$(apparmor_status --enabled >/dev/null)" ]; then
    $JO type="question" query="Is AppArmor enabled?" answer="$($JO text="Yes" level="info")"
  else
    $JO type="question" query="Is AppArmor enabled?" answer="$($JO text="No" level="medium")"
  fi
elif [ "$(ls /etc/apparmor.d 2>/dev/null)" ]; then
    $JO type="question" query="Is AppArmor enabled?" answer="$($JO -a "Only profiles could be found" "$($JO text="/etc/apparmor.d" level="info")")"
else
  $JO type="question" query="Is AppArmor enabled?" answer="$($JO text="Couldn't be found" level="missing")"
fi
)

# ⋘ ASLR ⋙
aslr_value=$(cat /proc/sys/kernel/randomize_va_space 2>/dev/null)
if [ -z "$aslr_value" ]; then
  aslr=$($JO type="question" query="Is ASLR enabled?" answer="$($JO text="Couldn't be found" level="missing")")
else
  case "$aslr_value" in
    0) aslr=$($JO type="question" query="Is ASLR enabled?" answer="$($JO text="No" level="medium")") ;;
    1) aslr=$($JO type="question" query="Is ASLR enabled?" answer="$($JO -a "Yes" "$($JO text=" mode 1" level="info")")") ;;
    2) aslr=$($JO type="question" query="Is ASLR enabled?" answer="$($JO -a "Yes" "$($JO text=" mode 2" level="info")")") ;;
    *) aslr=$($JO type="question" query="Is ASLR enabled?" answer="$($JO text="Couldn't be found" level="missing")") ;;
  esac
fi

# ⋘ Execshield ⋙
execshield_grep=$(grep "exec-shield" /etc/sysctl.conf 2>/dev/null)
if [ $? -eq 0 ]; then
  case "$execshield_grep" in
    *0*) execshield=$($JO type="question" query="Is Execshield enabled?" answer="$($JO text="No" level="high")") ;;
    *1*) execshield=$($JO type="question" query="Is Execshield enabled?" answer="Yes") ;;
    *) execshield=$($JO type="question" query="Is Execshield enabled?" answer="$($JO text="Couldn't be found" level="missing")") ;;
  esac
else
  execshield=$($JO type="question" query="Is Execshield enabled?" answer="$($JO text="Couldn't be found" level="missing")")
fi

# ⋘ Grsecurity ⋙
grsecurity_found=$($JO text="Couldn't be found" level="missing")
(uname -r | grep "\-grsec" >/dev/null 2>&1 || grep "grsecurity" /etc/sysctl.conf >/dev/null 2>&1) && grsecurity_found="Yes"
grsecurity=$($JO type="question" query="Is Grsecurity present?" answer="$grsecurity_found")

# ⋘ PaX ⋙
pax_found=$($JO text="Couldn't be found" level="missing")
(command -v paxctl-ng paxctl >/dev/null 2>&1 && pax_found="Yes")
pax=$($JO type="question" query="Are PaX binaries present?" answer="$pax_found")

$JO -a "$selinux" "$apparmor" "$aslr" "$execshield" "$grsecurity" "$pax"

exit 0