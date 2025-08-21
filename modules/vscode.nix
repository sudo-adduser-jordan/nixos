{ config, pkgs, ... }:

{ # vscode with package overlay
programs.vscode.enable = true;

nixpkgs.config.allowUnfree = true; 
programs.vscode.mutableExtensionsDir = true;
programs.vscode.extensions = with pkgs.vscode-extensions; [ # revisit and check pkgs. extentsion
jnoortheen.nix-ide
dracula-theme.theme-dracula
jnoortheen.nix-ide
dracula-theme.theme-dracula
bbenoist.nix
golang.go
bbenoist.nix
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
elixir-lsp.vscode-elixir-ls
vscode-icons-team.vscode-icons
ms-vscode.cpptools-extension-pack 
vscjava.vscode-java-pack # intelliCode included
streetsidesoftware.code-spell-checker
] ++ 
pkgs.vscode-utils.extensionsFromVscodeMarketplace [ # nix-prefetch-url 
{ # https://tal7aouy.gallery.vsassets.io/_apis/public/gallery/publisher/tal7aouy/extension/theme/3.1.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "theme";
    publisher = "tal7aouy";
    version = "3.1.0";
    sha256 = "1p06l2d30h3c12jcls533hw61irf4nmlxakg5xvxbmlzj55nm4ic";
}
{ # https://rangav.gallery.vsassets.io/_apis/public/gallery/publisher/rangav/extension/vscode-thunder-client/2.37.5/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "vscode-thunder-client";
    publisher = "rangav";
    version = "2.37.5";
    sha256 = "1dignnk5p1j6xs2nkvy37c5ighydifvisg5lz9h63w30i0mj779z";
}
{ # https://qwtel.gallery.vsassets.io/_apis/public/gallery/publisher/qwtel/extension/sqlite-viewer/0.10.6/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "sqlite-viewer";
    publisher = "qwtel";
    version = "0.10.6";
    sha256 = "13d5g0jksxpachvs2d05bvzaaa54wpmcaik4kzcs15acamdjxpvl";
}
{ # https://rw-smups.gallery.vsassets.io/_apis/public/gallery/publisher/rw-smups/extension/gruberfruity/0.8.0/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "gruberfruity";
    publisher = "rw-smups";
    version = "0.8.0";
    sha256 = "1grf69n270gsizg2z053ldjn3k0sy8iv8ja8xrv5iv183x993j1v";
}
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

    "cSpell.userWords": [
        "autopct",
        "cmap",
        "crosstab",
        "figsize",
        "histplot",
        "kdeplot",
        "newaxis",
        "pairplot",
        "scatterplot",
        "selectbox",
        "streamlit",
        "venv",
        "violinplot",
        "xlabel",
        "xticklabels",
        "ylabel",
        "yticklabels"
    ],
    "workbench.secondarySideBar.defaultVisibility": "hidden",
}
'';
};
}