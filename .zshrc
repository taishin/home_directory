autoload -U compinit; compinit

local WHITE=$'%{\e[1;37m%}'
local BLUE=$'%{\e[1;34m%}'
local GREEN=$'%{\e[1;32m%}'
local DEFAULT=$'%{\e[00m%}'

#PROMPT=$BLUE'[${USER}@`hostname`]$ '
PROMPT=$GREEN'[$HOST@`date +%H:%M:%S`] $ '$DEFAULT
RPROMPT=$WHITE'[%~]'$DEFAULT
#RPROMPT='[%~]'

setopt PROMPT_SUBST

# zsh補完候補一覧をカラー表示する
zstyle ':completion:*' list-colors ''

alias gd='dirs -v; echo -n "select number: "; read newdir; cd -"$newdir"'

alias -g L="| less"
alias -g G="| grep"
alias ls="ls -F --color"
alias less="less -R"

typeset -A myabbrev
myabbrev=(
    "ll"    "| less"
    "lg"    "| grep"
    "tx"    "tar -xvzf"
    "tf"    "tail -f"
)

my-expand-abbrev() {
    local left prefix
    left=$(echo -nE "$LBUFFER" | sed -e "s/[_a-zA-Z0-9]*$//")
    prefix=$(echo -nE "$LBUFFER" | sed -e "s/.*[^_a-zA-Z0-9]\([_a-zA-Z0-9]*\)$/\1/")
    LBUFFER=$left${myabbrev[$prefix]:-$prefix}" "
}
zle -N my-expand-abbrev
bindkey     " "         my-expand-abbrev


# based by http://devel.aquahill.net/zsh/zshoptions

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 最後がディレクトリ名で終わっている場合末尾の / を自動的に取り除く
#setopt auto_remove_slash

# サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
setopt auto_resume

# ビープ音を鳴らさないようにする
setopt NO_beep

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# 内部コマンドの echo を BSD 互換にする
#setopt bsd_echo

# シンボリックリンクは実体を追うようになる
#setopt chase_links

# 既存のファイルを上書きしないようにする
#setopt clobber

# コマンドのスペルチェックをする
setopt correct

# コマンドライン全てのスペルチェックをする
#setopt correct_all

# =command を command のパス名に展開する
setopt equals

# ファイル名で #, ~, ^ の 3 文字を正規表現として扱う
setopt extended_glob

# zsh の開始・終了時刻をヒストリファイルに書き込む
#setopt extended_history

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
setopt NO_flow_control

# 各コマンドが実行されるときにパスをハッシュに入れる
#setopt hash_cmds

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
setopt NO_hup

# Ctrl+D では終了しないようになる（exit, logout などを使う）
#setopt ignore_eof

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# メールスプール $MAIL が読まれていたらワーニングを表示する
#setopt mail_warning

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 補完候補が複数ある時、一覧表示 (auto_list) せず、すぐに最初の候補を補完する
#setopt menu_complete

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
setopt numeric_glob_sort

# コマンド名に / が含まれているとき PATH 中のサブディレクトリを探す
#setopt path_dirs

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# 戻り値が 0 以外の場合終了コードを表示する
#setopt print_exit_value

# ディレクトリスタックに同じディレクトリを追加しないようになる
#setopt pushd_ignore_dups

# pushd を引数なしで実行した場合 pushd $HOME と見なされる
#setopt pushd_to_home

# rm * などの際、本当に全てのファイルを消して良いかの確認しないようになる
#setopt rm_star_silesetopt prompt_subst

# シェルのプロセスごとに履歴を共有
setopt share_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# 文字列末尾に改行コードが無い場合でも表示する
unsetopt promptcr

#コピペの時rpromptを非表示する
#setopt transient_rprompt

# cd -[tab] でpushd
setopt autopushd

# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep

### history
setopt histignoredups
#setopt extended_history
HISTFILE=~/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
bindkey '^P' history-beginning-search-backward # 先頭マッチのヒストリサーチ
bindkey '^N' history-beginning-search-forward # 先頭マッチのヒストリサーチ


# screenのステータスラインにコマンドを表示
# http://nijino.homelinux.net/diary/200206.shtml#200206140
if [ "$TERM" = "screen" ]; then
	chpwd () { echo -n "_`dirs`\\" }
	preexec() {
		# see [zsh-workers:13180]
		# http://www.zsh.org/mla/workers/2000/msg03993.html
		emulate -L zsh
		local -a cmd; cmd=(${(z)2})
		case $cmd[1] in
			fg)
				if (( $#cmd == 1 )); then
					cmd=(builtin jobs -l %+)
				else
					cmd=(builtin jobs -l $cmd[2])
				fi
				;;
			%*) 
				cmd=(builtin jobs -l $cmd[1])
				;;
			cd)
				if (( $#cmd == 2)); then
					cmd[1]=$cmd[2]
				fi
				;&
			*)
				echo -n "k$cmd[1]:t\\"
				return
				;;
		esac

		local -A jt; jt=(${(kv)jobtexts})

		$cmd >>(read num rest
			cmd=(${(z)${(e):-\$jt$num}})
			echo -n "k$cmd[1]:t\\") 2>/dev/null
	}
	chpwd
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [ x$TERM = xscreen ]; then
  setopt complete_aliases # これを有効にするとsshの補完が使える
  function ssh-screen() {
    eval SSH_HOST='${'$#'}'
    screen -t ${SSH_HOST} env TERM=screen ssh "$@"
  }
  alias ssh=ssh-screen
fi
