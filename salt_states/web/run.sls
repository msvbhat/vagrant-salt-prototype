{% set go_path = salt['cmd.run']('echo $HOME') %}

run_go:
  cmd.run:
    - name: nohup ./gowebapp > gowebapp.log 2>&1 &
    - cwd: {{ go_path }}/go/src/github.com/josephspurrier/gowebapp
