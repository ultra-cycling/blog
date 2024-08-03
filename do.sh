#!/usr/bin/env bash

## thumbs <maxWidthHeight> <dir>: creates thumbnails for all files in <dir> with max width or height <maxWidthHeight>
function task_thumbs {
  maxWidthHeight=$1
  dir=$2
  for file in ${dir}/*.jpg
  do
    filename=$(basename -- "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"

    if [[ $filename =~ "small" ]]; then
      echo "Skipping $filename"
    else
      src="${dir}/${filename}.${extension}"
      target="${dir}/${filename}-small.${extension}"
      echo "converting $src to $target"
      sips -Z ${maxWidthHeight} ${src} -o ${target}
    fi
  done
}

## server: start the HUGO server for local preview
function task_server {
  hugo server
}


function task_usage {
  echo "Usage: $0"
  sed -n 's/^##//p' <"$0" | column -t -s ':' |  sed -E $'s/^/\t/' | sort
}

cmd=${1:-}
shift || true
resolved_command=$(echo "task_${cmd}" | sed 's/-/_/g')
if [[ "$(LC_ALL=C type -t "${resolved_command}")" == "function" ]]; then
  pushd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null
  ${resolved_command} "$@"
else
  task_usage
fi