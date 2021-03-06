% Reproducibility
% for Bioinformatics Projects
% Daniel S. Standage, 3 Sept 2014

<style type="text/css">
  h1 { margin-bottom: 0.5em !important; }
</style>

# Reproducibility in Science

##

<a href="http://xkcd.com/242/">
  <image src="xkcd-242.png" width="300" alt="Reproducibility" />
</a>  
http://xkcd.com/242/

## Reproducibility

- central pillar of scientific method
- requires good habits, dedication
- will save you (and others) time and stress

# Facilitating Reproducibility

## \[ree-pr*uh*-**doos**\]

1. I give you my solution (code, data, parameters), you run it and get the same output: **technical reproducibility**
2. I give you a description of my solution, you implement it and get same/similar result: **conceptual reproducibility**

<br />
It's important to facilitate both as much as possible!

## Key enablers

- organization
- automation
- documentation
- ~~version control~~ versionation

# Project Organization

## How to organize your project

- many ways to do it, find something that works for you
- beyond scope of this discussion
- example with salient points:  
[**Noble WS** (2009) A Quick Guide to Organizing Computational Biology Projects. *PLoS Computational Biology*, **5**(7):e1000424.](http://dx.doi.org/10.1371/journal.pcbi.1000424)

# Automation

## Why automate?

- You **_will_** have to run your workflow again!
    - you get more data
    - you discover a flaw in your analysis
    - you need to try new parameters
    - your computer crashes
- It saves you time
    - you delegate tedious tasks to the computer
    - you don't have to babysit the terminal

## How to automate?

- shell scripts
    - simple
    - familiar
- make files (more on this later)
    - awkward syntax
    - more complex
    - powerful features

# Project Documentation

## What to document?

- describe steps of a workflow
- note software versions
- defend important parameter choices
- list issues you've identified and/or overcome
- record commands you have not yet automated

## How to document it?

- README files
- wiki pages
- blogs

# Version control

## Concept

- take periodic snapshots of your project
- maintain searchable, usable project history
- manage work across multiple machines

## Benefits of version control

- facilitates reviewing old code, data, and results
- facilitates collaboration
- provides backup

## Version control systems

- CVS
- Subversion
- git (more on this later)

# More on Make

## Outline

- concepts
- syntax
- hands-on example

## Make: concepts

- targets
- prerequisites
- instructions (recipe)

## Make: syntax

```make
target:  prerequisite(s)
         build command(s)
```

## Make: simple example

```make
ecoli.sam:        ecoli_1.sai ecoli_2.sai MG1655.fasta
                  bwa sampe MG1655.fasta ecoli_1.sai ecoli_2.sai \
                      ecoli_1.fastq ecoli_2.fastq

ecoli_1.sai:      ecoli_1.fastq MG1655.fasta
                  bwa aln MG1566.fasta ecoli_1.fastq > ecoli_1.sai

ecoli_2.sai:      ecoli_2.fastq MG1655.fasta
                  bwa aln MG1566.fasta ecoli_2.fastq > ecoli_2.sai

ecoli_1.fastq:    ecoli_1.fastq.gz
                  gunzip ecoli_1.fastq.gz

ecoli_2.fastq:    ecoli_2.fastq.gz
                  gunzip ecoli_2.fastq.gz
```

## Benefits of make

- only rebuilds prerequisites if they are outdated
- can build independent targets in parallel
- *de facto* checkpointing and fault tolerance
- wildcards and patterns provide flexibility

## Hands-on example

<a href="https://github.com/standage/2014-09-03-reproducibility/blob/master/homework.md">
  <img src="example.png" alt="Workflow for a Fake Project" style="width: 10em" />
</a>

Click the graphic for to see the homework description.

# More on git

## Outline

- concepts
- syntax
- hands on example

## Git: concepts

- **commit**: a snapshot of your project
- **repository**: contents of your project and its location
- **clone**: different copies of your repository
- **push**: update a remote clone from your local clone
- **pull**: update your local clone from a remote clone

## Git: two-step commit process

- **staging**: indicate that a file has changes you want to commit
- **committing**: permanently store all staged changes

## Git syntax: creating a repo

```bash
# Creating an empty repo
mkdir myproject
cd myproject
git init

# Create a repo from an existing directory
cd /home/standage/myproject
git init
```

## Git syntax: adding (staging) files

```bash
# Add an individual file
git add stats.py

# Add all files in a directory
git add testdata/
```

You must stage changes to a file for each commit, even if you have taken a snapshot of that file previously.

## Git syntax: storing a commit

```bash
# Always a good idea to check status of repository
# before committing.
git status
git commit -m "Added stats script and test data"
```

Git will take a snapshot of all staged changes and ignore any unstaged changes.

## GitHub

- free hosting for open source repositories
- stores a clone of your repository
- has excellent collaboration tools

## GitHub for a new (empty) project

1. Create the repo on GitHub
2. Clone a local clone using GitHub-provided URL

```bash
git clone https://github.com/username/YourProject.git
```

## GitHub for an existing project

1. Create a space for the repo on GitHub
2. Initialize a git repo locally, commit the project files
3. Connect the local clone to the remote clone and push

```bash
cd /home/username/YourProject
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/username/YourProject.git
git push origin master
```

## Git syntax: syncronizing

```bash
# Update the remote (GitHub) clone
git push origin master

# Update the local clone
git pull origin master
```
