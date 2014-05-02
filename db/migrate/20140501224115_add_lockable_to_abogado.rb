class AddLockableToAbogado < ActiveRecord::Migration
  def change
    add_column :abogados, :failed_attemps, :integer, default: 0
    add_column :abogados, :unlock_token, :string
    add_column :abogados, :locked_at, :datetime
  end
end
