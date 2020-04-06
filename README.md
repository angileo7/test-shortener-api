# test-shortener-api
How to Install
git clone https://github.com/angileo7/test-shortener-api.git

cd test-shortener-api

cd api_service

create .env file based on the .env.sample file

chmod +x entrypoint/docker-entrypoint.sh

docker-compose up

So far there are two containers running: app (the api) and the database(PostgreSQL database)

Now we need to initialize our Rails environment: with all containers already running, attach the 'app' container to a new shell hten run next commands in another(a new one) terminal 
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:create
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:migrate
docker-compose​​ ​​exec​​ app ​​rails​​ ​db:seed

Explanation how about hte algoritm works.
When a new URL comes, the string is enconded with a base64 in order to be hashed, then the result is stored inside the database alongside the original url.

For example: www.verylooooooooooooooooooooooooooooooong-url.mx/sfknsñldkfnsadjknsajkcjksbdasderercssdfgsd
then the url is enconded : 'test.angel/shorturl'
then the data is stored in the database.

When a user tries the short url('test.angel/shorturl') the api returns the original url to the user.
