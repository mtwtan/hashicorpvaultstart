task=$1
fileIn=$2
fileOut=$3
if [ "$#" -ne 3 ]; then
  echo "You need to give 3 parameters"
  exit 1
fi

if [ "$task" == "e" ]; then
  echo "Encrypting"
  openssl enc -aes-256-cbc -salt -in ${fileIn} -out ${fileOut}
elif [ "$task" == "d" ]; then
  echo "Decrypting"
  openssl enc -aes-256-cbc -d -in ${fileIn} -out ${fileOut} 
else
  echo "please select 'e' or 'd'"
fi
