# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Map
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Map.
  # enable :sync

  #add model specifc code here

  set :freezed, true

  property :category_sign, :string
  property :name_ru, :string
  property :name_ua, :string
  property :name_en, :string
  property :file, :string
  property :summary, :string
  property :pictures_list, :string
  property :legend, :string
  property :questionnaire, :string

  def category
    Category.find(:all, :conditions => {'sign' => self.category_sign}).first
  end

  def name
    if Control.lang == 'ua'
      name_ua
    elsif Control.lang == 'ru'
      name_ru
    else
      name_en
    end
  end
end
