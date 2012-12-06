class RemoveReferralCodeFromAstrochimpSignup < ActiveRecord::Migration
  def change
    remove_index  :astrochimp_signups, :referral_code
    remove_column :astrochimp_signups, :referral_code
  end
end
