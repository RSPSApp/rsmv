{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  name = "rsmv";

  packages = with pkgs; [
    jdk11
    maven
  ];

  shellHook = ''
    export RSMV_BUILD_DIR="$PWD/.rsmv-build"

    run-rsmv() {
      mkdir -p "$RSMV_BUILD_DIR"
      find src/main/java -name '*.java' -print0 \
        | xargs -0 javac -d "$RSMV_BUILD_DIR"
      java -cp "$RSMV_BUILD_DIR" net.runelite.rsmv.Main
    }

    echo "RSMV dev shell"
    echo "Java: $(java -version 2>&1 | head -n 1)"
    echo "Maven: $(mvn -v | head -n 1)"
    echo ""
    echo "Run:"
    echo "  run-rsmv"
  '';
}
