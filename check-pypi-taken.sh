# usage sh script.sh <name>

HTTP_STATUS=$(curl -s -o /dev/null -w '%{http_code}\n' "https://pypi.org/simple/$1/")

if [[ "$HTTP_STATUS" -eq 404 ]]; then
    echo "Not taken!"
else
    echo "taken"
fi