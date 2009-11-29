# stolen from Kakutani Shintaro http://github.com/kakutani/yaml_waml
# fixing output result of 'to_yaml' method which otherwise treats multibyte UTF-8 strings as binary

require "yaml"

class String
  if !defined?('is_binary_data')
    def is_binary_data?
      false
    end
  end
end

module YamlWaml
  def decode(orig_yamled)
    yamled_str = case orig_yamled
                 when String then orig_yamled
                 when StringIO then orig_yamled.string
                 else return orig_yamled
                 end
    yamled_str.gsub!(/\\x(\w{2})/){[$1].pack("H2")}
    return yamled_str
  end
  module_function :decode
end

ObjectSpace.each_object(Class) do |klass|
  klass.class_eval do
    if method_defined?(:to_yaml) && !method_defined?(:to_yaml_with_decode)
      def to_yaml_with_decode(*args)
        io = args.shift if IO === args.first
        yamled_str = YamlWaml.decode(to_yaml_without_decode(*args))
        io.write(yamled_str) if io
        return yamled_str
      end
      alias_method :to_yaml_without_decode, :to_yaml
      alias_method :to_yaml, :to_yaml_with_decode
    end
  end
end