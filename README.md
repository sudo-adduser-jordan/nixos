# nixos 

clone `source` into `home`

```sh
    git clone https://github.com/sudo-adduser-jordan/nixos
```
`switch` from `source`

```sh
    nixos-rebuild switch -I nixos-config=/home/{user_account_containing source}/nixos/configuration.nix
```

you can now edit your `source` in 

```sh
   code ~/nixos # vim is for nerds
```

and `switch` to a new configuration

```sh
    sudo switch
```

### xfce meta framework

what you dont like it? go use tmux and vim you nerd
```sh
rollback
```


