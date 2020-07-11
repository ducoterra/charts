# Servers

## Minecraft

```bash
helm upgrade --install minecraft ./helm --set tag=1.15.2_7 --set port=25565
```

## Pubcraft

```bash
helm upgrade --install pubcraft ./helm --set tag=1.15.2_7 --set port=20100
```

## TestCraft

```bash
helm upgrade --install testcraft ./helm --set tag=1.16.1_2 --set port=25566
```
