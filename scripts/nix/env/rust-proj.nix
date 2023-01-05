# https://discourse.nixos.org/t/how-can-i-set-up-my-rust-programming-environment/4501/6
{ pkgs ? import <unstable> { } }:

pkgs.mkShell {
  buildInputs = [
    pkgs.cargo
    pkgs.rustc
    pkgs.rustfmt

    # Necessary for the openssl-sys crate:
    pkgs.openssl
    pkgs.pkg-config

    # @todo 暂时没有搞清楚 wasm 的编译
    # https://github.com/casonadams/z-tab-bar
    # pkgs.wasm-pack
    # pkgs.wasmer
    # pkgs.wasmtime
  ];

  # See https://discourse.nixos.org/t/rust-src-not-found-and-other-misadventures-of-developing-rust-on-nixos/11570/3?u=samuela.
  RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";
}
