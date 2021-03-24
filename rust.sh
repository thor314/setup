#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup update
rustup toolchain install nightly
rustup default nightly

# setup workspaces
pushd $HOME
mkdir r
popd

# rust analyzer
git clone https://github.com/rust-analyzer/rust-analyzer.git && cd rust-analyzer
# xtask: https://github.com/matklad/cargo-xtask/
# is a way to add automation to a rust project, a la make, npm run, scripts, etc.
cargo xtask install --server

# for near-indexer: https://github.com/near/near-indexer-for-wallet
apt install postgresql libpq-dev
cargo install diesel_cli --no-default-features --features "postgres"

# wasm
rustup target add wasm32-unknown-unknown --toolchain nightly

# cargo watch watches a directory for changes and restarts a project (like an indexer) if it crashes
cargo install cargo-watch
