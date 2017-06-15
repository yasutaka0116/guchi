class Request < ApplicationRecord

  belongs_to :user
  has_many :accepts, :dependent => :destroy

  paginates_per 5
   #valdiation
  validates :role, inclusion: [0,1]
  validates :date, presence: true
  validates :starttime, presence: true, numericality: { only_integer: true }
  validates :endtime, presence: true, numericality: { only_integer: true }
  validates :state, presence: true
  validates :address, presence: true
  validates :message, presence: true, length: { maximum: 500 }
  validate :morestarttime, on: :create
  validate :add_date_type ,on: :create
  validate :past_date, on: :create, if: Proc.new{|a| a.date.present? }

  def past_date
    if date < Date.today
      errors[:base]<< "今日以降をしてください。"
    end
  end

  def add_date_type
    if date.nil?
      errors[:base]<< "日付のフォーマットが正しくありません。 "
    else
      return
    end
  end

  def morestarttime
    if endtime < starttime
      errors[:base]<<"開始時間より遅くしてください"
    end
  end

end
