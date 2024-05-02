with (import <nixpkgs> { });
mkShell {
  buildInputs = [
    rustup
    nodejs_20
    bun
    python3
    libgcc
    lua
    go
    ruby
    elixir_1_14
  ];
}
