========================================
Git & GitHub Notes
========================================

## What is Git?
- Git is a **distributed version control system (VCS)**.
- It helps track changes in source code.
- Supports collaboration between multiple developers.

---

## What is GitHub?
- **:contentReference[oaicite:0]{index=0}** is a cloud-based platform to store and manage code repositories.
- It uses Git for version control.

### Key Features:
- Store project code online
- Collaboration between developers
- Track code changes:
  - Who modified
  - When modified
  - What changed
  - Why changed (commit message)

---

## Environment Setup

### 1) Create GitHub Account
- Go to: https://github.com

### 2) Install Git
- Download Git client and install it.
```
git-scm.com
```

### 3) Configure Git (One-time setup)

```
git config --global user.name "your-name"
git config --global user.email "your-email"
```

---

## What is GitHub Repository?

=> Repository is a place where we can store project source code / files.  

=> For every project, one repository will be created  

=> We can create 2 types of repositories in GitHub:

1) **Public Repository**
   - Anyone can view the code
   - You control who can contribute (commit)

2) **Private Repository**
   - Only selected users can view and commit
   - Used for secure or internal projects

---

# Git Commands with Examples

---

# Initialize Repository

```
git init
```

# Clone Repository // Downloads a remote repository to your local system
```
git clone https://github.com/awskaizen02/Devops-April.git
```
# Moves files to staging area

## Add single file
```
git add file.txt
```
## Add all files
```
git add .
```
# Check Status // Shows file changes (tracked, untracked, staged)
```
git status
```
# Commit Changes  //Saves staged changes with a message
```
git commit -m "Added new feature"
```

# View Commit History  // Shows commit history
```
git log

git log --oneline  //Short format
```

# Push Code  // Uploads local commits to GitHub
```
git push origin main
```

# Pull Code  // Fetches and merges latest code from remote
```
git pull origin main
```
===============
git conflicts
===============

git pull : to bring latest code changes from central repo to local repo

=======================
git pull vs git fetch
=======================

git pull: Download changes from central repo to local repo and merge changes in working tree.

git fetch : download changes from central repo to local repo.

Note: To merge changes from local repo to working tree we need to use 'git merge' command

		git pull = git fetch + git merge

# Branch Commands  // Create branch
```
git branch feature1
```
List branches
```
git branch
```
Switch branch
```
git checkout feature1
    (OR)
git switch feature1
```
# Merge Branch  // Merges feature1 into current branch
```
git merge feature1

=========================
git merge vs git rebase
=========================

merge : it will merge changes from one branch to another branch and it will preserve commit history.

rebase : it wil merge changes from one branch to another branch and it will not preserve commit history.

```
# Delete Branch
```
git branch -d feature1
```
# Remote Repository  // Add remote
```
git remote add origin https://github.com/username/repo.git
```
View remote
```
git remote -v
```
# Stash Changes  // Temporarily saves changes
```
git stash
```
Apply stash
```
git stash apply
```
# Reset Changes  // Removes all local changes
```
git reset --hard HEAD
```
# Revert Commit  // Creates a new commit to undo changes
```
git revert <commit_id>
```
#  Tagging    // Marks a version
git tag v1.0

# Ignore Files  // Prevents files from being tracked
``
Create .gitignore file:
node_modules/
*.log
.env
```

