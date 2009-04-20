module MultiSite
  module RouteSetExtensions
    
    def new
      super.extend MultiSiteRequestEnvironment
    end
    
    module MultiSiteRequestEnvironment
      def extract_request_environment(request)
        RAILS_DEFAULT_LOGGER 'ok'
        super.merge!(:site => request.host)
      end
    end

  end
end