#!/usr/local/bin/bash

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="colour${chash[$1]}" || bg="%k"
  [[ -n $2 ]] && fg="colour${chash[$2]}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " #[bg=$bg,fg=colour${chash[$CURRENT_BG]}]$SEGMENT_SEPARATOR#[fg=$fg] "
  else
    echo -n "#[bg=$bg,fg=$fg] "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n $3
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " #[default,fg=colour${chash[$CURRENT_BG]}]$SEGMENT_SEPARATOR"
  else
    echo -n ""
  fi
  echo -n ""
  CURRENT_BG=''
}

prompt_context() {
  local user=`whoami`

  if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment blackgravel snow "❐ #S"
  fi
}

declare -A chash
chash[plain]='15'
chash[snow]='15'
chash[coal]='16'
chash[brightgravel]='252'
chash[lightgravel]='245'
chash[gravel]='243'
chash[mediumgravel]='241'
chash[deepgravel]='238'
chash[deepergravel]='236'
chash[darkgravel]='235'
chash[blackgravel]='233'
chash[blackestgravel]='232'
chash[dalespale]='221'
chash[dirtyblonde]='222'
chash[taffy]='196'
chash[saltwatertaffy]='121'
chash[tardis]='39'
chash[orange]='214'
chash[lime]='154'
chash[dress]='211'
chash[toffee]='137'
chash[coffee]='173'
chash[darkroast]='95'

prompt_who() {
    user=$(whoami)
    prompt_segment dirtyblonde blackgravel "$user"
}

prompt_boxname() {
    name=$(box_name)
    prompt_segment coffee blackgravel "$name"
}

build_prompt() {
    RETVAL=$?
    prompt_context
    prompt_who
    prompt_boxname
    prompt_end
}

echo $(build_prompt)
