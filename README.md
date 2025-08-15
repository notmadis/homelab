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
- Install necessary programs for homelab

Edit the `.env.example` file and change the filename to `.env`

## Running with docker
```shell
docker compose up -d
```

Applications can currently be accessed on server ip.

## Apps

There are several self-hosted applications in this homelab.

- [Linkding](https://github.com/sissbruecker/linkding)
- [homebox](https://github.com/sysadminsmedia/homebox)

### homebox

Inventory management system.
Data is stored in sqlite3 database.

### linkding

Linkding is a bookmark management service. The data is stored in an sqlite3 database.

#### Backup

Cron job will be installed with `install.sh`. The backup script will pack everything in a zip file and the file will be copied to backup directory `~/backups/linkding`. The document detailing this can be found [here](https://github.com/sissbruecker/linkding/blob/5330252db9f452e77282ef2f9cc9585e9bf7ae04/docs/src/content/docs/backups.md#L4) The script will also find more than 30 days old backups from linking docker container and remove them as well in the backup script.


## Network

Network is defined in a single docker compose file.


## TODO

- [x] Add installation script
- [x] Add cronjob feature in the install script
- [ ] Add homebox backup feature
- [ ] Nginx and DNS setup, include readme for network 

## More apps

- **mealie** - manage recipies
- **jellyfin** - media server
- **Bar assistant**
- [Archivebox](https://github.com/ArchiveBox/ArchiveBox/) - Archive webpages
- [Wallabag](https://github.com/wallabag/wallabag) - Webpage manager
- [Tube Archivist](https://github.com/tubearchivist/tubearchivist) - Download and host youtube videos

