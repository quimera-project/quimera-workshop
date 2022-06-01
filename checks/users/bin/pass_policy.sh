#!/bin/sh
eval $IMPORTS

policy_list=$(grep "^PASS_MIN_DAYS\|^PASS_MAX_DAYS\|^PASS_WARN_AGE\|^ENCRYPT_METHOD\|^FAKE_SHELL\|^FAIL_DELAY\|^LOGIN_RETRIES\|^LOG_UNKFAIL_ENAB" /etc/login.defs | while read policy; do
    key=$(echo $policy | awk '{print $1}')
    value=$(echo $policy | awk '{print $2}')
    echo "{\"type\":\"pair\", \"key\":\"$key\", \"value\":\"$value\"},"
done )

if [ "$policy_list" ]; then
    echo "[${policy_list%?}]"
    exit 0
fi

exit 1
