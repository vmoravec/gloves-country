require 'gli'
require 'gloves/keyboard'
require 'gloves/country/version'

include GLI::App

program_desc "Keyboard configuration for Gloves"

version Gloves::Country::VERSION

desc "Keyboard configuration"

command :list do |c|
  c.action do
    puts 'Do something keyboard related'
  end
end

pre do |global,command,options,args|
  # Pre logic here
  # Return true to proceed; false to abourt and not call the
  # chosen command
  # Use skips_pre before a command to skip this block
  # on that command only
  true
end

post do |global,command,options,args|
  # Post logic here
  # Use skips_post before a command to skip this
  # block on that command only
end

on_error do |exception|
  # Error logic here
  # return false to skip default error handling
  true
end

run(ARGV)