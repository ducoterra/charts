# Servers

## Minecraft

```bash
helm install minecraft ./helm --set tag=1.15.2_7 --set port=25565
```

## Pubcraft

```bash
helm install pubcraft ./helm --set tag=1.15.2_7 --set port=20100
```

## TestCraft

```bash
helm install testcraft ./helm --set tag=1.16.1 --set port=25566
```
