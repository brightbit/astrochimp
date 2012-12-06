module IdCode
  module ClassMethods
    def factor
      99
    end

    def id_to_code(id)
      (id.to_i * factor).to_s(26).tr('0-9a-p', 'a-z')
    end

    def code_to_id(code)
      code.to_s.tr('a-z', '0-9a-p').to_i(26) / factor
    end

    def find_by_id_code(code)
      find(code_to_id(code))
    end
  end

  def self.included(base)
    base.extend(ClassMethods)
  end

  def id_code
    self.class.id_to_code(id)
  end
end
