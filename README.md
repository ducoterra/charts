# Charts

A collection of helm charts for ducoterra.net

## Adding a chart

1. Create a folder with the name of your desired chart in `charts`
2. Copy the chart contents in with `rsync -r ../app/chart/ charts/app/<version>`
3. Copy the README into the charts folder with `cp ../app/README.md charts/app/<version>`
4. Create a "default_values.yaml" with `cp charts/app/<version>/values.yaml charts/app/<version>/default_values.yaml`
