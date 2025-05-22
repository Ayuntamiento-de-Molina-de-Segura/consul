class AddZoneToBudgetInvestment < ActiveRecord::Migration[5.2]
  def change
    add_column :budget_investments, :zone, :string
  end
end
