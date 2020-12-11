#!/bin/bash
#p="This is a top secret."
i=0
sumcnt=0
while [ $i -lt 3 ]
do
p=3439ef
#echo $p
SECONDS=0
cnt=0
while [ 1 ]
  do
    Rand=$(openssl rand -hex 10)
    value_x=$(echo $Rand|openssl dgst -md5)
    #echo $value
    value=${value_x:9:6}
    #echo $value
    #echo $Rand
    cnt=$(( $cnt + 1))
    if [ "$value" = "$p" ]
      then
      echo ok
      echo "Rand is $Rand, md5 hash is $value_x"
      break
    fi
  done

duration=$SECONDS
min=$(($duration / 60))
sec=$(($duration % 60))
echo "time: $min minutes $sec seconds."
echo "cnt is $cnt"
sumcnt=$(( $cnt + $sumcnt))
i=$(( $i + 1))
done

echo "$i times sum cnt is: $sumcnt"
