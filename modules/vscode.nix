{ pkgs, ... }:

{ # vscode with package overlay
programs.vscode.enable = true;

programs.vscode.mutableExtensionsDir = true;
programs.vscode.profiles.default.extensions = with pkgs.vscode-marketplace; [ 
jnoortheen.nix-ide
dracula-theme.theme-dracula
bbenoist.nix
golang.go
redhat.vscode-xml
redhat.vscode-yaml
usernamehw.errorlens
ibm.output-colorizer
ritwickdey.liveserver
esbenp.prettier-vscode
astro-build.astro-vscode
mechatroner.rainbow-csv
gitlab.gitlab-workflow
catppuccin.catppuccin-vsc
github.github-vscode-theme
yzhang.markdown-all-in-one
# elixir-lsp.vscode-elixir-ls
vscode-icons-team.vscode-icons

ms-vscode.cpptools-extension-pack 
vscjava.vscode-java-pack # intelliCode included

streetsidesoftware.code-spell-checker
tal7aouy.theme
rangav.vscode-thunder-client
qwtel.sqlite-viewer
rw-smups.gruberfruity
];

home.file = {
".config/Code/User/keybindings.json".text = ''    
[
    {
        "key": "ctrl+c",
        "command": "workbench.action.terminal.copySelection",
        "when": "terminalTextSelectedInFocused || terminalFocus && terminalHasBeenCreated && terminalTextSelected || terminalFocus && terminalProcessSupported && terminalTextSelected || terminalFocus && terminalTextSelected && terminalTextSelectedInFocused || terminalHasBeenCreated && terminalTextSelected && terminalTextSelectedInFocused || terminalProcessSupported && terminalTextSelected && terminalTextSelectedInFocused"
    },
    {
        "key": "ctrl+shift+c",
        "command": "-workbench.action.terminal.copySelection",
        "when": "terminalTextSelectedInFocused || terminalFocus && terminalHasBeenCreated && terminalTextSelected || terminalFocus && terminalProcessSupported && terminalTextSelected || terminalFocus && terminalTextSelected && terminalTextSelectedInFocused || terminalHasBeenCreated && terminalTextSelected && terminalTextSelectedInFocused || terminalProcessSupported && terminalTextSelected && terminalTextSelectedInFocused"
    },
    {
        "key": "ctrl+v",
        "command": "workbench.action.terminal.paste",
        "when": "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
    },
    {
        "key": "ctrl+shift+v",
        "command": "-workbench.action.terminal.paste",
        "when": "terminalFocus && terminalHasBeenCreated || terminalFocus && terminalProcessSupported"
    },
    {
        "key": "ctrl+alt+a",
        "command": "jupyter.collapseallcells"
    }
]
'';
".config/Code/User/settings.json".text = ''
{
    "security.workspace.trust.untrustedFiles": "open",
    "chat.commandCenter.enabled": false,
    
    "workbench.colorCustomizations": {
        "terminal.background":"#000"
    },
    "workbench.startupEditor": "none",
    "workbench.colorTheme": "Theme Mix",
    "workbench.tree.enableStickyScroll": false,
    "workbench.iconTheme": "vscode-icons",
    "workbench.secondarySideBar.defaultVisibility": "hidden",

    "git.confirmSync": false,
    "git.enableSmartCommit": true,
    "git.openRepositoryInParentFolders": "always",
    
    "editor.detectIndentation": false,
    "editor.inlayHints.enabled": "off",
    "editor.stickyScroll.enabled": false,
    "editor.defaultFormatter": "esbenp.prettier-vscode",
    "editor.fontFamily": "\"Hack Nerd Font\", Consolas, monospace",
    
    "explorer.compactFolders": false,
    "explorer.confirmDelete": false,
    "explorer.confirmPasteNative": false,
    "explorer.confirmDragAndDrop": false,
}
'';
};
}