{ self, inputs, pkgs, lib, ... }:

{
	# Plugins
	plugins = {
		## Language servers ##
		lsp = {
			enable = true;
			inlayHints = true;

			servers = {
				pyright.enable = true; # Python
				marksman.enable = true; # markdown

				# GDScript language server connection to godot executable
				gdscript = {
					enable = true;
					package = null;

					settings = {
						cmd = {
							__raw = ''[[
								local port = os.getenv('GDScript_Port') or "6005"
								local cmd = vim.lsp.rpc.connect('127.0.0.1', port)
								local pipe = '/tmp/godot.pipe'

								vim.lsp.start({
									name = 'Godot',
									cmd = cmd,
									root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
									on_attach = function(client, bufnr)
										vim.api.nvim_command('echo serverstart("' .. pipe ..'")')
									end
								})
					 		]]'';
						};
					};
				};
			};
		};

		## Enable Godot ##
		godot = {
			enable = true;
			settings.executable = "${pkgs.godot}/bin/godot";
		};

		## LSP hints ##
		lsp-signature = {
			enable = true;

			settings = {
				handler_opts = {
					border = "rounded";
				};

				hint_prefix = {
					above = "↙ ";
					current = "-";
					below = "↖ ";
				};
				
				bind = true;
				wrap = true;
				transparency = 15;
				hint_enable = true;
				hint_scheme = "strong";
				max_width = 50;
				padding = "|";
			};
		};

		## LSP kind ##
		lspkind = {
			enable = true;
			cmp.enable = true;
		};
		
		## Bacon ##
		bacon.enable = true;

		## Auto complete hints ##
		cmp = {
			enable = true;
			autoEnableSources = true;
			
			settings = {
				sources = [
					{ name = "nvim_lsp"; }
					{ name = "path"; }
					{ name = "buffer"; }
				];

				mapping = {
					"<Down>" = "cmp.mapping.select_next_item(cmp_select)";
					"<Up>" = "cmp.mapping.select_prev_item(cmp_select)";
					"µ" = "cmp.mapping.confirm({ select = true })";
					"<C-Space>" = "cmp.mapping.complete()";
				};
			};
		};

		## CMP treesitter ##
    cmp-treesitter.enable = true;

		## Treesitter syntax highlight ##
		treesitter = {
			enable = true;

			grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
				lua
				nix
				css
				bash
				json
				markdown
				python
				git_config
				gdscript
				gdshader
			];

			settings = {
				auto_install = false;

				highlight = {
					enable = true;
				};
			};
		};

		## Treesitter context ##
		treesitter-context = {
			enable = true;

			settings = {
				line_numbers = true;
				max_lines = 3;
				min_window_height = 0;
				mode = "cursor";
				multiline_threshold = 20;
				separator = "-";
				trim_scope = "inner";
				zindex = 20;
			};
		};

		## Treesitter textobjects ##
		treesitter-textobjects = {
			enable = true;

			select = {
				enable = true;
				lookahead = true;
			};

			move = {
				enable = true;
				setJumps = true;
			};

			lspInterop = {
				enable = true;
				border = "rounded";
			};
		};

		## Icons ##
		web-devicons.enable = true;

		## Indents ##
		indent-blankline = {
			enable = true;

			settings = {
				exclude.filetypes = [
					"lspinfo"
					"packer"
					"checkhealth"
					"help"
					"man"
					"gitcommit"
					"TelescopePrompt"
					"TelescopeResults"
					"nix"
					"conf"
					"css"
					"''"
				];
			};
		};

		## Telescope ##
		telescope = {
			enable = true;
		};

		## Nvim tree ##
		nvim-tree = {
			enable = true;
		};

		## Lua Line ##
		lualine = {
			enable = true;

			settings = {
				options = {
					icons_enable = true;
					always_divide_middle = true;
					always_show_tabline = true;
					globalstatus = false;
				};

				sections = {
					lualine_a = [ "mode" ];
					lualine_b = [ "filename" "diagnostics" ];
					lualine_c = [ "branch" "diff" ];
				};
			};
		};
	};
} 
