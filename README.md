# nixos 

>1. clone `source` into `home`

```sh
    git clone https://github.com/sudo-adduser-jordan/nixos
```
>2. `switch` from `source`

```sh
    nixos-rebuild switch -I nixos-config=/home/{user_account_containing source}/nixos/configuration.nix
```

3. you can now edit your `source` in 

```sh
   code ~/nixos # vim is for nerds
```

>4. and `switch` to a new configuration

```sh
    sudo switch
```

## xfce meta framework

>what you dont like it? go use tmux and vim you nerd
```sh
rollback
```


