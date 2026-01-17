# homelab

A docker-based homelab hosting several applications.

## Installation

Clone the repository
```shell
git clone https://github.com/notmadis/homelab
cd homelab
```

Run the installation script
```shell
./install.sh
```

This script will:
- Set up backup directories
- Set up Jellyfin media library directories
- Install necessary programs for homelab

Edit the `.env.example` file and change the filename to `.env`
```shell
mv .env.example .env
```


## Running with docker
```shell
docker compose up -d
```

Applications can currently be accessed on server ip. Nginx proxy manager can be set up as well.

## Apps

There are several self-hosted applications in this homelab.

- [Linkding](https://github.com/sissbruecker/linkding)
- [Jellyfin](https://github.com/jellyfin/jellyfin)
- [Prometheus](https://github.com/prometheus/prometheus)
- [Grafana](https://github.com/grafana/grafana)
- [Syncthing]()
- [PiHole](https://pi-hole.net/)
- [Excalidraw](https://excalidraw.com/)
- [Nginx Proxy manager](https://nginxproxymanager.com)

### linkding

Linkding is a bookmark management service. The data is stored in an sqlite3 database.

#### Backup

Cron job will be installed with `install.sh`. The backup script will pack everything in a zip file and the file will be copied to backup directory `~/backups/linkding`. The document detailing this can be found [here](https://github.com/sissbruecker/linkding/blob/5330252db9f452e77282ef2f9cc9585e9bf7ae04/docs/src/content/docs/backups.md#L4) The script will also find more than 30 days old backups from linking docker container and remove them as well in the backup script.

### Monitoring

The monitoring stack consists of Prometheus and Grafana. When setting up grafana, it already has preconfigured Prometheus datasource and template Dasbaord.

Current exporters:
- [node exporter](https://github.com/prometheus/node_exporter)

### Syncthing

Syncthing syncs personal notes with the server. Setting up instructions are [here](https://docs.syncthing.net/intro/getting-started.html). Syncthing runs on all devices that are synced. To autostart Syncthing on Linux, follow [this](https://docs.syncthing.net/users/autostart.html#linux) guide. Syncthing needs to run as a **user service**.


### Pi-hole

Pi-hole is running in a container on port `8082`. Listening to DNS requests on port `53`.

#### Setting Pi-hole as a local DNS:

Before running Pi-hole, the host system (Ubuntu) must release **Port 53** so the PiHole container can bind to it. By default, `systemd-resolved` listens on this port.

1. Disable the Default DNS listener
Edit the systemd-resolved configuration:
```shell
sudo vim /etc/systemd/resolved.conf
```

Uncomment and change these lines
```shell

[Resolve]
DNS=8.8.8.8 1.1.1.1
...
DNSStubListener=no
```

2. Fix the symlink
```shell
sudo rm /etc/resolv.conf
sudo ln -s /run/systemd/resolve/resolv.conf /etc/resolv.conf
```

3. Apply changes

```shell
sudo systemctl restart systemd-resolved
```
4. Make sure nothing is running on port 53

```shell
sudo lsof -i :53
```
Password can be found in the container logs

5. Set local DNS as homelab ip in router settings.
6. Configure local DNS records n Pi-hole and also in Nginx Proxy manager

## Network

Network is defined in a single docker compose file.


## TODO

- [x] Add installation script
- [x] Add cronjob feature in the install script
- [x] Nginx and DNS setup, include readme for network 
- [ ] Implement https
- [ ] Backup script for Jellyfin config files
- [ ] Backup script for Grafana
- [ ] Backup script for Syncthing config files and data
- [ ] Implement secrets management

## More apps


- [Archivebox](https://github.com/ArchiveBox/ArchiveBox/) - Archive webpages
- [Wallabag](https://github.com/wallabag/wallabag) - Webpage manager

