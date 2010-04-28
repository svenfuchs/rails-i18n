module RailsI18n::ExamplesHelper
  def locale_active?(locale)
    @filter[:locales].include?(locale)
  end
end