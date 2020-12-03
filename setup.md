# Reserve Resources

First use the given rspec file to reserve resources.

Only `node-0`, `node-1` and `node-2` need the following configuration.

# Run Setup script

First run the script `setup.sh`

# Manual Configuration

Some configuration cannot be done automatically. Follow the
instructions below:

1. Stop the `transmission-daemon` service:

```
sudo service transmission-daemon stop
```

2. Run `transmission-daemon` as current user:

```
transmission-daemon -f
```

3. Press Ctrl-C stop the `transmission-daemon` process. The first time
you run `transmission-daemon`, it will create a configuration file
for the current user, which is located at
`~/.config/transmission-daemon/settings.json`.

4. Open `~/.config/transmission-daemon/settings.json`. Find the entry
`download-dir` and set its value to the directory as you want,
e.g. `~/downloads`. Find another entry
`rpc-authentication-required` and make sure its value is set to
false.

5. The automated script should already download the file we want to
share and name it as `Beethoven_Symphony_NO5_IV_Finale.mp3`. We
create a torrent of it:

```
ctorrent -t -u "http:TRACKER_SERVER_IP:6969/announce" -s beethoven.torrent Beethoven_Symphony_NO5_IV_Finale.mp3
```

6. Distribute the .torrent files to other seeding hosts and
downloading host.

7. On the seeding host, make sure the .mp3 file is located in the
download directory you set. For =aria2c=, the directory is set in
the automated script as `~/downloads`. Otherwise, it will not seed
but download.

