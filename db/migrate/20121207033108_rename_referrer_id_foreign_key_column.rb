class RenameReferrerIdForeignKeyColumn < ActiveRecord::Migration
  def up
    remove_index  :astrochimp_signups, :referral_id
    rename_column :astrochimp_signups, :referral_id, :referrer_id
    add_index     :astrochimp_signups, :referrer_id
  end

  def down
    remove_index  :astrochimp_signups, :referrer_id
    rename_column :astrochimp_signups, :referrer_id, :referral_id
    add_index     :astrochimp_signups, :referral_id
  end
end
