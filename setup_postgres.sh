DB_USERNAME=""
DB_PASSWORD=""

while getopts "u:p" opt; do
  case ${opt} in
    u ) DB_USERNAME="$OPTARG";;
    p ) DB_PASSWORD="$OPTARG";;
    \? ) echo "Usage: ./setup_postgres.sh [-u db_username] [-p db_password]"
      ;;
  esac
done

CREATE_ROLE_QUERY="psql -c \"CREATE ROLE ${DB_USERNAME} WITH PASSWORD '${DB_PASSWORD}' LOGIN SUPERUSER;\""

sudo apt-get install wget ca-certificates
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
sudo apt-get install libpq-dev
sudo -u postgres bash -c $CREATE_ROLE_QUERY
