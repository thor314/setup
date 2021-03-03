#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup toolchain install nightly
rustup default nightly

# setup workspaces
pushd $HOME
mkdir r
popd

# rust analyzer
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
cargo xtask install --server

rustup update

#
rustup target add wasm32-unknown-unknown --toolchain nightly
