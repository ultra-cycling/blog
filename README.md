# ultra-cycling.de blog

This repository feeds the blog that you can find under [https://ultra-cycling.de](https://ultra-cycling.de). It's driven by the [HUGO Static Site Generator](https://gohugo.io/).

## Run the blog locally

In order to start HUGO as a server to run the blog locally, just type:

```shell
$ hugo server
```

from the root of this repository.

## `./do.sh` script

The `./do.sh` script contains some maintenance tasks. You get a man page by running it without any parameters:

```text
$ ./do.sh
Usage: ./do.sh
         thumbs <maxWidthHeight> <dir>   creates thumbnails for all files in <dir> with max width or height <maxWidthHeight>
```

### Resize thumbnail images

There is a `./do.sh` task that lets you generate downsized thumbnails from all files in a given directory, e.g.

```shell
./do.sh thumbs 600 static/images/2021-04-09-journey-into-long-distance-cycling
```

## Resources

* [HUGO Static Site Generator](https://gohugo.io/)
* [HUGO template techfeed](https://docs.gethugothemes.com/techfeed) - check also the [README](themes/techfeed-hugo/README.md)
* [HUGO easy gallery](https://github.com/liwenyip/hugo-easy-gallery)
* [GitHub Actions for HUGO](https://ruddra.com/hugo-deploy-static-page-using-github-actions/)
