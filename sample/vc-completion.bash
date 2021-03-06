# completion file for bash

_vc()
{
    COMREPLY=()
    local cur=${COMP_WORDS[COMP_CWORD]}
    if [[ $COMP_CWORD -gt 1 ]]; then
	case "${COMP_WORDS[1]}" in
	    show|insert|edit|rm|ls|cp|mv)
		COMPREPLY=($(compgen -W "$(vc ls -r)" -- ${cur}))
		;;
	esac
    else
        COMPREPLY=($(compgen -W "login show insert cp mv rm edit ls" -- $cur))
    fi
}
complete -F _vc vc
