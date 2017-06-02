module DPL
  class Provider
    module Heroku
      class GitSSH < Git
        def git_url
          @app['git_url']
        end

        def needs_key?
          true
        end

        def setup_key(file)
          warn ''
          warn "git-ssh strategy is deprecated, and will be shut down on June 26, 2017."
          warn "Please consider moving to the \\`api\\` or \\`git\\` strategy."
          warn ''
          api.post_key File.read(file)
        end

        def remove_key
          api.delete_key(option(:key_name))
        end
      end
    end
  end
end
