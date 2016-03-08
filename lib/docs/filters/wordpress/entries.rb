module Docs
  class Wordpress
    class EntriesFilter < Docs::EntriesFilter
      def get_name
        slug.sub '-', ' '
      end
    end
  end
end
