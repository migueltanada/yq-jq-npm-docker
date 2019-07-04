# How to use container

```
git clone https://github.com/migueltanada/yq-jq-npm-docker
cd yq-jq-npm-docker
docker build -t builder-image .
docker run -v $(pwd):/mnt --rm builder-image bash -c """
<commands here>
"""
```


## Convert sample.yml to json format

```
docker run -v $(pwd):/mnt --rm builder-image bash -c 'yq r /mnt/sample.yml --tojson | jq .'
```

### Result
```
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "labels": {
      "type": "local"
    },
    "name": "task-pv-volume"
  },
  "spec": {
    "accessModes": [
      "ReadWriteOnce"
    ],
    "capacity": {
      "storage": "10Gi"
    },
    "hostPath": {
      "path": "/mnt/data"
    },
    "storageClassName": "manual"
  }
}

```

## Convert sample.json to java properties format

```
docker run -v $(pwd):/mnt --rm builder-image bash -c '''npm install json-to-properties -g
cd /mnt
cat > config.json << EOF
{
    "src":"/mnt",
    "dist":"/mnt"
}
EOF
json-to-properties -c config.json
cat sample.properties
'''
```

### Result


```
/opt/node-v10.16.0-linux-x64/bin/json-to-properties -> /opt/node-v10.16.0-linux-x64/lib/node_modules/json-to-properties/src/index.js
+ json-to-properties@1.1.3
added 3 packages from 3 contributors in 0.471s

apiVersion=v1
kind=PersistentVolume
metadata.labels.type=local
metadata.name=task-pv-volume
spec.accessModes.0=ReadWriteOnce
spec.capacity.storage=10Gi
spec.hostPath.path=/mnt/data
spec.storageClassName=manual

```
