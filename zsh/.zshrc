# Enable prompt substitution
setopt prompt_subst

# Better matching (case-insensitive etc.)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Load completion system
autoload -Uz compinit bashcompinit
compinit
bashcompinit

# Dotfile homes
ZSH_HOME="$HOME/dotfiles/zsh"
IDEAVIM_HOME="$HOME/dotfiles/ideavim"
REPO_HOME="$HOME/repos"
WORKTREE_HOME="$HOME/worktrees"

EDITOR=/opt/homebrew/bin/nvim

# VI Mode
set -o vi
bindkey jj vi-cmd-mode

# Tools
export PATH=/opt/homebrew/bin:$PATH
# - Podman
export PATH="$PATH:/opt/podman/bin"
# - Pipx
export PATH="$PATH:$HOME/.local/bin"
# - Custom apps
export PATH="$PATH:$HOME/apps/"
# - Global NPM
export PATH="$PATH:$HOME/.npm-global/bin"

# Java
export JAVA_HOME="$(/usr/libexec/java_home -v 21)"
export PATH="$JAVA_HOME/bin:$PATH"

# Fly
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# Conda
export PATH="$PATH:/opt/miniconda3/bin"

# Oh-My-ZSH like stuff
source "$ZSH_HOME/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH_HOME/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# Compatibility
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8

# General
alias ll="ls -hAlt"

# Vim
alias vi="nvim"
alias vim="nvim"

# Tmux
alias tm="tmux"

# Copilot CLI
alias cop="copilot --agent caveman --allow-tool='read,write,shell(mkdir:*),shell(find:*),shell(mvn:*),shell(./mvnw:*),shell(sed:*),shell(xargs:*),shell(git fetch),shell(git merge-base)'"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gre='git reset'
alias gp='git push'
alias gwt='git worktree'
alias gwta='git worktree add'
alias gwtl='git worktree list'
alias gwtp='git worktree prune'
alias gwtr='git worktree remove'

wt() {
  [ -n "${REPO_HOME:-}" ]     || { echo "wt: REPO_HOME is not set" >&2; return 1; }
  [ -n "${WORKTREE_HOME:-}" ] || { echo "wt: WORKTREE_HOME is not set" >&2; return 1; }

  local repo_root="$REPO_HOME"
  local wt_root="$WORKTREE_HOME"

  _wt_err() {
    echo "wt: $*" >&2
    return 1
  }

  _wt_current_repo() {
    local top
    top=$(git rev-parse --show-toplevel 2>/dev/null) || return 1

    case "$top" in
      "$repo_root"/*)
        printf '%s\n' "${top#$repo_root/}"
        ;;
      "$wt_root"/*)
        local rest="${top#$wt_root/}"
        printf '%s\n' "${rest%/*}"
        ;;
      *)
        return 1
        ;;
    esac
  }

  _wt_repo_dir() {
    local repo="$1"
    echo "$repo_root/$repo"
  }

  _wt_path() {
    local repo="$1"
    local name="$2"
    echo "$wt_root/$repo/$name"
  }

  local cmd="$1"
  shift || true

  local repo
  repo=$(_wt_current_repo) || true

  case "$cmd" in
    new)
      local name="$1"
      local start="${2:-HEAD}"

      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      [ -n "$name" ] || _wt_err "usage: wt new <new-branch> [start-point]" || return 1

      mkdir -p "$wt_root/$repo" || return 1
      git -C "$(_wt_repo_dir "$repo")" worktree add -b "$name" "$(_wt_path "$repo" "$name")" "$start"
      ;;

    add)
      local branch="$1"

      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      [ -n "$branch" ] || _wt_err "usage: wt add <existing-branch>" || return 1

      mkdir -p "$wt_root/$repo" || return 1
      git -C "$(_wt_repo_dir "$repo")" worktree add "$(_wt_path "$repo" "$branch")" "$branch"
      ;;

    ls)
      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      git -C "$(_wt_repo_dir "$repo")" worktree list
      ;;

    rm)
      local name="$1"

      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      [ -n "$name" ] || _wt_err "usage: wt rm <name>" || return 1

      git -C "$(_wt_repo_dir "$repo")" worktree remove "$(_wt_path "$repo" "$name")"
      ;;

    prune)
      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      git -C "$(_wt_repo_dir "$repo")" worktree prune
      ;;

    path)
      local name="$1"

      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      [ -n "$name" ] || _wt_err "usage: wt path <name>" || return 1

      _wt_path "$repo" "$name"
      ;;

    repo)
      [ -n "$repo" ] || _wt_err "not inside a repo under $repo_root or $wt_root" || return 1
      echo "$repo"
      ;;

    *)
      cat <<EOF
usage:
  wt new <new-branch> [start-point]
  wt add <existing-branch>
  wt ls
  wt rm <name>
  wt prune
  wt path <name>
  wt repo
EOF
      return 1
      ;;
  esac
}

# Docker/Podman
alias docker="podman"
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

dstop() {
  local -a ids
  ids=("${(@f)$(docker ps -q)}")

  if (( ${#ids} )); then
    docker stop "${ids[@]}"
  else
    echo "No running containers."
  fi
}

dstoprm() {
  local -a ids
  ids=("${(@f)$(docker ps -aq)}")

  if (( ${#ids} )); then
    docker stop "${ids[@]}" 2>/dev/null
    docker rm "${ids[@]}"
  else
    echo "No containers."
  fi
}

# Misc
alias spotless='mvn spotless:apply -o'

# Kubernetes
alias kcli="kubectl"
alias kctl="kubectl"
export KUBECONFIG="$HOME/.kube/config/kubeconfig-cs-api-prod1.yaml"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Repo shortcuts
alias gorepos="cd $REPO_HOME"
alias gowt="cd $WORKTREE_HOME"
alias goao="cd $REPO_HOME/audit-online-gh"
alias goacsqs="cd $REPO_HOME/acs-qs"

# Starship prompt
eval "$(starship init zsh)"

# Load .zshrc.secrets
if [ -f "$ZSH_HOME/.zshrc.secrets" ]; then
  source "$ZSH_HOME/.zshrc.secrets"
fi

