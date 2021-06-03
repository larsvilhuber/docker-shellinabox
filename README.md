# Stata on the web (home version)

Docker container serving Stata (via [aeadataeditor/docker-stata](https://github.com/aeadataeditor/docker-stata)) via a web terminal ([shellinabox](https://code.google.com/p/shellinabox/) via [spali/docker-shellinabox](https://github.com/spali/docker-shellinabox)).

> Be aware that using such an container on a prodution host could have a security risk impact on your docker host and containers.

## Method

The [Dockerfile](Dockerfile) leverages an existing Stata Docker container, and adds the [shellinabox](https://code.google.com/p/shellinabox/) functionality. 

## Building image

``` 
DOCKER_BUILDKIT=1 docker build  . -t larsvilhuber/statainabox
```

## Runtime Configuration

The Stata component expects to have a license file mounted into the container. Docker command-line options:

```
-v /path/to/stata.lic.14:/usr/local/stata14/stata.lic 
```

Users may also want to mount external directories into the container with code and data, for instance,

```
 -v /path/to/code:/code   \
 -v /path/to/data:/data   \
 -v /path/to/results:/results 
```

The shell component requires a password to be set. The user is hard-coded to `statauser`, the password can be set via the environment variable `PASSWORD`:

```
-e PASSWORD=makemedifferent
```

Otherwise, a random password is generated at each start of the image, and printed to the console. This may not be visible when using web consoles.

The default port of [shellinabox](https://code.google.com/p/shellinabox/) is 4200, but could be redirected when launching the container:

```
-p 4242:4200
```

### Examples

For local testing, see `test.sh` for a sample call.

## Accessing

Once started, the following URLs are made available (all require login for user `statauser` with the `PASSWORD` ), note also the HTTPS connection using a self-signed certificate.

- https://localhost:4200/ (Stata interface)
- https://localhost:4200/stata/ (same Stata interface)
- https://localhost:4200/login/ (basic shell access, for debugging or shell operations)

## Debugging and Sources

- https://github.com/spali/docker-shellinabox
- https://github.com/shellinabox/shellinabox/wiki/shellinaboxd_man
- http://www.linuxintro.org/wiki/Shell_in_a_box#cannot_read_valid_certificate

## Licenses

- Shellinabox: see [LICENSE.shellinabox](LICENSE.shellinabox)
- Stata in Docker: see restrictions at [aeadataeditor/docker-stata](https://github.com/aeadataeditor/docker-stata)).
