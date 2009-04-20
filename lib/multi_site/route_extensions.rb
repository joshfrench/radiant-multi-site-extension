module MultiSite
  module RouteExtensions
    
    def new
      super.extend MultiSiteRecognitionConditions
    end
    
    module MultiSiteRecognitionConditions
      def recognition_conditions
        result = super
        puts super.inspect
        puts conditions.inspect
        if site_names = conditions.delete(:site)
          domains = [*site_names].map{ |site| Regexp.compile(::Site.find_by_name(site).domain) }
          conditions[:site] = Regexp.union(*domains)
          result << "conditions[:site] === env[:site]"
        end
        result
      end
    end

  end
end