module Vienna
  class Model

    # Define a property on this model subclass. A model can only
    # serialize and work with properties that have been defined
    # this way.
    #
    #     class MyModel < Vienna::Model
    #       property :name
    #       property :age
    #     end
    #
    # @param [String, Symbol] name the property name
    # @param [Class] type the type for this property (optional?)
    def self.property(name, type = String)
      define_method(name) { @attributes[name] }
      define_method("#{name}=") { |v| @attributes[name] = v }
    end

    def initialize(attrs = {})
      @attributes = {}
      attrs.each { |attr, value| __send__ "#{attr}=", value }
    end

    def [](name)
      @attributes[name]
    end

    def []=(name, value)
      @attributes[name] = value
    end
  end
end