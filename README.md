# Ansistrano Skeleton

You can clone this and integrate it to let you deploy you project using package, deploy and roleback roles of Ansistrano.

You just need to change the configurations in the `group_vars` and `env` folders.

## Start deploy container

    docker-compose build
    docker-compose run --rm deploy

## Run

    ansible-playbook -i env/myhost -k deploy.yml