# Reproducibility in Bioinformatics

## Homework: Git and GitHub

Git is a very popular version control system that is used extensively by the bioinformatics and genomics communities.
Git, like all version control systems, was designed for managing software development, but its features are perfectly suited for managing any data-driven science project.
No bioinformatics project is perfect from the start, but taking frequent snapshots of your project's code, data, and documentation--even during the early stages--will pay many dividends in the end.
Paired with an automated workflow, version control is the best way to facilitate reproducibility.

GitHub is a service that provides free hosting of open-source git repositories.
In addition to providing remote backup of your project, GitHub has a lot of useful features that make collaboration on a project very easy.

In this assignment, we'll cover the basics of git and GitHub that you'll need to begin using it right away in your projects.
You'll need a UNIX machine (Linux or Mac) to follow the instructions.
They do have git clients for Windows, but if you choose to go that route you'll be on your own.

### 1.

If you don't already have one, [create an account on GitHub](https://github.com/join).
Once you've completed the registration process, go to the [main page](https://github.com).
From there, click on the + symbol in the upper right hand corner to create a repository.

- Give the repository a name. For now, pick a name that isn't too serious, like **bogus** or **test**.
- Click on the button that says **Initialize this repository with a README**.
- Click the **Create repository** button.

You should now see the home page for your new repository.
The URL to visit this homepage in your browser follows the pattern https://github.com/username/reponame.
The HTTPS clone URL is the same, except that a ``.git`` suffix is added.

### 2.

If you have not already installed git on your machine, do so now.
Once it is installed, run the following commands in the terminal to personalize.

```bash
git config --global user.name "User name"
git config --global user.email "username@indiana.edu"
git config --global color.ui true
```

Then, in you terminal go ahead and make a clone of your new repo locally.
The command you'll use looks like this, although of course you'll fill in ``username`` and ``reponame`` with the appropriate values.

```bash
git clone https://github.com/username/reponame.git
```

This creates a new directory with your repository contents, which at this point is just an empty README file.
Enter the new directory and type ``git status``.
You should get a message saying you're on the master branch and that the working directory is clean.

Now, edit the README file: add your name and a few notes, whatever you would like.
Then go back to the command prompt and type ``git status``.
What is the status now?

### 3.

Now that you've modified the README file, type ``git add README`` to stage the modified file.
What does ``git status`` report for the file now?

Open up the file again and make some additional changes.
Then go back to the command prompt and type ``git status`` again.

- Explain why the README file shows up twice in the status message.
- If you were to store a snapshot at this point (with ``git commit``), what would be stored?

Now check your prediction.

```bash
# Take a snapshot
git commit -m "My first commit"

# Look at the git log file to find the commit ID, a long string of letters and digits
git log

# Copy the commit ID and paste it into this command in place of COMMIT_ID_HERE
# This shows the contents of the file from your snapshot.
git show COMMIT_ID_HERE:README

# This command will show you differences between the last snapshot and the
# files' current state, if there are any differences.
git diff
```

When you're done, run ``git stash`` to discard any uncommitted changes to files in the repo.

### 4. 

In your web browser, go to GitHub and refresh the project page.
Can you see the snapshot you just committed on GitHub?
Why or why not?

Now, back in your terminal run ``git push origin master`` and supply your GitHub username and password.
Then, go back to the browser and refresh the project page.
Any changes?

### 5.

Create a new file in your repo with the following command.

```bash
echo "Essentially, all models are wrong, but some are useful. -- George E. P. Box" > quotes.txt
```

Now enter the following commands.

```bash
git status
git add quotes.txt
git status
```

- Explain why ``git status`` gives different output the second time it was run.

Now, store another snapshot of your repo to include the new ``quotes.txt`` file.

```bash
git commit -m "Added Box quote"
```

### 6.

Back in your web browser, return the repo's GitHub page.
Next to the dropdown menu containing the text "branch: **master**", there should be a + symbol that allows you to add a new file to your repo directly in the web browser.
Click the + symbol, give the new file a name "food.txt", enter your favorite food, and then click the "Commit new file" button.

Return to the project page.
Just beneath the project name and description, there should be a summary of the project showing the number of commits, branches, releases, and contributors.
How many commits are there in your GitHub clone?
Click on **Commits** to see a log in your web browser.

Now go back to your terminal and type ``git log``.
How many commits are there in your local clone?
Are there any differences between what's on GitHub and what's stored locally?
If so, why?
