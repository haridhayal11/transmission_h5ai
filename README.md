# transmission_h5ai
A script to install and setup transmission and h5ai file index. 

## Features

Transmission webui will be available at http://serverip:9091
h5ai will be available at http://serverip


## Usage

First, get the script and make it executable

```bash
curl -O https://raw.githubusercontent.com/haridhayal11/transmission_h5ai/master/setup.sh
chmod +x setup.sh
```

Then run it

```sh
sudo bash setup.sh
```
This will open the transmission 's config file, Change the below strings and save the file.
Then the script will continue to finish the installation.

## Strings to change
```sh
    "rpc-username": "transmission",    # username for transmission webui
    "rpc-password": "password",        # password for transmission webui    
    "ratio-limit": 0,                  # change this to enable seeding
```
