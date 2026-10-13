{
  description = "macOS の環境（nix-darwin + home-manager）";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nix-darwin, home-manager, ... }:
    let
      # 実行したユーザー（sudo の前のユーザー）をそのまま使う。--impure が必要
      username =
        let
          sudoUser = builtins.getEnv "SUDO_USER";
          user = if sudoUser != "" then sudoUser else builtins.getEnv "USER";
        in
        if user == "" || user == "root" then
          throw "ユーザー名が取れません。--impure を付けて、sudo で実行してください"
        else
          user;
    in
    {
      darwinConfigurations.mac = nix-darwin.lib.darwinSystem {
        specialArgs = { inherit inputs username; };
        modules = [
          ./darwin
          home-manager.darwinModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              # 同名のファイルがすでにあれば *.before-nix にリネームしてから置く
              backupFileExtension = "before-nix";
              extraSpecialArgs = { inherit username; };
              users.${username} = import ./home;
            };
          }
        ];
      };
    };
}
