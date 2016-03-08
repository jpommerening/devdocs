module Docs
  class Wordpress
    class CleanHtmlFilter < Filter
      def call
        if root_page?
          root
        elsif paged?
          paged
        else
          other
        end
        doc
      end

      def paged?
        initial_page? || /\/page\/\d+\Z/ =~ subpath
      end

      def root
         # at_css('h2').content = 'WordPress'
      end

      def paged
      end

      def other
        css('section.user-notes').remove
        # css('h1 + h2', '#_git + div', '#_git').remove

        # css('> div', 'pre > tt', 'pre > em', 'div.paragraph').each do |node|
        #   node.before(node.children).remove
        # end

        # css('> h1').each do |node|
        #   node.content = node.content.remove(/\(\d\) Manual Page/)
        # end

        # unless at_css('> h1')
        #   doc.child.before("<h1>#{slug}</h1>")
        # end

        # unless at_css('> h2')
        #   css('> h3').each do |node|
        #     node.name = 'h2'
        #   end
        # end

        # css('h2').each do |node|
        #   node.content = node.content.capitalize
        # end

        # css('tt', 'p > em').each do |node|
        #   node.name = 'code'
        # end
      end
    end
  end
end
