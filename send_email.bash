SENDGRID_API_KEY= ENV["SENDGRID_API_KEY"]
EMAIL_TO="karthiksabharitgs@gmail.com"
FROM_EMAIL="sabhari@rootquotient.com"
FROM_NAME="Sabhari Karthik"
SUBJECT="Test"

bodyHTML="<p>Email body goes here</p>"

maildata='{"personalizations": [{"to": [{"email": "'${EMAIL_TO}'"}]}],"from": {"email": "'${FROM_EMAIL}'", 
	"name": "'${FROM_NAME}'"},"subject": "'${SUBJECT}'","content": [{"type": "text/html", "value": "'${bodyHTML}'"}]}'

curl --request POST \
  --url https://api.sendgrid.com/v3/mail/send \
  --header 'Authorization: Bearer '$SENDGRID_API_KEY \
  --header 'Content-Type: application/json' \
  --data "'$maildata'"
