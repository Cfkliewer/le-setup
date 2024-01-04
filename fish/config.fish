if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x GOPATH /usr/local/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

set -x PATH $PATH ~/.local/share/nvim/mason/packages/netcoredbg

# pnpm
set -gx PNPM_HOME "/home/deltabro/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

set -gx PATH "$HOME/.cargo/bin" $PATH
