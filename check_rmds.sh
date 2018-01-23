#!/bin/bash

# exit function
function on_exit {
  echo "DONE: processed $filescount .Rmd files ($lintcount passed linting, $rendercount passed rendering)"
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
  
  # linting
  passed=true
  printf "INFO: linting file '$file'... "
  lint=`Rscript -e "lintr::lint(\"$file\")"`
  length=${#lint}
  if [[ $length -eq 0 && "$passed" = true ]]; then 
    printf "passed all"
    lintcount=$((lintcount+1))
  else
    printf "encountered warnings:\n$lint"
  fi
  printf "\n"
  
  # rendering
  passed=true
  printf "INFO: rendering file '$file'... "
  render=`Rscript -e "rmarkdown::render(\"$file\", quiet=TRUE)"`
  if [ "$passed" = true ]; then 
    printf "successfully\n"
    rendercount=$((rendercount+1))
  fi

done