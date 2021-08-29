# CI Builder

My CI testing pipeline for a django project.

[![pipeline status](https://gitlab.ducoterra.net/ducoterra/ci_builder/badges/master/pipeline.svg)](https://gitlab.ducoterra.net/ducoterra/ci_builder/-/commits/master)

## Prereqs

1. Docker: https://www.docker.com/products/docker-desktop
2. kubectl: https://kubernetes.io/docs/tasks/tools/#kubectl
3. helm: https://helm.sh/docs/intro/install/
4. k3d: https://k3d.io/
5. You'll be using "*.localhost" domains for testing. This means you'll either have to use Chrome (which has these built in) or firefox. In Firefox:

    1. Type `about:config` in the url field of your browser and press enter
    2. Search for `network.dns.localDomains`
    3. Double click to edit the field
    4. Add these values: `button.localhost, pgadmin.localhost, traefik.localhost`
    5. As you build your own sites you can add more to test!

## Docker

```bash
# build the docker image. This uses the build step from docker-compose.yml.
docker compose build

# Now start postgres, pgadmin and traefik
docker compose up -d postgres pgadmin traefik

# Navigate to http://traefik.localhost to see your ingress routes

# View the logs to check the container status
docker compose logs

# Now start the init container and wait for migrations to apply
docker compose up init

# Now start the button container
docker compose up -d button

# View the site logs
docker compose logs --follow button

# Navigate to http://button.localhost

# Take down the site
docker compose down
```

## K3D

```bash
# Create a cluster for our button app
k3d cluster create button -p "80:8000@loadbalancer" --volume $HOME/.kube/registries.yaml:/var/lib/rancher/k3s/registries.yaml
```
