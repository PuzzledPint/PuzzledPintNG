# Puzzled Pint: The Next Generation

## Overview

The PuzzledPintNG initiative has the goal of updating the <http://PuzzledPint.com> content management system to something more modern, maintainable, and flexible. When Puzzled Pint started, our needs were small. We propped up a basic website using the Concrete5 CMS because it was easy and it's Portland-made! That was when we were a single city and only had a few months worth of puzzles. As we've grown to over 80 locations around the world, with 10 years of puzzle history, we've had to fight Concrete5 more than we'd like.

The PuzzledPintNG website architecture's aim is to use [WordPress](https://developer.wordpress.org) as scaffolding, adding the functionality we require through page content and plugins.

## License

Like everything we do as a nonprofit, this project is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-nc-sa/3.0/).

## Prerequisites

The development and test environment for PuzzledPintNG is Docker-based. This makes it easy for most developers to spin up a development environment, do some work, and then destroy the development sandboxes when done. You will need:

- Docker, depending on operating system:
	- [Docker Desktop](https://docs.docker.com/get-docker/) for Mac or Windows.
	- Docker for Linux. You'll likely need to use your distribution's `apt-get`, `yum`, or `apk` to install and start.
- `make` to run the Makefile targets to start, stop, save, load, etc.
	- Linux: You probably have this already.
	- macOS: You may need to install either [Xcode](https://apps.apple.com/us/app/xcode/id497799835?mt=12) from the App Store or the the [Xcode command line tools](https://developer.apple.com/download/all/?q=xcode) (which may require you to create a free developer login).
	- Windows: This is out of my realm. I suspect you'll want [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/about) to install Ubuntu. If a reader knows better or more detail, please let me know.

## Getting Started

Ensure the Docker service is running and you're at a command line in the PuzzledPintNG folder. Run the following command:

```
make bootstrap
```

This will install MySQL and WordPress from Docker Hub. It will then start the services within Docker. Once started, it will load a snapshot of the database. You will be able to access the development website at `http://localhost:8080`.

## Contributing

Since we're using WordPress as a base CMS, we're looking for these sorts of volunteers:

- Folks fluent in HTML and CSS, to help with the custom theme and page layouts. Think: the front page with chalkboard, or using KML files to embed a Google Map with cities.
- Folks fluent in back-end PHP and MySQL, especially those with experience in extending WordPress with [plugins](https://developer.wordpress.org/plugins/). Think: shortcodes to embed content like a map or the month's event locations; a new back-end editor for city GC to enter locations.

And ideally, folks well-versed in both.

For more details, see the following documents:

- [architecture.md](./doc/architecture.md) — More detailed documentation on the architecture and philosophy.
- [tasks.md](./doc/tasks.md) — Tasks needing completion.

## Cleaning Up

All done with development? Everything lives in four spots: this project folder, the `puzzledpintng_db_1` container, the `puzzledpintng_wordpress_1` container, the `db_data` Docker volume. Run the command `make clean` to remove all the Docker pieces (the two containers and the data volume). Then you can safely delete the PuzzledPintNG container. We're sorry to see you go.

