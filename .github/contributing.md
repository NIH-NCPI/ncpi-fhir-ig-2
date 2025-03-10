
# 👩‍💻 Contributor's Guide

## Top Level Contributor Guidance
1) When making a Pull Request (PR), please be sure to link the issues being addressed inside
the PR description so that reviewers can better understand what they should be seeing.
2) Branches are currently required for the preview. Creating a PR from a fork will fail during preview deployment
3) Those wishing to contribute should contact the FHIR WG co-chairs (Allison Heath: heathap@chop.edu and Robert Carroll: robert.carroll@vumc.org) to request access to push branches to this repository.

## IG Contribution Guidance
For an overview of some best practices, details about the tools required for profile creation and the like, please see our [Contributing Guide](https://nih-ncpi.github.io/ncpi-fhir-ig-2/contributing.html)

## Basic Git guidance
### 🔁 Software Development Life Cycle
This project uses [GitHub Flow](https://docs.github.com/en/get-started/using-github/github-flow)
for its software development lifecycle. GitHub workflow is a simple workflow
that works well for a small project with multiple developers needing to work
on the code and review each other's code before merging into the main branch.


### 👨🏻‍💻 Develop

This assumes you've already set up your development environment. If not,
follow the steps in [Setup Dev Environment](#setup-dev-environment)

#### 1. 🌴 Create a branch
```shell
# Checkout your local main branch
git checkout main

# Update your local main branch to mirror the main branch on GitHub
git pull

# Create a feature branch to work on. Name it something short and relevant
# to the change
git checkout -b add-patient-birth-sex
```

#### 2. ✏️  Commit the change

After you've made the change you want on your local machine it's time
to commit that change to the project repo.

#### (Optional) Emoji Commits
If you would like, you can prefix the commit message with
an emoji code that is relevant to that change.

You can look up which emoji to use on the [gitmoji]() website. Emoji commits
can be useful when you want to quickly visually scan the commit history and
get a quick idea of what kinds of commits a PR has (i.e. feature, bug, refactor, etc.)

Here's an example commit message for adding something new:

```shell
# Stage the file(s) to commit
$ git add <file path to the file you want to commit>

# Commit the file(s) to the local repo
$ git commit -m ":sparkles: Add new birthSex extension to Patient"
```

#### ⚠️  3. Important! - Rebase
If another developer has merged their code (Pull Request) while you're working
on your change, you will need to update your branch with those changes before
you continue developing.

To do that, you will need to [rebase your branch](https://www.atlassian.com/git/tutorials/rewriting-history/git-rebase)
on the main branch like this:

```shell
# Checkout your local main branch
git checkout main

# Update your local main branch to mirror the main branch on GitHub
git pull

# Update your local branch with the changes on GitHub main branch
git checkout add-patient-birth-sex
git rebase main

# Push your updated branch to GitHub
git push -f
```

If you do this often you will rarely have conflicts.


### 📝 4. Pull Request

Once you're happy with your changes, it's time to [open a Pull Request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request?tool=webui)
so that others can review your code and upon their approval you can merge your branch
into the main branch.

### (Optional) Title
Similar to commit messages, you can prefix the PR title with the appropriate emoji from Gitmoji.

For example:

**✨ Add new birthSex field to Patient**

#### Description
When you open a pull request you will notice that the description is populated
with a **"Motivation"** and **"Approach"** section. Please be sure to fill these out
so that reviewers can quickly and easily understand the purpose of the PR and
the changes.

### 5. 🔀 Squash and Merge
Once your PR has been approved you're ready to merge it. Before you merge it,
you'll want to "squash" all of your commits into 1 commit. This cleans up your
branch's commit history and makes the main branch much cleaner as feature
branches are merged into it.

This process is very easy to do because GitHub takes care of it for you. All you
need to do is select the "Merge pull request" drop down menu on your
pull request page and press the button that says "Squash and merge".

Here's an example of what happens with squashing:

**Branch Commits Before Squashing**

The git log for this branch shows 5 separate commits

```shell

$ git log

:sparkles: New birth sex extension

:recycle: Change data type

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
:sparkles: New birth sex extension
:recycle: Change data type
:recycle: Change values in ValueSet
:bug: Fix typo in ValueSet
:bug: Fix another typo in ValueSet
```

### 🔢 Versioning
As changes are made to the implementation guide (IG), we will want a way to track
versions of the IG and tie those versions to snapshots of the project.

In this project we use [Semantic Versioning](https://semver.org/) to mint
version numbers for various types of changes. Please read more at semvar.org.

### 📦 6. Release
Releases on GitHub are snapshots of the project at a particular point in time,
stamped with a version number of some kind, in our case, semantic version number.
A release can be made at any time, although, it is typical to make a release after
a desired set of changes have been merged into the main branch.

To make a release you will need to install and run the [D3b release maker](https://github.com/d3b-center/d3b-release-maker?tab=readme-ov-file#part-ii-the-cli-that-updates-release-notes-and-creates-a-github-release-pr) CLI
tool:

```shell
$ release build
```
#### Create Release PR
The build command will create a "Release Pull Request" on GitHub, which will
have an updated Change Log of all the commit messages of the pull requests that
were merged since the last release. It will also mint the next release version
which is used to tag the main branch later.

#### Merge Release PR
When this PR is merged, the GitHub release workflow (already part of the repo)
will tag the main branch with the release number, create a snapshot of the
repo, create the GitHub release and attach the snapshot to the release.

The GitHub workflow will also publish the IG to its domain.

## 👩‍💻 Example of Workflow

Let's solidify everything above with an example.

1. **Developer A** wants to make a change to the code
2. On their local machine, developer A checkouts a branch to make that change
3. **Developer B** wants to make a change to a different part of the code
4. On their local machine, developer B checkouts a branch to make their change
5. **Developer A** makes the change and pushes the code to the remote repo on GitHub
6. **Developer A** opens a Pull Request (PR) so that others can review the change
7. Other developers approve the Pull Request
8. **Developer A** squashes their branch's commits and merges the Pull Request into the main branch
9. **Developer B** updates their local main branch with the changes that were just merged
10. **Developer B** squashes their branch's commits and merges the Pull Request into the main branch
11. **Developer B** opens a Pull Request (PR) so that others can review the change
12. Other developers approve the Pull Request
13. **Developer C** wants to make a release
14. **Developer C** uses the [D3b Release Maker](https://github.com/d3b-center/d3b-release-maker) to
create a release PR on GitHub
15. Other developers approve the Pull Request
16. **Developer C** merges the release PR which activates a GitHub workflow that tags the main branch with
the next version and creates the release on GitHub
