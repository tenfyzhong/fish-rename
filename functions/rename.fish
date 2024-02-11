function rename --description 'Rename file by command'
    argparse -i 'i/interactive' 'c/command=' 'h/help' -- $argv 2>/dev/null
    if test $status -ne 0
        return 1
    end

    if set -q _flag_help 
        _rename_help
        return 0
    end

    if test -z _flag_command
        _rename_help
        return 1
    end

    for f in $argv
        if test ! -e $f
            echo "rename: cannot stat <$f>: No such file or directory"
            continue
        end

        eval "set new (echo $f | $_flag_command)"
        if test -e $new; and set -q _flag_i
            read -n 1 -P "confirm to overwrite <$new> [y/n]:" confirm
            if test "$confirm" != 'y' -a "$confirm" != 'Y'
                continue
            end
        end

        mv -f $f $new
    end
end

function _rename_help 
    printf %s\n \
        'rename: Rename file by command' \
        'Usage: rename [options] <file...>' \
        '' \
        'Options:' \
        '  -c/--command <command> eval command to generate new filename' \
        '  -i/--interactive       prompt before overwrite' \
        '  -h/--help              print this help message'
end
