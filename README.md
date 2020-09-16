# pynagio-deb-builder
Ubuntu environment for building pynagio python3 packages

```
dis='ubuntu'
rel='bionic'

mkdir -pv packages/ubuntu/{xenial,bionic,focal}
mkdir -pv packages/debian/jessie

docker build \
    --build-arg dis=$dis \
    --build-arg rel=$rel \
    -t ${dis}-${rel}-pynagio .

docker run \
    -v $(pwd)/packages:/packages \
    --rm \
    --name pynagio_$(date "+%s") \
    -e dis=$dis \
    -e rel=$rel \
    ${dis}-${rel}-pynagio
```

