# 
# Copyright (c) 2012 by Lifted Studios.  All Rights Reserved.
# 

require 'cgi'

module Gollum
  # Methods for converting paths to human-readable names and vice versa.
  class Path
    # Regular expression for matching a page path.
    VALID_PAGE_RE = /([^\/]+)\.(md|mkdn?|mdown|markdown|textile|rdoc|org|creole|re?st(\.txt)?|asciidoc|pod|(media)?wiki)$/i

    # Converts a path to a human-readable name.
    # 
    # @param path Path to convert to a human-readable name.
    # @return Human-readable name for the page.
    def self.to_name(path)
      path = CGI::unescape(path)
      name = path =~ VALID_PAGE_RE && $1
      name.gsub('_', ' ')
    end
  end
end
