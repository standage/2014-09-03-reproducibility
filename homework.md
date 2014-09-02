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

<img alt="Workflow for a Fake Project" style="width: 20em" src="example.png" />

Each box in the workflow is a data file or document associated with the project.
The arrows between boxes show the dependencies between files.
For example, ``manuscript_template.md`` and ``table.md`` must be in place and up-to-date before we can create ``manuscript.md``.

Note that the green boxes have no dependencies: these are the primary data files.
All other files in the workflow (blue boxes) are automatically generated, and we should treat them as read-only.

### Brief description of files

- ``manuscript.pdf``: This is the final product describing the results, materials & methods, and conclusions of the project.
- ``manuscript.md``: This is a Markdown file containing the final text of the manuscript in plain text format.
- ``manuscript_template.md``: This Markdown file contains the text of the manuscript, but is incomplete: it contains a placeholder for a table. The final Markdown file is produced by replacing this placeholder with ``table.md``, which is done using the ``embed-table.py`` script.
- ``table.md``: This is a very small Markdown file containing a single table to be embedded in the final manuscript. This Markdown file is created from the two ``.dist`` files using the ``table.py`` script.
- ``distances.png``: This is a graphic to be embedded in the final manuscript. It is created from the two ``.dist`` files using the ``dist.R`` script.
- ``observations.png``: This is a graphic to be embedded in the final manuscript. It is created from the two ``.dat`` files using the ``pos.R`` script.
- ``treatment.dist`` and ``control.dist``: These are data files that are produced from the respective ``.dat`` files using the ``dist.py`` script.
- ``treatment.dat`` and ``control.dat``: These are the raw data files.

### Getting the files

Use the following command to download the files for this project and change to the working directory.

```bash
git pull https://github.com/standage/2014-09-03-reproducibility.git
cd 2014-09-03-reproducibility/make-tutorial
```

Execute ``ls -lh`` in the directory to see its contents.
You'll see data files, PNG graphics, Markdown documents, scripts, and the final PDF.
Everything needed to recreate this PDF from scratch is contained in this directory--that is, assuming that Python, R, and Pandoc have been installed on this machine.

## Questions

1. Execute the ``make`` command and record the output of the command. Explain what this output means and why it was given.
2. 
    1. Execute ``rm observations.png`` to delete the graphic file. Without running ``make``, look at where this graphic fits in to the entire workflow, determine which files will have to be recreated, and record your answer. Then run ``make`` and record the commands it ran. Indicate whether your estimate was correct and explain why Make did what it did.
    2. Execute ``touch observations.png`` to modify the timestamp of the graphic file. Again, without running ``make``, determine which files will have to be recreated and record your answer. Then run ``make`` and record the commands it ran. Indicate whether your estimate was correct and explain why Make did what it did.
3. Let's look at a more realistic scenario for a research project. Open the ``dist.py`` script and find the ``distance`` function. There is actually a bug in the function: ``(p2.y - p2.y)`` should read ``(p1.y - p2.y)``. That means that the ``.dist`` data files and anything that depends on these files is incorrect. If you fix this bug and execute ``make``, which files will have to be rebuilt? Record your prediction before running Make, then run ``make`` and compare the results to your prediction.
4. The data files for this fake project are pretty small, and the scripts that process the data run very quickly. In real bioinformatics projects, you'll often work with much larger data files that take more time to process.
    1. Edit the ``dist.py`` file: after the line indicating the main method, add the following line: ``time.sleep(10)``. Essentially this is telling the script to wait 10 seconds before doing anything. Now we can observe what happens when certain steps in our workflow take more time to complete.
    2. Run ``make clean`` to remove all computer generated files in the directory, leaving only the scripts, data files, and manuscript template.
    3. Now, run ``time make`` to recreate the manuscript and all of the intermediate files. (Putting ``time`` before the ``make`` command tells the shell to print the time it takes to run the command. Three different times will be reported, but the *real* time is the one that we are interested in.) Record how much time it took to recreate the manuscript from scratch.
    4. Make has a ``-j`` option that allows you to specify the number of jobs that make can run concurrently. For example, if your machine has 4 available processors, then running ``make -j 4`` will tell Make to run 4 jobs at the same time whenever possible. Sometimes Make can only run 1 job at once, but if two or more files are independent of each other Make can create them in parallel. Clean up the working directory again with ``make clean``, and then run ``time make -j 2`` to recreate the manuscript again. Record how much time it took to build the manuscript when we allow Make to run 2 jobs at once.
    5. Compare your time from *4.iii* to your time from *4.iv* and explain the difference.
5. Make allows you to create pattern rules, enabling you to build many files using the same instructions. For example, if you create **f1.bam** by running ``map.py f1.fq > f1.bam`` and you create **f2.bam** by running ``map.py f2.fq > f2.bam``, then you can easily create a single pattern rule to build both of these files. Simply use ``%.bam`` as your target, include ``%.fq`` in your prerequisites, and use ``map.py $*.fq > $*.bam`` as your build command (see [this page](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html#Automatic-Variables) for a description of Make's special variables).
    1. Now, look at the Makefile for the project. You'll notice that the build instructions for **control.dist** and **treatment.dist** are almost identical. Delete the original rules for these two files.
    2. Write a new generic (pattern) rule to replace the two rules you just deleted.
