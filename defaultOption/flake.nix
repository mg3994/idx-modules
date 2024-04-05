{
    outputs = { ... }: {
        idxModules = [
            ({ lib, ...}: {
                options.myModule.importedOption = lib.mkOption {
                    type = lib.types.str;
                    default = "default value";
                };
            })
        ];
    };
}