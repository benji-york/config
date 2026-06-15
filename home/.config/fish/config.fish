function hybrid_bindings --description "Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings hybrid_bindings


function fish_prompt --description "Set up a prompt I like."
    set_color AAA
    echo (printf %"$COLUMNS"s | tr " " "-")
    set_color 444
    printf '%s' (pwd)
    set_color 444
    printf ' %s\n' (__fish_git_prompt)
    set_color normal
    echo -n '% '
end

# Disable the greeting banner message.
set fish_greeting

# Hardening Guide addition
umask 027

# Tell virtualenv activation script not to mess with
# the prompt.
export VIRTUAL_ENV_DISABLE_PROMPT=1

# Tell GNU utilities to use ISO 1608 time formatting
export TIME_STYLE=long-iso

set PATH ~/bin $PATH
set PATH /usr/local/bin $PATH
set PATH ~/.bun/bin $PATH

#test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

# XXX I don't know why this was here.
#set -g fish_user_paths "/usr/local/opt/python/libexec/bin" $fish_user_paths

# Set up colors
set -U fish_color_normal normal
set -U fish_color_command 005fd7
set -U fish_color_quote 999900
set -U fish_color_redirection 00afff
set -U fish_color_end 009900
set -U fish_color_error ff0000
set -U fish_color_param 00afff
set -U fish_color_comment 005f5f
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion 4e4e4e
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

set -gx WASMTIME_HOME "$HOME/.wasmtime"
string match -r ".wasmtime" "$PATH" > /dev/null; or set -gx PATH "$WASMTIME_HOME/bin" $PATH

set -gx EDITOR "vim"
set -gx VISUAL "vim"

# Claude Code: always use max reasoning effort
set -gx CLAUDE_CODE_EFFORT_LEVEL max

# multi-gitter: GitHub token from gh CLI
set -gx GITHUB_TOKEN (gh auth token 2>/dev/null)

# Wire up the starship prompt
starship init fish | source

# Created by `pipx` on 2023-06-29 13:45:04
set PATH $PATH /Users/benji/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# fuzzy finder
#fzf --fish | source
