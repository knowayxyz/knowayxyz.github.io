#!/usr/bin/env python3
#coding=utf-8
import sys
import mistune

md = mistune.create_markdown(
    escape=False,
    plugins=['table', 'footnotes', 'strikethrough']
)

if __name__ == "__main__":
    sys.stdout.write(md(sys.stdin.read()))