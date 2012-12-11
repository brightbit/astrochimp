module IdCode
  extend ActiveSupport::Concern

  module ClassMethods
    # Determines spacing between consecutive referral codes
    def factor
      9
    end

    # determines minimum size of a referal code
    def pad
      26 ** 3 # insure at least four digits
    end

    # Use base 26 here to avoid numeric codes
    # (We want codes to be clearly distinguishable from ids)
    def id_to_code(id)
      (id.to_i * factor + pad).to_s(26).tr('0-9a-p', 'a-z')
    end

    # exact inverse of id_to_code
    def code_to_id(code)
      (code.to_s.tr('a-z', '0-9a-p').to_i(26) - pad) / factor
    end

    def find_by_id_code(code)
      find(code_to_id(code))
    end
  end

  def id_code
    self.class.id_to_code(id)
  end
end
