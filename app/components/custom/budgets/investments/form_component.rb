class Budgets::Investments::FormComponent < ApplicationComponent
  include TranslatableFormHelper
  include GlobalizeHelper
  attr_reader :investment, :url
  delegate :current_user, :budget_heading_select_options, :suggest_data, to: :helpers

  def initialize(investment, url:)
    @investment = investment
    @url = url
  end

  private

    def budget
      investment.budget
    end

    def zone_options
      options = investment.zones.map { |zone| [t("budgets.investments.zones.#{zone}"), zone] }
      options_for_select(options, investment.zone)
    end

    def categories
      Tag.category.order(:name)
    end
end
