{
	description = "Darwin system flake";
	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-darwin.url = "github:LnL7/nix-darwin";	
		nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	};

	outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew, neovim-nightly-overlay }:
	let
		configuration = {pkgs, config, ...}: {
			nixpkgs.config.allowUnfree = true;

			environment.systemPackages = 
				[
					neovim-nightly-overlay.packages.${pkgs.system}.default
					pkgs.wezterm
					pkgs.obsidian
					pkgs.curl
					pkgs.openssl
					pkgs.direnv
					pkgs.jq
					pkgs.luajit
					pkgs.postgresql
					pkgs.stow
					pkgs.tree
					pkgs.valkey
					pkgs.wget
					pkgs.gnupg
					pkgs.sqlite
					pkgs.gnumake
					pkgs.spotify
					pkgs.xz
					pkgs.zlib
					pkgs.tcl
					pkgs.ncurses
					pkgs.kubectl
					pkgs.stow
					pkgs.zinit
					pkgs.oh-my-posh
					pkgs.fzf
					pkgs.tree-sitter
					pkgs.zoxide
					pkgs.fnm
					pkgs.rustup
					pkgs.librewolf
					pkgs.protonmail-bridge
					pkgs.nerd-fonts.fira-code
				];

			homebrew = {
				enable = true;
				brews = [
					"mas"
					"ca-certificates"
					"pinentry"
					"pinentry-mac"
					"gcc"
					"readline"
					"openssl@3"
					"pkg-config"
					"libtool"
					"make"
					"ninja"
					"meson"
					"spice-protocol"
					"go"
					"go-md2man"
					"bzip2"
					"qemu"
					"podman"	
				];
				casks = [
					"firefox"
					"1password-cli"
				];
				onActivation.cleanup = "zap";
				onActivation.autoUpdate = true;
				onActivation.upgrade = true;
				masApps = {};
			};

			system.defaults = {
				dock.autohide = true;
				dock.persistent-apps = [
					"${pkgs.obsidian}/Applications/Obsidian.app"
					"${pkgs.wezterm}/Applications/wezterm.app"
					"${pkgs.spotify}/Applications/Spotify.app"
					"${pkgs.librewolf}/Applications/LibreWolf.app"
					"/Applications/Firefox.app"
					"/Applications/1Password.app"
					"/System/Applications/System Settings.app"
					"/System/Applications/Launchpad.app"
					"/System/Applications/Mail.app"
				];
				finder.FXPreferredViewStyle = "clmv";
				loginwindow.GuestEnabled = false;
				NSGlobalDomain.AppleInterfaceStyle = "Dark";
			};
			
			system.activationScripts.applications.text = let
				env = pkgs.buildEnv {
					name = "system-applications";
					paths = config.environment.systemPackages;
					pathsToLink = "/Applications";
				};
				in
					pkgs.lib.mkForce ''
						# Set up applications
						echo "setting up /Applications..." >&2
						rm -rf /Applications/Nix\ Apps
						mkdir -p /Applications/Nix\ Apps
						find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
						while read -r src; do
							app_name=$(basename "$src")
							echo "copying $src" >&2
							${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
						done
					'';
				
				nix.settings.experimental-features = "nix-command flakes";
				programs.zsh.enable = true;
				system.configurationRevision = self.rev or self.dirtyRev or null;
				system.stateVersion = 5;
				nixpkgs.hostPlatform = "aarch64-darwin";
			};
	in
	{
		darwinConfigurations."gwaihir" = nix-darwin.lib.darwinSystem {
			modules = [
				configuration
				nix-homebrew.darwinModules.nix-homebrew
				{
					nix-homebrew = {
						enable = true;
						enableRosetta = true;
						user = "chosunone";
						autoMigrate = true;
					};
				}
			];
		};
	darwinPackages = self.darwinConfigurations."gwaihir".pkgs;
	};
}
