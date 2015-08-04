require 'puppet/util/inifile'

module PuppetX
  module Openstack
    module Util
      class IniFile < Puppet::Util::IniFile

        def initialize(path, key_val_separator = ' = ', section_prefix = '[', section_suffix = ']', ensure_absent_val = '<SERVICE DEFAULT>')
          super path, key_val_separator, section_prefix, section_suffix
          @ensure_absent_val = ensure_absent_val
        end

        def set_value(section_name, setting, value)
          if value.eql? @ensure_absent_val
            self.remove_setting(section_name, setting)
          else
            super
          end
        end

      end
    end
  end
end

