# PostgreSQL 9.5 container with daily backups

Creates a container for PostgreSQL 9.5 for Vagrant+VirtualBox or Docker.

The database name will be the name of the directory you checkout the repository into,
this means for each database you want to maintain

    git clone https://github.com/HarryR/vagrant-psql.git myapp-psql

A random schema name, login and password are chosen when provisioned, details are displayed on the console.

	make vagrant-install vagrant-up psql

Daily and weekly backups for the past week and then month are kept in the `backups` directory, add a cron job to perform the backup:

    @daily make -C /path-to-vagrant/dir vagrant-backup
    @reboot make -C /path-to-vagrant/dir vagrant-up

Each Sunday's backups will be kept, and the past 7 days will be kept, resulting in files like:

 * `backups/20161203.tar.xz`
 * `backups/20161210.tar.xz`
 * `backups/20161217.tar.xz`
 * `backups/20161218.tar.xz`
 * `backups/20161219.tar.xz`
 * `backups/20161220.tar.xz`
 * `backups/20161221.tar.xz`
 * `backups/20161222.tar.xz`
 * `backups/20161223.tar.xz`

If your database grows to a large size then while these backups are compressed they will accumulate many slightly different files and consume space, you can push the weekly or monthly backups remotely into the cloud.

Restore from the latest available snapshot is possible, put the .tar.xz file into the `backups/` directory and run:

    make restore vagrant-up

To destroy the box, and all runtime data, but will not delete backups:

    make vagrant-destroy xxx-destroy-data
