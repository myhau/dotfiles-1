function generate_ctags
    set MYPWD (pwd)
    set MYPROJECTNAME $argv
    ctags -f ~/.ctags.d/$MYPROJECTNAME -h ".php" --PHP-kinds=+cf-v --regex-PHP='/abstract\s+class\s+([^ ]+)/\1/c/' --regex-PHP='/interface\s+([^ ]+)/\1/c/' --regex-PHP='/(public\s+|static\s+|abstract\s+|protected\s+|private\s+)function\s+\&?\s*([^ (]+)/\2/f/' --file-scope=no -R
end
