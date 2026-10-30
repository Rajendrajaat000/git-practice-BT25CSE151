# Git Commands Practice Record & Documentation

**Student Name:** Rajendra Manda  
**Roll Number:** BT25CSE151  
**Section:** Section C  
**Course:** IT Workshop - I (CSP 201)  

---

## 1. Categorized Git Command Reference

### Repository Setup & Identity
| Command | Purpose |
|---|---|
| `git --version` | Verify the installed version of Git. |
| `git init -b main` | Initialize a new local Git repository with the default branch set to `main`. |
| `git clone <url>` | Create a complete local copy of a remote repository. |
| `git config user.name "Name"` | Set the author name for commit metadata in the repository. |
| `git config user.email "Email"` | Set the author email for commit metadata in the repository. |

### Staging & Inspecting Changes
| Command | Purpose |
|---|---|
| `git status` / `git status --short` | Inspect the state of the working directory and staging index. |
| `git add <file>` / `git add .` | Stage modified or untracked content for the next commit snapshot. |
| `git diff` | View unstaged changes between the working directory and the index. |
| `git diff --staged` | View staged changes prepared for the next commit against `HEAD`. |
| `git diff HEAD` | View all working tree differences against the most recent commit. |
| `git check-ignore -v <file>` | Debug and identify which `.gitignore` rule pattern ignores a file. |

### Commits & History
| Command | Purpose |
|---|---|
| `git commit -m "message"` | Record staged snapshots permanently into local repository history. |
| `git log --oneline` | View a compact one-line summary of commit hashes and messages. |
| `git log --oneline --graph --all` | Display an ASCII graph visualization of branch and merge topologies. |
| `git show <commit/tag>` | Display metadata, author details, and diff patch of a specific object. |

### Branching, Merging & Fast-Forwards
| Command | Purpose |
|---|---|
| `git switch -c <branch>` | Create a new branch and switch to it immediately. |
| `git switch <branch>` | Switch the current working directory to an existing branch. |
| `git merge --ff-only <branch>` | Fast-forward the current branch pointer without creating a merge commit. |
| `git merge --no-ff <branch>` | Create a true merge commit integrating branches even if fast-forwardable. |
| `git branch -d <branch>` | Safely delete a fully merged local branch reference. |

### Safe Recovery & Temporary Work
| Command | Purpose |
|---|---|
| `git restore --staged <file>` | Unstage a file from the index while keeping working edits intact on disk. |
| `git restore <file>` | Discard uncommitted working changes, reverting file to the index state. |
| `git revert HEAD` | Create an inverse commit that undoes changes from a previous commit safely. |
| `git stash push -m "msg"` | Save dirty working tree and index state into the stash stack. |
| `git stash list` | View all stashed working states. |
| `git stash pop` | Reapply the most recent stashed state and drop it from the stack. |

### Remote Operations & Collaboration
| Command | Purpose |
|---|---|
| `git remote add origin <url>` | Associate a remote repository URL with the nickname `origin`. |
| `git push -u origin <branch>` | Push commits to remote and set upstream tracking for future push/pull. |
| `git fetch origin` | Download remote objects and update remote tracking refs (`origin/main`). |
| `git pull --ff-only origin <branch>` | Fetch and integrate remote updates only if fast-forwardable. |
| `git tag -a <tag> -m "msg"` | Create an annotated tag marking a specific release milestone. |
| `git push origin <tag>` | Explicitly push a specific tag to the remote repository. |

---

## 2. Merge Conflict Scenario & Resolution Walkthrough

### What Caused the Conflict
In **Exercise 09**, both the `main` branch and the feature branch `feature/mode` modified the exact same line in `mode.txt`:
- On `main`: `Lab mode: classroom`
- On `feature/mode`: `Lab mode: online`

When running `git merge feature/mode` while checked out on `main`, Git detected conflicting concurrent edits and paused the merge, inserting standard conflict markers:

```text
<<<<<<< HEAD
Lab mode: classroom
=======
Lab mode: online
>>>>>>> feature/mode
```

### Resolution Strategy
1. **Inspected Conflict:** Examined `mode.txt` to identify the divergent lines.
2. **Consulted Requirement:** Agreed upon a unified hybrid configuration.
3. **Manual Edit:** Replaced all conflict markers and both competing lines with the single resolved line:
   ```text
   Lab mode: hybrid
   ```
4. **Staging & Finalizing:**
   ```bash
   git add mode.txt
   git commit -m "Merge mode changes with hybrid option"
   ```
5. **Verification:** Ran `git status` to verify a clean working tree and inspected `git log --graph` to confirm a successful two-parent merge commit.
