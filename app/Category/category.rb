# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Category
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Category.
  # enable :sync

  #add model specifc code here

  set :freezed, true

  property :sign, :string
  property :name_ru, :string
  property :name_ua, :string

  def maps
    Map.find(:all, :conditions => {'category_sign' => self.sign})
  end

  def name
    Control.lang == 'ua' ? name_ua : name_ru
  end
end
