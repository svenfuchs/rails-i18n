class RailsI18n::ExamplesController < ActionController::Base
  helper :all

  def index
    @groups = RailsI18n.example_groups
    @locales = I18n.available_locales.map(&:to_s).sort
    @filter = { :locales => %w(en) }
  end
end