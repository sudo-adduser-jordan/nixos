# nixos 

>1. clone `source` into `home`

```sh
    git clone https://github.com/sudo-adduser-user1/nixos
```
>2. `switch` from `source`

```sh
    nixos-rebuild switch --flake /home/{user_account_containing source}/nixos .
```

>3. you can now edit your `source` in 

```sh
   code ~/nixos # vim is for nerds
```

>4. and `switch` to a new configuration

```sh
    sudo switch
```

> to revert back

```sh
rollback
