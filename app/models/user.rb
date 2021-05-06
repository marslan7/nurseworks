class User < ApplicationRecord

  ThinkingSphinx::Callbacks.append(
        self, :behaviours => [:real_time]
    )
    
  validates :first_name, :last_name, :email, :phone, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ROLES = ["User", "Admin"]
  
  has_many :support_requests
  has_many :user_docs

  has_rich_text :bio
  
  has_one_attached :profile_image, dependent: :destroy

  before_create :setup_role

  def full_name
    first_name + " " + last_name
  end
  
  def setup_role
    self.role = "User"
  end

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later
  end
  
  def self.import_from_xl(xl_path)
    xlsx = Roo::Spreadsheet.open(xl_path)

    # header_row_count = 2
    # details_sheet = xlsx.sheet(1) 
    # row_count = details_sheet.count # First 2 rows are dummy
    # (header_row_count..row_count).each do |i|
    #   row = details_sheet.row(i)
    #   puts "#{row}"
    #   email = row[1]
    #   u = User.find_by(email: email)
    #   u = User.new if u == nil
    #   u.last_name, u.first_name = row[0].split(",")
    #   u.last_name = u.last_name.strip
    #   u.first_name = u.first_name.strip
    #   u.email = row[1].strip
    #   u.password = row[1].strip
    #   u.phone = row[2].strip
    #   u.save!
    # end

    not_found = []
    bio_sheet = xlsx.sheet(0) 
    header_row_count = 2
    row_count = bio_sheet.count # First 2 rows are dummy
    (header_row_count..row_count).each do |i|
      row = bio_sheet.row(i)
      puts "#{row}"
      first_name, last_name = row[0].split(" ")
      u = u = User.where(first_name: first_name.strip, last_name: last_name.strip).first
      if u
        u.bio = row[1].gsub("\n", "<br>")
        u.save!  
      else
        not_found << row[0]
      end
    end

    puts not_found

  end

end
