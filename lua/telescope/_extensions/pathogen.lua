local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  error "This plugin requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)"
end

local pathogen = require("pathogen")

return telescope.register_extension {
  setup = function(ext_config, config)
    -- access extension config and user config
    if ext_config.use_last_search_for_live_grep ~= nil then
        pathogen.use_last_search_for_live_grep = ext_config.use_last_search_for_live_grep
    end
    if ext_config.short_prompt_path ~= nil then
        pathogen.short_prompt_path = ext_config.short_prompt_path
    end
  end,
  exports = {
    pathogen = pathogen.browse_file,
    grep_string = pathogen.grep_string,
    find_files = pathogen.find_files,
    live_grep = pathogen.live_grep,
  },
}
