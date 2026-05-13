# Advanced Git & GitHub Interview Questions and Answers

---

# 1. What is packfile in Git?

A packfile is a compressed file used by Git to store repository objects efficiently.  
It reduces storage space and improves repository performance.

---

# 2. What is the difference between centralized and distributed VCS?

| Centralized VCS | Distributed VCS |
|---|---|
| Single central server | Every user has full repository copy |
| Requires server access | Works offline |
| Example: SVN | Example: Git |

---

# 3. Explain Git hooks.

Git hooks are scripts triggered automatically before or after Git events such as commit, push, merge, or rebase.

Examples:
- pre-commit
- post-commit
- pre-push

---

# 4. What are pre-commit hooks?

Pre-commit hooks run before a commit is created.  
They are used for:
- Code validation
- Running tests
- Formatting checks
- Security scanning

---

# 5. How do you sign commits in Git?

Use GPG signing:

```bash
git commit -S -m "Signed commit"
```

---

# 6. What is GPG signing?

GPG signing verifies commit authenticity and ensures the commit was created by a trusted developer.

---

# 7. How do you handle large binary files in Git?

Use Git LFS instead of storing large files directly inside the repository.

Avoid committing:
- Videos
- ZIP files
- ISO files
- Large binaries

---

# 8. What is Git LFS?

Git Large File Storage (LFS) stores large files outside the main repository and keeps lightweight references in Git.

---

# 9. What are submodules in Git?

Submodules allow one Git repository to include another Git repository as a dependency.

Example:
- Shared libraries
- Common services

---

# 10. Difference between submodule and subtree?

| Submodule | Subtree |
|---|---|
| Separate repository reference | Integrated into main repository |
| Requires extra commands | Easier for developers |
| Independent history | Shared history |

---

# 11. What is monorepo?

A monorepo is a single repository containing multiple projects, applications, or services.

Example:
- Frontend
- Backend
- Shared libraries

All inside one repository.

---

# 12. What are common Git branching strategies?

Common branching strategies:
- Git Flow
- GitHub Flow
- Trunk-based development
- Feature branching

---

# 13. How do you optimize large repositories?

Optimization methods:
- Use shallow clone
- Use Git LFS
- Delete stale branches
- Run garbage collection
- Avoid large binaries

---

# 14. What causes Git conflicts frequently?

Conflicts occur when:
- Multiple developers edit the same lines
- Long-running branches exist
- Code is not synchronized frequently

---

# 15. How do you troubleshoot failed merges?

Steps:
1. Identify conflicting files
2. Review conflict markers
3. Resolve manually
4. Test changes
5. Commit resolved merge

Useful command:

```bash
git status
```

---

# 16. How do you revert a pushed commit safely?

Use:

```bash
git revert <commit-id>
```

This creates a new commit that safely undoes previous changes without rewriting history.

---

# 17. What is force push? Why is it dangerous?

Force push overwrites remote history.

Command:

```bash
git push --force
```

Danger:
- Can remove teammates’ commits
- Causes history loss
- Breaks collaboration

---

# 18. Explain git bisect.

`git bisect` helps identify the commit that introduced a bug using binary search.

Git automatically checks commits between good and bad versions.

---

# 19. How do you find who changed a line of code?

Use:

```bash
git blame filename
```

It shows:
- Author
- Commit ID
- Timestamp
- Changed line

---

# 20. What are Git best practices for teams?

Best practices:
- Use feature branches
- Write meaningful commit messages
- Use pull requests
- Perform code reviews
- Avoid direct production commits
- Pull latest changes frequently

---

# Scenario-Based Interview Questions

---

# 21. A developer accidentally deleted a branch. How do you recover it?

Use:

```bash
git reflog
```

Find the commit ID and recreate the branch:

```bash
git checkout -b branch-name <commit-id>
```

---

# 22. You committed sensitive data to GitHub. What will you do?

Steps:
1. Remove sensitive data from history
2. Rotate exposed credentials
3. Force push cleaned history
4. Inform security/admin teams

Tools:
- git filter-repo
- BFG Repo Cleaner

---

# 23. Two developers changed the same file. How do you handle it?

Git creates merge conflicts.

Steps:
1. Review conflicting code
2. Discuss correct changes
3. Resolve manually
4. Test application
5. Commit resolved code

---

# 24. Your local branch is behind remote branch. What steps will you take?

Commands:

```bash
git fetch
git pull origin branch-name
```

Then:
- Resolve conflicts if any
- Test code
- Continue development

---

# 25. A pull request has conflicts after review. How do you resolve them?

Steps:
1. Pull latest target branch
2. Merge or rebase locally
3. Resolve conflicts
4. Test changes
5. Push updated branch

---

# 26. You pushed wrong code to production branch. What will you do?

Steps:
1. Revert bad commit
2. Rollback deployment if needed
3. Fix issue
4. Test thoroughly
5. Redeploy safely

---

# 27. How would you manage releases in a multi-team environment?

Approach:
- Use release branches
- Semantic versioning
- CI/CD pipelines
- Approval workflows
- Tagging strategy
- Automated deployments

---

# 28. How do you maintain clean commit history?

Methods:
- Small commits
- Meaningful messages
- Squash unnecessary commits
- Remove debug code
- Rebase feature branches

---

# 29. How do you handle hotfixes in production?

Steps:
1. Create hotfix branch from production
2. Apply fix
3. Test quickly
4. Deploy immediately
5. Merge back to main and develop branches

---

# 30. Explain a Git workflow you used in a real project.

Example Answer:

"We used feature branching workflow. Developers created feature branches from develop branch, raised pull requests for review, merged after approval, and deployments were automated using GitHub Actions CI/CD pipelines."

---

# Useful Git Commands

```bash
git init
git clone <repo-url>
git status
git add .
git commit -m "message"
git push
git pull
git fetch
git branch
git checkout
git switch
git merge
git rebase
git stash
git reset
git revert
git reflog
git blame
git bisect
```

---

# References

- Git Official Documentation: https://git-scm.com/doc
- GitHub Documentation: https://docs.github.com/en
- Atlassian Git Tutorials: https://www.atlassian.com/git/tutorials

# Git & GitHub Interview Questions and Answers (31–100)

---

# 31. What is rebasing?

Rebasing moves or reapplies commits from one branch onto another base branch to create a cleaner history.

---

# 32. Difference between merge and rebase?

| Merge | Rebase |
|---|---|
| Preserves history | Creates linear history |
| Adds merge commit | No merge commit |
| Easier for collaboration | Cleaner commit history |

---

# 33. What is fast-forward merge?

A fast-forward merge updates the branch pointer directly when no separate commit history exists.

---

# 34. What is squashing commits?

Squashing combines multiple commits into a single commit to maintain clean history.

---

# 35. What is git reflog?

`git reflog` tracks all HEAD and branch reference changes for recovery purposes.

---

# 36. How do you delete a branch?

Local branch:

```bash
git branch -d branch-name
```

Remote branch:

```bash
git push origin --delete branch-name
```

---

# 37. What is detached HEAD state?

Detached HEAD occurs when HEAD points directly to a commit instead of a branch.

---

# 38. What is Git stash pop?

`git stash pop` restores stashed changes and removes them from stash list.

---

# 39. What is origin in Git?

`origin` is the default alias name for the remote repository.

---

# 40. What is upstream branch?

An upstream branch is the remote branch tracked by the local branch.

---

# 41. What is GitHub?

GitHub is a cloud-based platform used to host Git repositories and collaborate on code.

---

# 42. What is a fork in GitHub?

A fork is a personal copy of another repository in your GitHub account.

---

# 43. Difference between fork and clone?

| Fork | Clone |
|---|---|
| Server-side copy | Local machine copy |
| Exists on GitHub | Exists on local system |

---

# 44. What is a pull request (PR)?

A pull request is a request to merge changes from one branch into another branch.

---

# 45. What is code review?

Code review is the process of checking code quality before merging into main branches.

---

# 46. What are GitHub Actions?

GitHub Actions automate CI/CD workflows directly inside GitHub repositories.

---

# 47. What is CI/CD?

CI/CD automates:
- Code integration
- Testing
- Deployment

CI = Continuous Integration  
CD = Continuous Deployment/Delivery

---

# 48. What is Git Flow?

Git Flow is a branching strategy using:
- main
- develop
- feature
- release
- hotfix branches

---

# 49. What is a protected branch?

A protected branch prevents direct changes and enforces approvals or checks before merging.

---

# 50. What are GitHub Issues?

GitHub Issues are used for:
- Bug tracking
- Feature requests
- Task management

---

# 51. What are GitHub Secrets?

GitHub Secrets securely store sensitive information like:
- API keys
- Tokens
- Passwords

---

# 52. What is Dependabot?

Dependabot automatically detects and updates vulnerable dependencies.

---

# 53. What are GitHub Webhooks?

Webhooks send automated HTTP notifications when repository events occur.

---

# 54. What is a release in GitHub?

A release is a packaged software version associated with a Git tag.

---

# 55. Difference between public and private repository?

| Public Repo | Private Repo |
|---|---|
| Accessible to everyone | Restricted access |
| Open collaboration | Controlled collaboration |

---

# 56. What is Git architecture?

Git architecture consists of:
- Working directory
- Staging area
- Local repository
- Remote repository

---

# 57. What is SHA in Git?

SHA is a unique hash identifier used for commits and Git objects.

Example:

```bash
a1b2c3d4
```

---

# 58. How does Git store data?

Git stores data as objects:
- Blobs
- Trees
- Commits
- Tags

Inside the `.git` directory.

---

# 59. What are Git hooks?

Git hooks are scripts automatically triggered during Git operations.

Examples:
- pre-commit
- pre-push
- post-merge

---

# 60. What is Git LFS?

Git LFS (Large File Storage) manages large binary files efficiently outside the main repository.

---

# 61. What are submodules?

Submodules allow one repository to contain another Git repository.

---

# 62. What is a monorepo?

A monorepo stores multiple applications or services inside one repository.

---

# 63. What is force push?

Force push overwrites remote history.

Command:

```bash
git push --force
```

---

# 64. Why is force push dangerous?

It can:
- Delete teammates’ commits
- Rewrite shared history
- Cause collaboration issues

---

# 65. What is git bisect?

`git bisect` identifies the commit that introduced a bug using binary search.

---

# 66. How do you find who changed a line?

Use:

```bash
git blame filename
```

---

# 67. What is Git garbage collection?

Garbage collection removes unnecessary files and optimizes repository storage.

Command:

```bash
git gc
```

---

# 68. What is a packfile?

A packfile compresses Git objects to reduce storage and improve performance.

---

# 69. Difference between centralized and distributed VCS?

| Centralized VCS | Distributed VCS |
|---|---|
| Single central server | Full repository copy per user |
| Needs network | Supports offline work |
| Example: SVN | Example: Git |

---

# 70. What are best Git practices?

Best practices:
- Use feature branches
- Write meaningful commits
- Use pull requests
- Review code
- Avoid direct production commits

---

# Scenario-Based Questions

---

# 71. How do you recover a deleted branch?

Use:

```bash
git reflog
```

Then recreate branch:

```bash
git checkout -b branch-name <commit-id>
```

---

# 72. What if sensitive data is pushed accidentally?

Steps:
1. Remove sensitive data
2. Rewrite history
3. Rotate credentials
4. Force push cleaned repository

---

# 73. How do you resolve merge conflicts?

Steps:
1. Open conflicting files
2. Resolve conflicts manually
3. Add files
4. Commit resolved changes

---

# 74. What if local branch is behind remote?

Use:

```bash
git fetch
git pull origin branch-name
```

---

# 75. How do you handle production hotfixes?

Create hotfix branch from production, apply fix, test, deploy, and merge back.

---

# 76. What is clean commit history?

A clean commit history contains:
- Small commits
- Clear messages
- No unnecessary commits

---

# 77. Why use pull requests?

Pull requests improve:
- Collaboration
- Code quality
- Review process
- Deployment safety

---

# 78. What is semantic versioning?

Semantic versioning format:

```text
MAJOR.MINOR.PATCH
```

Example:

```text
2.1.5
```

---

# 79. How do teams avoid merge conflicts?

Methods:
- Pull latest changes frequently
- Use small commits
- Short-lived branches
- Better communication

---

# 80. What is branching strategy?

A branching strategy defines how branches are created, merged, and maintained.

---

# 81. What is Git packfile optimization?

Git combines multiple objects into compressed packfiles to improve performance.

---

# 82. What is shallow clone?

A shallow clone downloads limited commit history.

Example:

```bash
git clone --depth 1 <repo-url>
```

---

# 83. What is bare repository?

A bare repository contains only Git history without working files.

Used mainly for:
- Central repositories
- Remote repositories

---

# 84. What is Git alias?

Git alias creates shortcuts for Git commands.

Example:

```bash
git config --global alias.st status
```

---

# 85. What is interactive rebase?

Interactive rebase allows editing, squashing, or reordering commits.

Command:

```bash
git rebase -i HEAD~3
```

---

# 86. What is orphan branch?

An orphan branch starts without previous commit history.

Command:

```bash
git checkout --orphan branch-name
```

---

# 87. What is Git patch?

A patch file contains differences between commits or files.

Command:

```bash
git format-patch
```

---

# 88. What is cherry-pick?

Cherry-pick applies a specific commit from one branch into another branch.

---

# 89. What is rebase conflict?

A rebase conflict occurs when Git cannot automatically apply commits during rebase.

---

# 90. What is stash apply?

`git stash apply` restores stashed changes without removing them from stash list.

---

# 91. What is Git tag?

A tag marks important commits such as releases.

---

# 92. Difference between lightweight and annotated tags?

| Lightweight Tag | Annotated Tag |
|---|---|
| Simple pointer | Contains metadata |
| No message | Includes author/message |

---

# 93. What is remote tracking branch?

A remote tracking branch tracks the state of a remote branch locally.

Example:

```text
origin/main
```

---

# 94. What is Git archive?

`git archive` creates compressed archive files from repository contents.

---

# 95. What is Git daemon?

Git daemon is a lightweight server used to share repositories over Git protocol.

---

# 96. What is sparse checkout?

Sparse checkout allows checking out only selected repository directories.

---

# 97. What is Git credential helper?

Credential helper securely stores authentication credentials.

---

# 98. What is Git clean?

`git clean` removes untracked files from the working directory.

---

# 99. What is Git worktree?

Git worktree allows multiple working directories linked to the same repository.

---

# 100. What are Git team collaboration best practices?

Best practices:
- Use branching strategies
- Enforce code reviews
- Use CI/CD pipelines
- Protect production branches
- Maintain documentation
- Automate testing

---
