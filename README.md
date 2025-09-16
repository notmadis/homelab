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

### linkding

Linkding is a bookmark management service. The data is stored in an sqlite3 database.

#### Backup

Cron job will be installed with `install.sh`. The backup script will pack everything in a zip file and the file will be copied to backup directory `~/backups/linkding`. The document detailing this can be found [here](https://github.com/sissbruecker/linkding/blob/5330252db9f452e77282ef2f9cc9585e9bf7ae04/docs/src/content/docs/backups.md#L4) The script will also find more than 30 days old backups from linking docker container and remove them as well in the backup script.

### Monitoring

The monitoring stack consists of Prometheus and Grafana. When setting up grafana, it already has preconfigured Prometheus datasource and template Dasbaord.

Current exporters:
- [node exporter](https://github.com/prometheus/node_exporter)

## Network

Network is defined in a single docker compose file.


## TODO

- [x] Add installation script
- [x] Add cronjob feature in the install script
- [x] Nginx and DNS setup, include readme for network 
- [ ] Backup script for Jellyfin
- [ ] Backup script for Grafana 

## More apps

- **mealie** - manage recipies
- **Bar assistant**
- [Archivebox](https://github.com/ArchiveBox/ArchiveBox/) - Archive webpages
- [Wallabag](https://github.com/wallabag/wallabag) - Webpage manager

