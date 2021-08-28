# Charts

A collection of helm charts for ducoterra.net

## Adding a chart

1. Create a folder with the name of your desired chart in `charts`
2. Copy the chart contents in with `rsync -r ../$APP/chart/ charts/$APP/$VERSION`
3. Create a `questions.yaml` in `charts/$APP/$VERSION`
4. Copy the README into the charts folder with `cp ../app/README.md charts/$APP/$VERSION`
5. Create an "ix_values.yaml" with `cp charts/$APP/$VERSION/values.yaml charts/$APP/$VERSION/ix_values.yaml`

```bash
APP=app_name
APP_PATH=/path/to/app/repo
CHART_PATH=/path/to/chart
VERSION=0.1.0

mkdir -p charts/$APP
rsync -r $CHART_PATH/ charts/$APP/$VERSION
touch charts/$APP/$VERSION/questions.yaml
touch charts/$APP/item.yaml
cp $APP_PATH/README.md charts/$APP/$VERSION
cp charts/$APP/$VERSION/README.md charts/$APP/$VERSION/app-readme.md
cp charts/$APP/$VERSION/values.yaml charts/$APP/$VERSION/ix_values.yaml
```
