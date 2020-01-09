# About
A simple Docker container for running
[osslsigncode](https://sourceforge.net/projects/osslsigncode/). Mostly intended
for CI.

# Usage
Run in interactive mode with your source root bound to `/work`; specify your
setup script as the command:

```sh
docker run --rm -i -v $(pwd):/work pitwch/osslsigncode-docker ARGS
```

Put the following wrapper script in your PATH as e.g. `osslsigncode` to be able
to run just `osslsigncode ARGS`:

```sh
#!/usr/bin/env bash

exec docker run --rm -i -v $(pwd):/work pitwch/osslsigncode-docker "$@"
```

## Important notes
Be aware that depending on how you mount your code into the container, files
referenced by the setup script may or may not be "visible" within the
container. You probably want to make sure all referenced files are at or below
the directory your script is in. The same applies to the output.
