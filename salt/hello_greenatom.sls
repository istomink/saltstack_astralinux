replace_index_html:
  file.replace:
    - name: /usr/share/nginx/html/index.html
    - pattern: '<html>'
    - repl: '<html><h1>Hello Greenatom</h1>'
    - backup: '.bak'
