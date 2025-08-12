{ pkgs, ... }:
{

# move to system to test root execution config

programs.vscode = {
  enable = true; 
  profiles.default.extensions = with pkgs.vscode-extensions; 
  [
#   rw-smups.gruberfruity
  bbenoist.nix
  vscode-icons-team.vscode-icons
  usernamehw.errorlens
  ];

  profiles.default.userSettings = {
    # "workbench.colorTheme": "Gruber Darker",
    "workbench.startupEditor" = "none";
    "explorer.compactFolders" = false;
    "editor.stickyScroll.enabled" = false;
    "workbench.tree.enableStickyScroll" = false;
    "workbench.iconTheme" = "vscode-icons";
    "workbench.colorCustomizations" = {
      "terminal.background" = "#000000";
    };
  };

  profiles.default.keybindings = [
    {
        "key" = "ctrl+c";
        "command" = "workbench.action.terminal.copySelection";
        "when" = "terminalTextSelectedInFocused || terminalFocus && terminalHasBeenCreated && terminalTextSelected || terminalFocus && terminalProcessSupported && terminalTextSelected || terminalFocus && terminalTextSelected && terminalTextSelectedInFocused || terminalHasBeenCreated && terminalTextSelected && terminalTextSelectedInFocused || terminalProcessSupported && terminalTextSelected && terminalTextSelectedInFocused";
    }
    {
        "key" = "ctrl+v";
        "command" = "workbench.action.terminal.paste";
        "when" = "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported";
    }
    {
        "key" = "ctrl+alt+a";
        "command" = "jupyter.collapseallcells";
    }
];

};
}