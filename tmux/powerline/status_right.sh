#!/bin/bash

CURRENT_BG='NONE'
SEGMENT_SEPARATOR=''

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="colour${chash[$1]}" || bg="%k"
  [[ -n $2 ]] && fg="colour${chash[$2]}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " #[fg=$bg,bg=colour${chash[$CURRENT_BG]}]$SEGMENT_SEPARATOR#[fg=$fg,bg=$bg] "
  else
    echo -n " #[default,fg=$bg]$SEGMENT_SEPARATOR#[bg=$bg,fg=$fg] "
  fi
  CURRENT_BG=$1
  [[ -n $3 ]] && echo -n " $3 "
}

# End the prompt, closing any open segments
prompt_end() {
    echo " "
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

prompt_date() {
    when=$(date "+%d/%m/%Y")
    prompt_segment tardis blackgravel "$when"
}

prompt_clock() {
    time=$(date "+%H:%M")
    prompt_segment saltwatertaffy blackgravel "◷ $time"
}

build_prompt() {
    RETVAL=$?
    prompt_date
    prompt_clock
    prompt_end
}

echo $(build_prompt)
