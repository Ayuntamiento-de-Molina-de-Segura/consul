require_dependency Rails.root.join('app', 'models', 'budget', 'investment', 'exporter').to_s

class Budget::Investment::Exporter
    require "csv"
    include JsonExporter

    private

    def headers
      [
        I18n.t("admin.budget_investments.index.list.id"),
        I18n.t("admin.budget_investments.index.list.title"),
        I18n.t("admin.budget_investments.index.list.supports"),
        I18n.t("admin.budget_investments.index.list.admin"),
        I18n.t("admin.budget_investments.index.list.valuator"),
        I18n.t("admin.budget_investments.index.list.valuation_group"),
        I18n.t("admin.budget_investments.index.list.geozone"),
        I18n.t("admin.budget_investments.index.list.feasibility"),
        I18n.t("admin.budget_investments.index.list.valuation_finished"),
        I18n.t("admin.budget_investments.index.list.selected"),
        I18n.t("admin.budget_investments.index.list.visible_to_valuators"),
        I18n.t("admin.budget_investments.index.list.author_username"),
        I18n.t("admin.budget_investments.index.list.description"),
        I18n.t("admin.budget_investments.index.list.zone"),
      ]
    end

    def csv_values(investment)
      [
        investment.id.to_s,
        investment.title,
        investment.total_votes.to_s,
        admin(investment),
        investment.assigned_valuators || "-",
        investment.assigned_valuation_groups || "-",
        investment.heading.name,
        price(investment),
        investment.valuation_finished? ? I18n.t("shared.yes") : I18n.t("shared.no"),
        investment.selected? ? I18n.t("shared.yes") : I18n.t("shared.no"),
        investment.visible_to_valuators? ? I18n.t("shared.yes") : I18n.t("shared.no"),
        investment.author.username,
        strip_tags(investment.description),
        investment.zone ? I18n.t("budgets.investments.zones.#{investment.zone}") : ""
      ]
    end
end