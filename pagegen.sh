#!/bin/sh
export PYTHONIOENCODING=UTF-8
site_title='卢威(Wei Lu)'
echo generateing site: $site_title

page_head(){
  local title="$1"
  cat <<EOF
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>$title</title>
    <link rel="stylesheet" type="text/css" href="/static/home.css">
  </head>
  <body>
    <div>
EOF
}

page_foot(){
  cat <<EOF
      <hr/>
      <footer>
        <a href="/">$site_title</a>
      </footer>
    </div>
  </body>
</html>
EOF
}

genpage(){
  page_head "$site_title" > $2
  cat $1 | ./mdrender.py >> $2
  page_foot >> $2
}

pages(){
  for pg in $1/*.md
    do
      filename=${pg##*/}
      filename=${filename%.*}.html
      echo generate page $filename : genpage $pg $2/$filename
      genpage $pg $2/$filename
  done
}

action=$1
shift
$action "$@"