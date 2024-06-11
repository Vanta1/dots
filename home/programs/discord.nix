{ pkgs, config, home, ... }: {
    home.packages = [
        (pkgs.discord.override {
            # withOpenASAR = true;
            withVencord = true;
        })
    ];
}