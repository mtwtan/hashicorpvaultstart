docker-compose up -d

vaulturi=""
keyslocation="<< Directory of where encrypted keys are stored >>"
keysenc="<< name of encrypted key file >>"
currdir=$(pwd)
cd $keyslocation

./vault.sh d $keysenc vault.json

cd $currdir

httpresult=""
vault_keys=$(cat $keyslocation/vault.json)
export VAULT_ADDR='http://127.0.0.1:8200'

while [[ "$httpresult" != *"200 OK"* ]]
do
#  echo "not ready"
  sleep 3s
  httpresult=$(curl -I -s $vaulturi/ui/ | grep -i "200 ok") 2>&1 > /dev/null

  if [[ "$httpresult" = *"HTTP/1.1 200 OK"* ]]; then 
    echo "Vault is coming up! Giving Vault some time to get things going before unsealing ...";
    sleep 15s
    for i in `seq 0 2`;
      do
         keyvalue=$(echo $vault_keys | jq -r .keys[$i])
         vault operator unseal $keyvalue
      done 
  else 
    echo "Vault is not ready yet..."; 
  fi

done

cd $keyslocation
rm vault.json
cd $currdir

