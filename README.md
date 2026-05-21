# Transparent Background


**Windows PowerShell**

```pwsh
docker run -it --rm -v ${PWD}\input:/input -v ${PWD}\output:/output --gpus all ghcr.io/lewohy/transparent-background --source /input --dest /output
```
