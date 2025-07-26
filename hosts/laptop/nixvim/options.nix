{ ... }:

{
	## Nixvim options ##
	config = {
		globals.mapleader = " ";

		opts = {
			# Relative line number
			number = true;
			relativenumber = true;

			# Tabs
			tabstop = 2;
			smarttab = false;
			smartindent = true;
			expandtab = false;
			autoindent = true;

			# Search settings
			hlsearch = false;
			incsearch = true;
			ignorecase = true;
			smartcase = true;
			ruler = true;

			# General
			wrap = false;

			# Enable mouse control
			mouse = "a";

			# Visualize characters
			list = true;
			listchars = {
				tab = "→ ";
				trail = "°";
			};

			# Copy-paste settings
			clipboard = {
				providers = {
					wl-copy.enable = true;
				};
				register = "unnamedplus";
			};
		};

		# Automatic commands
		autoCmd = [
			# Shows error messages when cursor hold
			{
				event = [ "CursorHold" ];
				callback = { __raw = ''function() vim.diagnostic.open_float() end'';};
			}
			
			# Opens NvimTree on start up
			{
				event = [ "VimEnter" ];
				command = "NvimTreeOpen";
			}
		];
	};
}
