function init -a path --on-event init_autojump
    set -gx AUTOJUMP_SOURCED 1

    # set user installation path
    if test -d ~/.autojump
        set -gx PATH ~/.autojump/bin $PATH
    end

    # Set ostype, if not set
    if not set -q OSTYPE
        set -gx OSTYPE (bash -c 'echo ${OSTYPE}')
    end
    
    # set error file location
    if test (uname) = "Darwin"
        set -gx AUTOJUMP_ERROR_PATH ~/Library/autojump/errors.log
    else if test -d "$XDG_DATA_HOME"
        set -gx AUTOJUMP_ERROR_PATH $XDG_DATA_HOME/autojump/errors.log
    else
        set -gx AUTOJUMP_ERROR_PATH ~/.local/share/autojump/errors.log
    end

    if test ! -d (dirname $AUTOJUMP_ERROR_PATH)
        mkdir -p (dirname $AUTOJUMP_ERROR_PATH)
    end
end

