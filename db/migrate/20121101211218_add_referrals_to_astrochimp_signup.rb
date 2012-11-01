class AddReferralsToAstrochimpSignup < ActiveRecord::Migration
  def change
    add_column :astrochimp_signups, :referral_id, :integer
    add_column :astrochimp_signups, :referral_code, :string
    add_column :astrochimp_signups, :referral_count, :integer, default: 0

    add_index  :astrochimp_signups, :referral_id
    add_index  :astrochimp_signups, :referral_code
  end
end
