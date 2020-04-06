# test-shortener-api
How to Install
git clone https://github.com/angileo7/test-shortener-api.git

cd test-shortener-api

cd api_service

create .env file based on the .env.sample file

chmod +x entrypoint/docker-entrypoint.sh

docker-compose up

attach 'app' container to a new shell hten run next commands in another(a new one) terminal with all containers already running
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:create
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:migrate
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:seed
