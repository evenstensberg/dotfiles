KEYSTORE="$(/usr/libexec/java_home)/jre/lib/security/cacerts";

function running_as_root()
{
  if [ "$EUID" -ne 0 ]
    then echo "NO"
    exit
  fi

  echo "YES"
}

function import_certs_to_java_keystore
{
  for crt in *.crt; do 
    echo prepping $crt 
    keytool -delete -storepass changeit -alias alias__${crt} -keystore $KEYSTORE;
    keytool -import -file $crt -storepass changeit -noprompt --alias alias__${crt} -keystore $KEYSTORE
    echo 
  done
}

if [ "$(running_as_root)" == "YES" ]
then
  import_certs_to_java_keystore
else
  echo "This script needs to be run as root!"
fi