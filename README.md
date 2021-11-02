# Minecraft

## Running Locally

```bash
# download the most recent version of minecraft
make get-server

# Run the server
docker-compose up
```

## Uploading to Docker Hub

1. Update the version in the VERSION file.
2. Build and push the new version

    ```bash
    make build
    make push
    ```

## Running in kubernetes

Requires helm v3. Edit values.yaml and run the following:

```bash
helm upgrade --install minecraft
```

Your minecraft server will be available on port 25565 by default.

## Create a Backup

```bash
kubectl cp <pod_name>:/mc_data <backup>
```

## Restore from Backup

```bash
kubectl cp <backup> <pod_name>:/mc_data
```

## Cool seeds

### 7485786574821478084

Spawns you next to a nether portal with golden axe and pickaxe. River and Village close by.

### -8018833100564192815

Use with an amplified world, massive island
