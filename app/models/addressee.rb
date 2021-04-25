class Addressee < ApplicationRecord
  belongs_to :customer
  def addressee_all
	 postal_code + address + name
  end
end
