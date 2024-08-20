#if status is-interactive
    # Commands to run in interactive sessions can go here
#end

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brgreen
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brgreen
set fish_color_error '#EA8271'
set fish_color_param brgreen
set fish_color_end '#A7C080'

# set fish_prompt_pwd_dir_length 0

bind \cl accept-autosuggestion
bind \ce clear-screen
bind \cp history-search-backward
bind \cn history-search-forward
