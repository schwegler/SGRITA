# == Schema Information
#
# Table name: employees
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  work_phone   :string(255)
#  home_phone   :string(255)
#  mobile_phone :string(255)
#  address      :string(255)
#  email        :string(255)
#  title        :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  attachment   :string(255)
#

class Employee < ActiveRecord::Base
  	attr_accessible :remove_attachment, :attachment_cache, :attachment, :address, :email, :home_phone, :mobile_phone, :name, :title, :work_phone
  	mount_uploader :attachment, AttachmentUploader
end
