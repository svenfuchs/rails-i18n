module RailsI18n::ExampleGroups
  class Group
    attr_reader :name, :examples

    def initialize(name, &block)
      @name = name
      @examples = []
      yield self
    end

    def example(description, &block)
      @examples << Example.new(description, &block)
    end
  end

  class Example
    attr_reader :description
    
    def initialize(description, &block)
      @description = description
      @block = block
    end
    
    def yield(scope, locale)
      I18n.locale = locale
      scope.instance_eval &@block
    rescue Exception => e
      %(<span class="error">#{e.message}</span>)
    end
  end

  class << self
    def group(name, &block)
      RailsI18n.example_groups << RailsI18n::ExampleGroups::Group.new(name, &block)
    end
  end
end
