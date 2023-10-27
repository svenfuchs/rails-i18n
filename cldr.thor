require 'active_support/core_ext/hash/deep_transform_values'
require 'active_support/core_ext/hash/keys.rb'
require 'active_support/core_ext/string/inflections'
require 'cldr'

class Cldr < Thor
  desc 'download', 'Download CLDR XML files'
  def download
    # See available releases https://cldr.unicode.org/index/downloads
    version = ENV.fetch('CLDR_VERSION', 43)
    puts "Downloading CLDR version #{version}"

    ::Cldr::Download.download(::Cldr::Download::DEFAULT_SOURCE, ::Cldr::Download::DEFAULT_TARGET, version) { putc('.') }

    puts
  end

  desc 'build', 'Build CLDR YAML files from CLDR XML files'
  def build
    export_target = File.dirname(__FILE__) + '/vendor/cldr/yaml'
    FileUtils.mkdir_p export_target

    locales = CheckLocales.list_locales.select { |locale| File.exist?(::Cldr::Download::DEFAULT_TARGET + "/common/main/#{locale}.xml") }

    puts "Building YAML files"

    ::Cldr::Export.export(
      target: export_target,
      locales: locales.map(&:to_sym),
      components: [:Calendars, :Fields, :Lists, :Numbers, :Units],
      merge: true,
      minimum_draft_status: ::Cldr::DraftStatus::CONTRIBUTED
    ) { putc('.') }

    puts
  end

  desc 'dump', 'Dump Rails YAML based on CLDR YAML'
  def dump
    @cldr = {}
    @data = {}

    Dir.glob(File.dirname(__FILE__) + '/vendor/cldr/yaml/**/*.yml') do |file|
      data = YAML.safe_load_file(file, permitted_classes: [Symbol], symbolize_names: true)

      # Resolve aliases
      locale = data.keys.first
      data.deep_transform_values! { |s| s.is_a?(Symbol) ? data.dig(locale, *s.to_s.split('.')) : s }

      @cldr.deep_merge!(data)
    end

    CheckLocales.list_locales.uniq.each do |locale|
      @locale = locale.to_sym

      add_months
      add_weekdays
      add_prompts
      add_number
      add_currency
      add_percentage
      add_decimal_units
      add_storage_units
      add_support
    end

    puts YAML.dump(@data.deep_stringify_keys)
  end

  private

  def add_months
    names = [nil]
    abbr_names = [nil]
    (1..12).each do |key|
      return unless name = @cldr.dig(@locale, :calendars, :gregorian, :months, :format, :wide, key)
      names.push(name)

      return unless name = @cldr.dig(@locale, :calendars, :gregorian, :months, :format, :abbreviated, key)
      abbr_names.push(name)
    end

    add([@locale, :date, :month_names], names)
    add([@locale, :date, :abbr_month_names], abbr_names)
  end

  def add_weekdays
    names = []
    abbr_names = []
    [:sun, :mon, :tue, :wed, :thu, :fri, :sat].each do |key|
      return unless name = @cldr.dig(@locale, :calendars, :gregorian, :days, :format, :wide, key)
      names.push(name)

      return unless name = @cldr.dig(@locale, :calendars, :gregorian, :days, :format, :abbreviated, key)
      abbr_names.push(name)
    end

    add([@locale, :date, :day_names], names)
    add([@locale, :date, :abbr_day_names], abbr_names)
  end

  def add_prompts
    [:second, :minute, :hour, :day, :month, :year].each do |key|
      return unless display_name = @cldr.dig(@locale, :fields, key, :display_name)

      add([@locale, :datetime, :prompts, key], display_name.upcase_first)
    end
  end

  def add_number
    return unless symbols = @cldr.dig(@locale, :numbers, :latn, :symbols)

    add([@locale, :number, :format, :delimiter], symbols[:group])
    add([@locale, :number, :format, :separator], symbols[:decimal])
  end

  def add_currency
    if symbols = @cldr.dig(@locale, :numbers, :latn, :symbols)
      add([@locale, :number, :currency, :format, :delimiter], symbols[:currency_group] || symbols[:group])
      add([@locale, :number, :currency, :format, :separator], symbols[:currency_decimal] || symbols[:decimal])
    end

    if format = @cldr.dig(@locale, :numbers, :latn, :formats, :currency, :patterns, :default, :standard).dup
      format.gsub!('¤', '%u')
      format.gsub!(/;.*/, '')
      format.gsub!(/[#,.0]+/, '%n')
      add([@locale, :number, :currency, :format, :format], format)
    end
  end

  def add_percentage
    if symbols = @cldr.dig(@locale, :numbers, :latn, :symbols)
      add([@locale, :number, :percentage, :format, :delimiter], symbols[:group])
    end

    if format = @cldr.dig(@locale, :numbers, :latn, :formats, :percent, :patterns, :default, :standard).dup
      format.gsub!('%', symbols[:percent_sign]) if symbols
      format.gsub!(/[#,.0]+/, '%n')
      add([@locale, :number, :percentage, :format, :format], format)
    end
  end

  def add_storage_units
    if format = @cldr.dig(@locale, :units, :unit_length, :short, :digital_kilobyte, :other).dup
      ok = format.gsub!(/\A\{0\}(\s*).*\z/, '%n\1%u') || format.gsub!(/\A.*?(\s*)\{0\}\z/, '%u\1%n')
      raise "Unsupported format: #{format}" unless ok
      add([@locale, :number, :human, :storage_units, :format], format)
    end

    mapping = {
      byte: :digital_byte,
      kb:   :digital_kilobyte,
      mb:   :digital_megabyte,
      gb:   :digital_gigabyte,
      tb:   :digital_terabyte,
      pb:   :digital_petabyte,
      eb:   :digital_exabyte,
    }.each do |rails_key, cldr_key|
      width = rails_key == :byte ? :long : :short
      next unless unit = @cldr.dig(@locale, :units, :unit_length, width, cldr_key)

      unit.transform_values! { |s| s.gsub(/[[:space:]]*\{0\}[[:space:]]*/, '').upcase_first }

      add([@locale, :number, :human, :storage_units, :units, rails_key], plural(unit))
    end
  end

  def add_decimal_units
    if format = @cldr.dig(@locale, :numbers, :latn, :formats, :decimal, :patterns, :long, :standard, :other).dup
      ok = format.gsub!(/\A\{0\}(\s*).*\z/, '%n\1%u') || format.gsub!(/\A.*?(\s*)\{0\}\z/, '%u\1%n')
      raise "Unsupported format: #{format}" unless ok
      add([@locale, :number, :human, :decimal_units, :format], format)
    end

    {
      thousand:    :'1000',
      million:     :'1000000',
      billion:     :'1000000000',
      trillion:    :'1000000000000',
      quadrillion: :'1000000000000000',
    }.each do |rails_key, cldr_key|
      next unless unit = @cldr.dig(@locale, :numbers, :latn, :formats, :decimal, :patterns, :long, :standard, cldr_key)

      unit.transform_values! { |s| s.gsub(/\s*0\s*/, '').strip.upcase_first }

      add([@locale, :number, :human, :decimal_units, :units, rails_key], plural(unit))
    end
  end

  def add_support
    return unless list = @cldr.dig(@locale, :lists, :default)

    list.transform_values! { |s| s.gsub!(/\{[01]\}/, '') }

    add(
      [@locale, :support, :array],
      {
        last_word_connector: list[:end],
        two_words_connector: list[:'2'],
        words_connector:     list[:middle],
      }
    )
  end

  def add(path, value)
    last_key = path.pop
    data = path.inject(@data) {|hash, key| hash[key] ||= {} }

    raise "Key already exists" if data.key?(last_key)

    data[last_key] = value
  end

  def plural(node)
    values = node.values
    if values.uniq.size == 1
      node[:other]
    else
      {
        one:   node[:one],
        other: node[:other],
      }
    end
  end
end
