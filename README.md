# nixos 

clone source into home

```sh
    git clone https://github.com/sudo-adduser-jordan/nixos
```
build from source

```sh
    nixos-rebuild switch -I nixos-config=/home/{user_account_containing source}/nixos/configuration.nix
```

you can now edit your source in 

```sh
   code ~/nixos # vim is for nerds
```
and switch to a new configuration

```sh
    switch
```

xfce meta framework
