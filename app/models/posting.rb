# == Schema Information
#
# Table name: postings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  author     :string
#  amount     :string
#  tags       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Posting < ActiveRecord::Base
  belongs_to :user
  has_many :post_comments
end
