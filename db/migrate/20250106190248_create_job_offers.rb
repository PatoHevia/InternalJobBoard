class CreateJobOffers < ActiveRecord::Migration[7.2]
  def change
    create_table :job_offers do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.integer :created_by

      t.timestamps
    end
  end
end
