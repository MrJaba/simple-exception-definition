module SimpleExceptionDefinition
  
  def define_exception( exception_class_name )
    klass_name = Class.new(StandardError)
    klass_name.class_eval do
      attr_reader :object
      def initialize( message=nil, object=nil )
        @object = object
        @message = message || "#{self.class.to_s} error"
      end
      def message
        @message
      end
    end
    Object.const_set( exception_class_name.to_s.gsub(/\/(.?)/) { "::" + $1.upcase }.gsub(/(^|_)(.)/) { $2.upcase }, klass_name )
  end
  
  def define_exceptions( *args )
    args.each { |arg| define_exception(arg) }
  end
  
end


Object.extend( SimpleExceptionDefinition )