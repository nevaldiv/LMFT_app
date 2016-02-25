# == Schema Information
#
# Table name: postings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  title      :string
#  amount     :string
#  tags       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Posting < ActiveRecord::Base
  belongs_to :user
  has_many :post_comments

  accepts_nested_attributes_for :post_comments

  validates :title, presence: true
  validates_associated :post_comments
end
