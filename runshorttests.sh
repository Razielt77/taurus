echo TOKEN=$TOKEN
echo CF_VOLUME_PATH=$CF_VOLUME_PATH
bzt letschat_short.yml -report -o modules.blazemeter.token=$TOKEN -o modules.blazemeter.test=letschat |& tee result.txt
export PER_LINK=$(cat result.txt | grep Online | grep -o "https://.*")
export PER_LATE=$(cat result.txt | grep -o "latency \w*.\w*" | grep -o "\w*\.\w*")
#PER_LINK=www
echo PER_LINK=$PER_LINK
echo PER_LATE=$PER_LATE
echo PER_LINK=$PER_LINK >> $CF_VOLUME_PATH/env_vars_to_export
echo PER_LATE=$PER_LATE >> $CF_VOLUME_PATH/env_vars_to_export
