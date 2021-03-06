module Kontena::Cli::Master
  class ListCommand < Kontena::Command
    include Kontena::Cli::Common

    def execute
      puts '%-24s %-30s' % ['Name', 'Url']
      current_master = config.current_master
      config.servers.each do |server|
        if current_master && server['name'] == current_master.name
          name = "* #{server['name']}"
        else
          name = server['name']
        end
        puts '%-24s %-30s' % [name, server['url']]
      end
    end
  end
end
