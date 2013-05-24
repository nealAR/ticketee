class Project < ActiveRecord::Base
  attr_accessible :name, :description

  validates :name, :presence => true

  #has_many :tickets, :dependent => :delete_all
  has_many :tickets

  has_many :permissions, :as => :thing

  #scope :admins, where(:admin => true)

  def self.for(user)
    user.admin? ? Project : Project.viewable_by(user)
  end

  def self.viewable_by(user)
    joins(:permissions).where(:permissions => { :action => "view",
                                              :user_id => user.id })
  end
end