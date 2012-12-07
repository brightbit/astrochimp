class RenameReferralsCounterCacheColumn < ActiveRecord::Migration
  def change
    rename_column :astrochimp_signups, :referral_count, :signups_count
  end
end
