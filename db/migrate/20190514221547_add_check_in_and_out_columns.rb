class AddCheckInAndOutColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :check_out, :date, default: Date.today
    add_column :return_date, :date, default: (Date.today + 7)
  end
end
