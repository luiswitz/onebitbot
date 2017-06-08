## One Bit Code Chatbot Project

Slack Chatbot developed in One Bit Code Bootcamp.


## Description

This bot was developed to help teams find useful information quickly in a convenient way.
The bot can save questions and answers from the users, like a FAQ and also save useful links to the team.
The information is inputted by the users so this way everyone can contribute and consume the knowledge.


## Stack
- Ruby
- Sinatra
- Postgresql
- Docker
- [api.ai](api.ai)


## Setup

```
git clone https://github.com/luiswitz/onebitbot.git
cd onebitbot
```

```
docker-compose build
```

```
docker-compose run website rake db:create && db:migrate
```

```
docker-compose run
```
