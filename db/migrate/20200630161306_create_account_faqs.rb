class CreateAccountFaqs < ActiveRecord::Migration[6.0]
  def change
    create_table :account_faqs do |t|

      t.timestamps
    end
  end
end
