class AddFaqType < ActiveRecord::Migration[5.1]
  def change
    add_column :faqs, :faq_type, :integer
  end
end
