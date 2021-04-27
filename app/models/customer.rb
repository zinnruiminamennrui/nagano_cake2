class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def active_for_authentication?
    super && (self.is_deleted == false)
  end

  validates :last_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name, presence: true
  validates :first_name_kana, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true

  has_many :orders, dependent: :destroy
  has_many :addressees, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  def name
    last_name + first_name
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
