#!/bin/bash
# Author: Sebastian Kopf
# Last update: Jan 25 2018

printf "────────────────────────────────────────────────────────────────────\n"
echo "INFO: starting the linting and rendering check for all .Rmd files"
printf "────────────────────────────────────────────────────────────────────\n"

# exit function
function on_exit {
  echo "DONE: processed $filescount .Rmd files ($lintcount passed linting, $rendercount passed rendering)"
  printf "────────────────────────────────────────────────────────────────────\n"
  if [[ lintcount -eq filescount && rendercount -eq filescount ]]; then
    exit 0 # all good
  else
    exit 1 # exit with error
  fi
}
trap on_exit EXIT

# info counters
filescount=0
lintcount=0
rendercount=0

# error capture
trap 'passed=false' ERR

# loop through RMD files
for file in *.Rmd
do

  # files processed
  filescount=$((filescount+1))
  printf "INFO: processing file #$filescount - '$file'\n"
  
  # linting (without comment bot to avoid issues with private repos)
  passed=true
  printf "INFO: linting file '$file'... "
  lint=`Rscript -e "Sys.setenv(LINTR_COMMENT_BOT=\"FALSE\"); lintr::lint(\"$file\")"`
  length=${#lint}
  if [[ $length -eq 0 && "$passed" = true ]]; then 
    printf "passed all"
    lintcount=$((lintcount+1))
  else
    printf "encountered warnings:\n"
    echo "$lint" # echo to avoid problems with special chars in printf
  fi
  printf "\n"
  
  # rendering
  passed=true
  printf "INFO: rendering file '$file'... "
  render=`Rscript -e "rmarkdown::render(\"$file\", quiet=FALSE)"`
  if [ "$passed" = true ]; then 
    printf "INFO: '$file' rendered successfully.\n"
    rendercount=$((rendercount+1))
  fi
  printf "────────────────────────────────────────────────────────────────────\n"
done