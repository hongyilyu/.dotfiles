#!/bin/zsh
spaceship::is_git() {
  # See https://git.io/fp8Pa for related discussion
  [[ $(command git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]
}

my_git_formatter() {
  spaceship::is_git || return

  if (( $1 )); then
    # Styling for up-to-date Git status.
    local       meta='%f'     # default foreground
    local      clean='%76F'   # green foreground
    local   modified='%178F'  # yellow foreground
    local  untracked='%39F'   # blue foreground
    local conflicted='%196F'  # red foreground
  else
    # Styling for incomplete and stale Git status.
    local       meta='%244F'  # grey foreground
    local      clean='%244F'  # grey foreground
    local   modified='%244F'  # grey foreground
    local  untracked='%244F'  # grey foreground
    local conflicted='%244F'  # grey foreground
  fi
  echo $meta

  local res
  local where  # branch or tag
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}"
    where=${(V)VCS_STATUS_LOCAL_BRANCH}
  elif [[ -n $VCS_STATUS_TAG ]]; then
    res+="${meta}#"
    where=${(V)VCS_STATUS_TAG}
  fi

  # If local branch name or tag is at most 32 characters long, show it in full.
  # Otherwise show the first 12 .. the last 12.
  # Tip: To always show local branch name in full without truncation, delete the next line.
  (( $#where > 32 )) && where[13,-13]=".."
  res+="${clean}${where//\%/%%}"  # escape %

  # Display the current Git commit if there is no branch or tag.
  # Tip: To always display the current Git commit, remove `[[ -z $where ]] &&` from the next line.
  [[ -z $where ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"  # escape %
  fi

  # <42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}${POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON}${VCS_STATUS_COMMITS_BEHIND}"
  # >42 if ahead of the remote; no leading space if also behind the remote: <42>42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}${POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON}${VCS_STATUS_COMMITS_AHEAD}"
  # <-42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}<-${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  # ->42 if ahead of the push remote; no leading space if also behind: <-42->42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}->${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
  # "-" if the number of unstaged files is unknown. This can happen due to
  # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
  # than the number of files in the Git index, or due to bash.showDirtyState being set to false
  # in the repository config. The number of staged and untracked files may also be unknown
  # in this case.
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}-"

  typeset -g my_git_format=$res
}
my_git_formatter
