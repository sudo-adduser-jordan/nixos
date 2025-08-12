{ pkgs, ... }:
{

programs.vscode = {
  enable = true; 
  profiles.default.extensions = with pkgs.vscode-extensions; 
  [
  bbenoist.nix
  vscode-icons-team.vscode-icons
  usernamehw.errorlens
  # rw-smups.gruberfruity
  ];

  profiles.default.userSettings = {
    "workbench.startupEditor" = "none";
    "editor.stickyScroll.enabled" = false;
    "workbench.tree.enableStickyScroll" = false;
    "explorer.compactFolders" = false;
    "workbench.iconTheme" = "vscode-icons";
    "workbench.colorCustomizations" = {
      "terminal.background" = "#000000";
    };
#     "workbench.colorTheme": "Gruber Darker",
  };

  profiles.default.keybindings = [
    {
        "key" = "ctrl+c";
        "command" = "workbench.action.terminal.copySelection";
        "when" = "terminalTextSelectedInFocused || terminalFocus && terminalHasBeenCreated && terminalTextSelected || terminalFocus && terminalProcessSupported && terminalTextSelected || terminalFocus && terminalTextSelected && terminalTextSelectedInFocused || terminalHasBeenCreated && terminalTextSelected && terminalTextSelectedInFocused || terminalProcessSupported && terminalTextSelected && terminalTextSelectedInFocused";
    }
    {
        "key" = "ctrl+shift+c";
        "command" = "-workbench.action.terminal.copySelection";
        "when" = "terminalTextSelectedInFocused || terminalFocus && terminalHasBeenCreated && terminalTextSelected || terminalFocus && terminalProcessSupported && terminalTextSelected || terminalFocus && terminalTextSelected && terminalTextSelectedInFocused || terminalHasBeenCreated && terminalTextSelected && terminalTextSelectedInFocused || terminalProcessSupported && terminalTextSelected && terminalTextSelectedInFocused";
    }
    {
        "key" = "ctrl+v";
        "command" = "workbench.action.terminal.paste";
        "when" = "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported";
    }
    {
        "key" = "ctrl+shift+v";
        "command" = "-workbench.action.terminal.paste";
        "when" = "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported";
    }
    {
        "key" = "ctrl+alt+a";
        "command" = "jupyter.collapseallcells";
    }
];

};
}

#     "cSpell.userWords": [
#         "annot",
#         "autopct",
#         "cleand",
#         "cmap",
#         "coolwarm",
#         "crosstab",
#         "dendrogram",
#         "figsize",
#         "histplot",
#         "kdeplot",
#         "missingno",
#         "multicollinearity",
#         "newaxis",
#         "Optuna",
#         "pairplot",
#         "scatterplot",
#         "selectbox",
#         "startangle",
#         "streamlit",
#         "suptitle",
#         "venv",
#         "violinplot",
#         "xlabel",
#         "xticklabels",
#         "ylabel",
#         "yticklabels"
#     ],