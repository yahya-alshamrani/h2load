# h2load
build h2load in a container


## Usage
```bash
git clone https://github.com/yahya-alshamrani/h2load.git ./h2load
podman build -t h2load ./h2load
podman run --rm -it localhost/h2load bash
