{
  outputs = { ... }: {
    idxModules = [
      ({ lib, pkgs, config, ... }:
        let cfg = config.services.helloworld;
        in {
          options.services.helloworld = {
            enable = lib.mkEnableOption "Hello world service";
            folder = lib.mkOption {
              type = lib.types.str;
              default = "";
            };
            port = lib.mkOption {
              type = lib.types.port;
              default = 8291;
            };
          };
          config = lib.mkIf cfg.enable {
            processes.helloworld = {
              command = "${pkgs.python3}/bin/python -m http.server ${
                  toString cfg.port
                }";
              cwd = cfg.folder;
            };
          };
        })
    ];
  };
}
