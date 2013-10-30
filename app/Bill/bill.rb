# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Bill
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Bill.
  # enable :sync

  #add model specific code here

  set :freezed, true

  property :code, :string
  property :token, :string
  property :paid, :integer
end
