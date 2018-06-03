#!/usr/bin/env bash

####################################################################################
# Bashlight 	: 0.1.5
# Copyright		: 2018, MIT
# Author		: André Lademann <vergissberlin@googlemail.com>
# Repository	: https://github.com/vergissberlin/bashlight
####################################################################################

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/src/aliases, instead of adding them here directly.
function __bashlight() {

	# Unicode symbols
	readonly PS_SYMBOL_DARWIN=""
	readonly PS_SYMBOL_LINUX="✪"
	readonly PS_SYMBOL_OTHER="☯"
	readonly GIT_BRANCH_MASTER="♔"
	readonly GIT_BRANCH_DEVELOPMENT="♙"
	readonly GIT_BRANCH_FEATURE="♘"
	readonly GIT_BRANCH_HOTFIX="♗"
	readonly GIT_BRANCH_OTHER="☂"
	readonly GIT_BRANCH_CHANGED_SYMBOL="+"
	readonly GIT_NEED_PUSH_SYMBOL="⇡"
	readonly GIT_NEED_PULL_SYMBOL="⇣"

	# Solarized color scheme
	readonly FG_BASE03="\\[$(tput setaf 8)\\]"
	readonly FG_BASE02="\\[$(tput setaf 0)\\]"
	readonly FG_BASE01="\\[$(tput setaf 10)\\]"
	readonly FG_BASE00="\\[$(tput setaf 11)\\]"
	readonly FG_BASE0="\\[$(tput setaf 12)\\]"
	readonly FG_BASE1="\\[$(tput setaf 14)\\]"
	readonly FG_BASE2="\\[$(tput setaf 7)\\]"
	readonly FG_BASE3="\\[$(tput setaf 15)\\]"

	readonly BG_BASE03="\\[$(tput setab 8)\\]"
	readonly BG_BASE02="\\[$(tput setab 0)\\]"
	readonly BG_BASE01="\\[$(tput setab 10)\\]"
	readonly BG_BASE00="\\[$(tput setab 11)\\]"
	readonly BG_BASE0="\\[$(tput setab 12)\\]"
	readonly BG_BASE1="\\[$(tput setab 14)\\]"
	readonly BG_BASE2="\\[$(tput setab 7)\\]"
	readonly BG_BASE3="\\[$(tput setab 15)\\]"

	readonly FG_YELLOW="\\[$(tput setaf 3)\\]"
	readonly FG_ORANGE="\\[$(tput setaf 9)\\]"
	readonly FG_RED="\\[$(tput setaf 1)\\]"
	readonly FG_MAGENTA="\\[$(tput setaf 5)\\]"
	readonly FG_VIOLET="\\[$(tput setaf 13)\\]"
	readonly FG_BLUE="\\[$(tput setaf 4)\\]"
	readonly FG_CYAN="\\[$(tput setaf 6)\\]"
	readonly FG_GREEN="\\[$(tput setaf 2)\\]"

	readonly BG_YELLOW="\\[$(tput setab 3)\\]"
	readonly BG_ORANGE="\\[$(tput setab 9)\\]"
	readonly BG_RED="\\[$(tput setab 1)\\]"
	readonly BG_MAGENTA="\\[$(tput setab 5)\\]"
	readonly BG_VIOLET="\\[$(tput setab 13)\\]"
	readonly BG_BLUE="\\[$(tput setab 4)\\]"
	readonly BG_CYAN="\\[$(tput setab 6)\\]"
	readonly BG_GREEN="\\[$(tput setab 2)\\]"

	readonly DIM="\\[$(tput dim)\\]"
	readonly REVERSE="\\[$(tput rev)\\]"
	readonly RESET="\\[$(tput sgr0)\\]"
	readonly BOLD="\\[$(tput bold)\\]"

	# What OS?
	case "$(uname)" in
		Darwin)
			readonly PS_SYMBOL=${PS_SYMBOL_DARWIN}
		;;
		Linux)
			readonly PS_SYMBOL=${PS_SYMBOL_LINUX}
		;;
		*)
			readonly PS_SYMBOL=${PS_SYMBOL_OTHER}
	esac

	export GIT_PS1_SHOWDIRTYSTATE=1

	# shellcheck disable=SC2091
	function __is_git_repo() {
		$(git rev-parse --is-inside-work-tree &> /dev/null)
	}

	# shellcheck disable=SC2091
	function __is_git_dir() {
		$(git rev-parse --is-inside-git-dir 2> /dev/null)
	}

	function __git_info() {
		local aheadN
		local behindN
		local branch
		local colour
		local git_status
		local marks
		local stat

		# Check requirements
		[ -x "$(command -v git)" ] || return	# git not found
		if ! __is_git_repo || __is_git_dir; then
			return
		fi

		# Which branch?
		case "$(git symbolic-ref --short HEAD)" in
			master)
				readonly GIT_BRANCH_SYMBOL=${GIT_BRANCH_MASTER}
				;;
			[dD][eE][vV]|[eE][lL][oO][pP][mM][eE][nN][tT])
				readonly GIT_BRANCH_SYMBOL=${GIT_BRANCH_DEVELOPMENT}
				;;
			[fF][eE][aA][tT][uU][rR][eE]*)
				readonly GIT_BRANCH_SYMBOL=${GIT_BRANCH_FEATURE}
				;;
			[hH][oO][tT][fF][iI][xX]*)
				readonly GIT_BRANCH_SYMBOL=${GIT_BRANCH_HOTFIX}
				;;
			*)
				readonly GIT_BRANCH_SYMBOL=${GIT_BRANCH_OTHER}
		esac

		# Get current branch name or short SHA1 hash for detached head
		branch="$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --always 2>/dev/null)"
		[ -n "$branch" ] || return  # git branch not found


		# Branch is modified?
		[ -n "$(git status --porcelain)" ] && marks+=" ${GIT_BRANCH_CHANGED_SYMBOL}"
		git_status="$(git status -unormal --ignore-submodules=all 2>&1)"
		if ! [[ "${git_status}" =~ Not\ a\ git\ repo ]]; then
			if [[ "${git_status}" =~ nothing\ to\ commit ]]; then
				colour=${BG_GREEN}
			elif [[ "${git_status}" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
				colour=${BG_MAGENTA}
			else
				colour=${BG_YELLOW}
			fi
		fi

		# How many commits local branch is ahead/behind of remote?
		stat=$(git status --porcelain --branch | grep "^##" | grep -o "\\[.\\+\\]$")
		aheadN=$(echo "${stat}" | grep -o "ahead \\d\\+" | grep -o "\\d\\+")
		behindN=$(echo "${stat}" | grep -o "behind \\d\\+" | grep -o "\\d\\+")
		[ -n "$aheadN" ] && marks+=" $GIT_NEED_PUSH_SYMBOL$aheadN"
		[ -n "$behindN" ] && marks+=" $GIT_NEED_PULL_SYMBOL$behindN"

		# Print the git branch segment without a trailing newline
		printf "%s%s %s %s%s " "${colour}" "${FG_BASE3}" "${GIT_BRANCH_SYMBOL}" "${branch}" "${marks}"
	}

	function __info() {
		local BG_COLOR
		local FG_COLOR
	
		case "${PS_INFO_BRAND}" in
			success)
				BG_COLOR=${BG_GREEN}
				FG_COLOR=${FG_BASE2}
				;;
			warn)
				BG_COLOR=${BG_ORANGE}
				FG_COLOR=${FG_BASE2}
				;;
			danger)
				BG_COLOR=${BG_RED}
				FG_COLOR=${FG_BASE3}
				;;
			[hH][oO][tT][fF][iI][xX]*)
				readonly GIT_BRANCH_SYMBOL=$GIT_BRANCH_HOTFIX
				;;
			*)
				BG_COLOR=${BG_BLUE}
				FG_COLOR=${FG_BASE2}
		esac

		if [[ ! -z ${PS_INFO} ]]; then
			printf  "%s%s %s %s" "${BG_COLOR}" "${FG_COLOR}" "${PS_INFO}" "${RESET}"
		fi
	}


	function ps1() {
		local BG_EXIT

		# Check the exit code of the previous command and display different
		# colors in the prompt accordingly.
		# shellcheck disable=SC2181
		if [ $? -eq 0 ]; then
			BG_EXIT="${BG_GREEN}"
		else
			BG_EXIT="${BG_RED}"
		fi

		PS1="${BG_BASE02}${FG_BASE00} \\w $RESET"
		PS1+="$(__info)"
		PS1+="$(__git_info)$RESET"
		PS1+="$BG_EXIT$FG_BASE3 $PS_SYMBOL $RESET "
	}

	PROMPT_COMMAND=ps1
}

__bashlight
unset __bashlight
