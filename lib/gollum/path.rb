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

    # Initializes a new instance of the +Path+ class.
    # 
    # @param wiki Reference to the Wiki instance.
    def initialize(wiki)
      @wiki = wiki
    end

    # Converts a path to a human-readable name.
    # 
    # @param path Path to convert to a human-readable name.
    # @return Human-readable name for the page.
    def to_name(path)
      self.class.to_name(path)
    end

    # Converts a wiki page name into a path.
    # 
    # @param name Name to convert into a path.
    # @param path Path within the wiki to place the file.
    # @param markup Markup language in which the page is written.
    # @return Constructed wiki path.
    def to_path(name, path = '', markup = :default)
      name = name.gsub(/\s/, '_').collapse('_')

      markup = Precious::App.settings.default_markup if markup == :default      
      ext = @wiki.page_class.format_to_ext(markup)

      ::File.join(@wiki.base_path, path, "#{name}.#{ext}")
    end
  end
end
