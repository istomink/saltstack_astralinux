nginx_index:
  file.managed:
    - name: /usr/share/nginx/html/index.html
    - source: salt://nginx/files/index.html
    - replace: True
    - show_diff: True
