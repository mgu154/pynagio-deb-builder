# pynagio-deb-builder
Ubuntu environment for building pynagio python3 packages

```
mkdir -pv packages/bionic
mkdir -pv packages/xenial
dist=xenial
docker build --build-arg ubuntu_release=$dist -t pynagio:${dist} .
docker run -v $(pwd)/packages:/packages --rm --name pynagio_$(date "+%s") -e dist="${dist}" -ti pynagio:${dist}
ls -la packages/"${dist}"
```

