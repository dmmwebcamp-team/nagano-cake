class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (is_active == true)
  end

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true
  validates :last_name_kana, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/, message: "は7桁の数字で入力してください" }
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{11}\z/, message: "は11桁の数字で入力してください" }

end
