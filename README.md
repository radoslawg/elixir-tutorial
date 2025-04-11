# Setting up environment

Clone repository to selected directory.

## Starting container

Assuming dockerhub is confiugred as default container source:

```sh
podman run --replace -dit --name 'elixir-tutorial' -v ./:workspace/elixir-tutorial elixir:latest '/bin/bash'
podman exec -it -w='/workspace/elixir-tutorial' elixir-tutorial "/workspace/elixir-tutorial/.config/setup_env.sh"
```

# Entering container

```sh
podman exec -it elixir-tutorial '/usr/bin/zsh'
```
