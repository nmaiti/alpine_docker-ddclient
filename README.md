![License MIT](https://img.shields.io/badge/license-MIT-blue.svg) [![Build Status](https://travis-ci.org/nmaiti/alpine_docker-ddclient.svg?branch=master)](https://travis-ci.org/nmaiti/alpine_docker-ddclient) [![](https://img.shields.io/docker/stars/nbmaiti/ddclient.svg)](https://hub.docker.com/r/nbmaiti/ddclient 'DockerHub') [![](https://img.shields.io/docker/pulls/nbmaiti/ddclient.svg)](https://hub.docker.com/r/nbmaiti/ddclient 'DockerHub')

# docker-ddclient Alpine
docker-ddclient using alpine linux container

use ddclient to update dynamic dns of name servers.
Example configs are kept inside /etc/ddclient/config
put the ddclient.conf inside ddclient-config folder.
Add your ddns configuration and secrets here.

## Usage
### Using Dockerfile
```bash
1) TO build:
    ./dev.sh b
2) To run using Dockerfile
   ./dev.sh r
```

### Using docker-composer
 Without building using dockerhub image using dockercompose
```bash 
 docker-compose up -d
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
[MIT](https://choosealicense.com/licenses/mit/)
