if Rails::VERSION::MAJOR == 5 && RUBY_VERSION >= "3.1.0"
  module ActionDispatch
    class Static
      alias_method :old_initialize, :initialize
      def initialize(app, path, *args)
        old_initialize(app, path)
      end
    end
  end
end
