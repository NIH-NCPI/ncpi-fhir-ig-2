
# 👩‍💻 Contributor's Guide

## Software Development Lifecycle

### Overview
This project uses [Github Flow](https://docs.github.com/en/get-started/using-github/github-flow)
for its software development lifecycle. Github workflow is a simple workflow 
that works well for a small project with multiple developers needing to work 
on the code and review each other's code before merging into the main branch.

#### Process

1. **Developer A** wants to make a change to the code
2. On their local machine, developer A checkouts a branch to make that change
3. **Developer B** wants to make a change to a different part of the code
4. On their local machine, developer B checkouts a branch to make their change
5. **Developer A** makes the change and pushes the code to the remote repo on Github
6. **Developer A** opens a Pull Request (PR) so that others can review the change
7. Other developers approve the Pull Request 
8. **Developer A** squashes their branch's commits and merges the Pull Request into the main branch
9. **Developer B** updates their local main branch with the changes that were just merged 
10. **Developer B** squashes their branch's commits and merges the Pull Request into the main branch
11. **Developer B** opens a Pull Request (PR) so that others can review the change
12. Other developers approve the Pull Request 
13. **Developer C** wants to make a release
14. **Developer C** uses the [D3b Release Maker](https://github.com/d3b-center/d3b-release-maker) to 
create a release PR on Github
15. Other developers approve the Pull Request 
16. **Developer C** merges the release PR which activates a Github workflow that tags the main branch with 
the next version and creates the release on Github 


Let's solidify this with an example.

### Develop

This assumes you've already setup your development environment. If not, 
follow the steps in [Setup Dev Environment](#setup-dev-environment)

#### Create a branch
```shell
# Checkout your local main branch
git checkout main

# Update your local main branch to mirror the main branch on Github
git pull

# Create a feature branch to work on. Name it something short and relevant 
# to the change
git checkout -b add-patient-birth-sex 
```

#### Make a change

Commit messages

#### ✅ Important - Rebase
If another developer has merged their code (Pull Request) while you're working
on your change, you will need to update your branch with those changes before
you continue developing. To do that, you will need to [rebase your branch]()
on the main branch like this:

```shell
# Checkout your local main branch
git checkout main

# Update your local main branch to mirror the main branch on Github
git pull

# Update your local branch with the changes on Github main branch 
git checkout add-patient-birth-sex 
git rebase main 

# Push your updated branch to Github 
git push -f
```

If you do this often you will rarely have conflicts.


### Pull Request

Once you're happy with your changes, its time to [open a Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request?tool=webui)
so that others can review your code and upon their approval you can merge your branch
into the main branch.

### Squash and Merge
Once your PR has been approved you're ready to merge it. Before you merge it,
you'll want to "squash" all of your commits into 1 commit. This cleans up your 
branch's commit history and makes the main branch much cleaner as feature 
branches are merged into it.

This process is very easy to do because Github takes care of it for you. All you 
need to do is select the the "Merge pull request" drop down menu on your 
pull request page and press the button that says "Squash and merge".

Here's an example of what happens with squashing:

**Branch Commits Before Squashing**

The git log for this branch shows 5 seperate commits

```shell

$ git log

:sparkles: New birth sex field 

:recycle: Change type 

:recycle: Change values in ValueSet

:bug: Fix typo in ValueSet

:bug: Fix another typo in ValueSet
```

**Branch Commits After Squashing**

Commits are combined into 1 new commit with a message that contains all
individual commit messages to preserve history.

```shell

$ git log

Merge pull request #19 from ncpi/add-patient-birth-sex
:sparkles: New birth sex field 
:recycle: Change type 
:recycle: Change values in ValueSet
:bug: Fix typo in ValueSet
:bug: Fix another typo in ValueSet
```



### Release

## TODO - Getting Started - Developers

### Setup Dev Environment

### Make a Change

### Test

### Push Code

### Review



