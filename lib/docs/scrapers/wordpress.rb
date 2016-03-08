module Docs
  class Wordpress < UrlScraper
    self.name = 'WordPress'
    self.type = 'wordpress'
    self.release = 'up to 4.4'
    self.base_url = 'https://developer.wordpress.org/reference/'
    self.initial_paths = %w(
      functions/
      hooks/
      classes/
      methods/)

    self.links = {
      home: 'https://developer.wordpress.org/',
      code: 'https://github.com/WordPress/WordPress'
    }

    html_filters.push 'wordpress/clean_html', 'wordpress/entries'

    options[:container] = ->(filter) { ( filter.root_page? || filter.initial_page? ) ? '#main' : '#main article' }
    options[:only_patterns] = [
      /\Afunctions\/[^\/]+\/\Z/,
      /\Ahooks\/[^\/]+\/\Z/,
      /\Aclasses\/[^\/]+\/\Z/,
      /\Amethods\/[^\/]+\/\Z/]

    options[:attribution] = <<-HTML
      &copy; 2016 WordPress, the contributors<br>
      Licensed under the GNU General Public License version 2.
    HTML
  end
end
