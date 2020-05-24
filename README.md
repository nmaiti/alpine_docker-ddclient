# docker-ddclient Alpine
docker-ddclient using alpine linux container

use ddclient to update dynamic dns of name servers.
Example configs are kept inside /etc/ddclient/config
put the ddclient.conf inside config folder

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
