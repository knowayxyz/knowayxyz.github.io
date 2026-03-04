#!/bin/sh
export PYTHONIOENCODING=UTF-8
site_title='卢威 (Wei Lu)'
echo generateing site: $site_title

page_head(){
  local title="$1"
  cat <<EOF
<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>$title</title>
    <link rel="stylesheet" type="text/css" href="/static/home.css">
    <link rel="icon" type="image/png" href="/static/favicon.png">
  </head>
  <body>
    <div class="container">
    <hr/>
EOF
}

page_foot(){
  cat <<EOF
    </div>
    <footer>
      <hr/>
      <span style="float:left"> &copy; 2025 <a href="/">$site_title</a> </span>
      <span style="float:right"> Because it's there - George Mallory.</span>
    </footer>
    <div hidden>
      <script type="text/javascript" id="clustrmaps" src="//clustrmaps.com/map_v2.js?d=m7xhRDcb3dcW9F4-NrDlH-1amcon0eWqQLIbPsDfJcc&cl=ffffff&w=a"></script>
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