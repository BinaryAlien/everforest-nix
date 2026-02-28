{ config, lib, ... }:
{
  programs.tmux = {
    extraConfig = lib.mkBefore (
      with config.lib.everforest.palette;
      ''
        set-option -g copy-mode-current-match-style "bg=${red},fg=${bg0}"
        set-option -g copy-mode-mark-style          "bg=${bg_purple},fg=${fg}"
        set-option -g copy-mode-match-style         "bg=${green},fg=${bg0}"
        set-option -g copy-mode-position-style      "bg=default,fg=${grey0}"
        set-option -g copy-mode-selection-style     "bg=${bg_visual}"
        set-option -g menu-border-lines             "none"
        set-option -g menu-border-style             "default"
        set-option -g menu-selected-style           "bg=${statusline1},fg=${bg0}"
        set-option -g menu-style                    "bg=${bg2},fg=${fg}"
        set-option -g message-command-style         "bg=${bg0},fg=${fg}"
        set-option -g message-style                 "bg=${bg0},fg=${fg}"
        set-option -g mode-style                    "bg=${statusline1},fg=${bg0}"
        set-option -g pane-active-border-style      "fg=${statusline1}"
        set-option -g pane-border-style             "fg=${bg4}"
        set-option -g popup-border-style            "bg=${bg2},fg=${grey1}"
        set-option -g popup-style                   "bg=${bg2}"
        set-option -g status-style                  "bg=${statusline1},fg=${bg0}"
      ''
    );
  };
}
