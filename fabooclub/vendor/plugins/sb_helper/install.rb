# Install hook code here

require 'ftools'

plugin_dir = File.dirname(__FILE__)
root_dir = File.join(plugin_dir, '..', '..', '..')



# copy sass files
File.makedirs File.join(root_dir, 'public', 'stylesheets', 'sass')

["sb_mixin", "sb_layout", "sb_reset", "sb_typo", "sb_form", "suddenlybunt"].each do |s|
  File.copy(
    File.join(plugin_dir, 'sass', "#{s}.sass"), 
    File.join(root_dir, 'public', 'stylesheets', 'sass', "#{s}.sass")
  )
end



# copy master image files
File.makedirs File.join(root_dir, 'public', 'images', 'master')

[
  "arrow_dropdown.gif", 
  "button_bg.png", 
  "background-gradient.gif", 
  "header-background.gif",
  "spinner.gif",
  "transparentGif.gif"
].each do |s|
  File.copy(
    File.join(plugin_dir, 'images', s), 
    File.join(root_dir, 'public', 'images', 'master', s)
  )
end



# copy javascript files
# File.makedirs File.join(root_dir, 'public', 'javascripts')

["suddenlybunt"].each do |s|
  File.copy(
    File.join(plugin_dir, 'javascripts', "#{s}.js"), 
    File.join(root_dir, 'public', 'javascripts', "#{s}.js")
  )
end



