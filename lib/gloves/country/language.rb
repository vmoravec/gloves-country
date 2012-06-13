#--
# Gloves Language Library
#
# Copyright (C) 2011 Novell, Inc.
#   This library is free software; you can redistribute it and/or modify
# it only under the terms of version 2.1 or version 3 of the GNU Lesser General Public
# License as published by the Free Software Foundation.
#
#   This library is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
# details.
#
#   You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
#++

$LOAD_PATH << File.dirname(__FILE__)

require "rubygems"
require 'config_agent/country/language'

# module for language configuration
module Gloves
  module Country
    module Language

      def self.last_error
        return @error
      end

      @sysconfig2yast	= {
        "RC_LANG"		=> "language",
        "ROOT_USES_LANG"	=> "rootlang",
        "INSTALLED_LANGUAGES"	=> "languages",
        "RC_LC_MESSAGES"  => "RC_LC_MESSAGES"
      }

      # Read all settings relevant for language configuration (key:value map).
      # If "languages" key is passed in input parameters, return list
      # of available languages instead (under "languages" key of return map)
      def self.read(params)

        # get the list of available languages (not only YaST supported)
        if (params["kind"] == "languages")
    # this is read only system call, no need for an agent here
    locales = `locale -a | grep -i utf`.split("\n")
          return {
        "languages"	=> locales
    }
        end

        # read config files
        sysconfig_language	= ConfigAgent::Country::Language.new.read({})

        ret	= {}
        sysconfig_language.each do |key, val|
          ret[@sysconfig2yast[key]]	= val if @sysconfig2yast.has_key? key
        end

        return ret
      end

      # Write Language configuration
      def self.modify(config,params)

        ret		= {
    "success"	=> true
        }

        unless params.nil? && params.empty?
    sysconfig_params = {}
    params.each do |key, value|
            new_key = @sysconfig2yast.invert[key]
            sysconfig_params[new_key] = value unless new_key.nil?
    end
          ret	= ConfigAgent::Country::Language.new.write(sysconfig_params)
        end

        return ret
      end


    end
  end
end
