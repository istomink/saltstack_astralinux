nginx:
  file.managed:
    - name: /tmp/nginx-1.22.0.tar.gz
    - source: /usr/local/src/nginx-1.22.0.tar.gz

install-nginx:
  cmd.run:
    - name: apt-get install -y nginx

unpack-nginx:
  cmd.run:
    - name: |
        tar -xvf /tmp/nginx-1.22.0.tar.gz -C /usr/local/
        mv /usr/local/nginx-1.22.0 /usr/local/nginx
    - unless: test -d /usr/local/nginx

nginx-conf:
  file.managed:
    - name: /usr/local/nginx/conf/nginx.conf
    - source: /etc/nginx/nginx.conf
    - mode: 644
    - user: root
    - group: root

restart-nginx:
  cmd.run:
    - name: systemctl restart nginx
    - watch:
      - file: nginx-conf
