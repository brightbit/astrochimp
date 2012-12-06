module IdCode
  module ClassMethods
    def pad
      99999
    end

    def id_to_code(id)
      (id.to_i + pad).to_s(36)
    end

    def code_to_id(code)
      code.to_i(36) - pad
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
