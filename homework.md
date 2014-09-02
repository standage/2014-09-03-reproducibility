# Reproducibility in Bioinformatics

## Homework: The Executable Paper

The ideal in reproducible research is an automated workflow that produces a publication-ready manuscript (including graphics and tables) directly from raw data.
If this workflow is implemented as a Makefile or shell script, then creating or recreating the paper should be as simple as running `make` or `bash build.sh` on the command line.
Granted, sometimes there are practical obstacles to achieving this ideal--for example, you may have to run some analysis steps on a cluster with huge amounts of memory, while other visualization steps require R libraries not available on that cluster.
Acknowledging such technical obstacles, the ideal of the "executable paper" is nevertheless a very realistic standard for bioinformatics and other data-driven sciences.

In this assignment, you will download a fake research manuscript that has been implemented as an "executable paper."
The project workflow has already been implemented as a Makefile, providing an example of how you might do so for your own research project.
There are also some questions to help you gain an understanding of how Make works so you can appreciate how its features might benefit your project.

## Overview

The following graphic shows the workflow for our fake project.

<img alt="Workflow for a Fake Project" style="width: 25em" src="example.png" />

Each box in the workflow is a data file or document associated with the project.
The arrows between boxes show the dependencies between files.
Note that the green boxes have no dependencies: these are the primary data files.
All other files in the workflow (blue boxes) are automatically generated, and we should treat them as read-only.

### Get the files

Use the following command to download the files for this project and change to the working directory.

```bash
git pull https://github.com/standage/2014-09-03-reproducibility.git
cd 2014-09-03-reproducibility/make-tutorial
```

Type ``ls -lh`` in the directory to see its contents.
You'll see data files, PNG graphics, Markdown documents, scripts, and the final PDF.
Everything needed to recreate this PDF from scratch is contained in this directory--that is, assuming that Python, R, and Pandoc have been installed on this machine.

## Questions

1. Coming soon!
