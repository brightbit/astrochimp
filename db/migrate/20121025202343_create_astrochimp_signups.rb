class CreateAstrochimpSignups < ActiveRecord::Migration
  def change
    create_table :astrochimp_signups do |t|
      t.string :email
      t.integer :status

      t.timestamps
    end
  end
end
