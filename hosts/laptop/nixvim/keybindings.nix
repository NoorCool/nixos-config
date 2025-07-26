{ self, ... }:

{
	keymaps = [
		# Open telescope file finder
		{
			mode = ["n"];
			key = "<leader>ff";
			action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
		}

		#Open Nvim tree
    {
			mode = ["n"];
			key = "<leader>bb";
			action = "<cmd>NvimTreeOpen<CR>";
		}

		# Close Nvim tree
		{
			mode = ["n"];
			key = "<leader>bc";
			action = "<cmd>NvimTreeClose<CR>";
		}
		
		#Move to right window
		{
			mode = ["n"];
			key = "<leader>l";
			action = "<C-w>l";
		}
		
		#Move to left window
		{
			mode = ["n"];
			key = "<leader>h";
			action = "<C-w>h";
		}

		#Create terminal split
		{
			mode = ["n"];
			key = "<leader>t";
			action = "<cmd>vs | terminal<CR>";
		}

		#Quit terminal mode
		{
			mode = ["n"];
			key = "<F1>";
			action = "<C-\><C-n>";
		}
	];
}

