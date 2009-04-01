# These changes fix the dash conversions in Ruby
module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Hash #:nodoc:
      module Conversions
        # force :dasherize to be false to fix naming convention
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
    
    module Array #:nodoc:
      module Conversions
        # force :dasherize to be false
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
  end
end

module ActiveRecord #:nodoc:
  module Serialization
    # force :dasherize to be false
    unless method_defined? :old_to_xml
      alias_method :old_to_xml, :to_xml
      def to_xml(options = {})
        options.merge!(:dasherize => false)
        old_to_xml(options)
      end
    end
  end
end

# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem
  #before_filter :login_required
  after_filter :flex_error_handling

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  #protect_from_forgery # :secret => 'a45a7c0279b78366fa1830d5230096a2'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  
  # Flex does not handle 201, 422 http response codes.
  # Need to convert them to code 200 to prevent Flex errors
  def flex_error_handling
    response.headers['Status'] = interpret_status(200) if response.headers['Status'] == interpret_status(422)
    response.headers['Status'] = interpret_status(200) if response.headers['Status'] == interpret_status(201)
  end
  
end
