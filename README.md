# RSMV

RuneScape Model viewer

## Run With Nix

This repo includes a `shell.nix` with the Java toolchain needed to run RSMV.

From the `rsmv` directory:

```bash
nix-shell --run run-rsmv
```

That enters the nix shell, compiles the sources, and launches RSMV in one command.

If you want an interactive shell first:

```bash
nix-shell
run-rsmv
```
