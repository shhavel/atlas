# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Control
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Control.
  # enable :sync

  #add model specific code here

  set :freezed, true

  property :name, :string
  property :value, :string
  property :type, :string
  property :values_str, :string

  def all_values
    Rho::JSON.parse(values_str)
  end

  def min
    Rho::JSON.parse(values_str)['min']
  end

  def max
    Rho::JSON.parse(values_str)['max']
  end

  def step
    Rho::JSON.parse(values_str)['step']
  end

  def checked?
    value == '1'
  end

  class << self
    def lang
      @lang ||= Control.find(:all, :conditions => {'name' => 'lang'}).first.value
    end

    def lang=(lang)
      @lang = lang
    end
  end
end
