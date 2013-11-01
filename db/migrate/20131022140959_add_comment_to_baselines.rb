class AddCommentToBaselines < ActiveRecord::Migration
  def change
    add_column :baselines, :comment, :string
  end
end
