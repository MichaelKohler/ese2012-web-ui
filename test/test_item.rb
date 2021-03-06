require "test/unit"

def relative path
  File.join(File.dirname(__FILE__), path)
end
require relative('../app/models/market/item')
require relative('../app/models/market/user')

include Market

class ItemTest < Test::Unit::TestCase

  def test_has_name
    item = Item.init(:name => "testItem")
    assert(item.name.to_s.include?("testItem"), "item has a wrong name!")
  end

  def test_has_price
    item = Item.init(:price => 100)
    assert(item.price == 100, "item has a wrong price!")
  end

  def test_has_owner
    user = User.init(:name => "John")
    item = Item.init(:owner => user)
    assert(item.owner == user, "item has an incorrect owner!")
  end

  def test_changes_state
    item = Item.init()
    item.activate
    assert(item.active, "item is still inactive!")
  end

  def test_is_inactive_after_trade
    user = User.init(:name => "Buyer")
    initialOwner = User.init(:name => "Owner")
    item = Item.init(:name => "normalItem", :price => 100, :owner => initialOwner, :active => true)
    user.buy_item(item) if user.buy_item?(item)
    assert(!user.sell_items.include?(item), "item is still active!")
  end

  def test_user_has_item_without_add
    user = User.init(:name => "user")
    item = Item.init(:name => "testItem", :owner => user)
    assert(item.owner == user, "user is not the owner!")
    assert(user.items.include?(item), "user doesn't have the item!")
  end

  def test_item_has_id
    user = User.init(:name => "user")
    item = Item.init(:name => "testItem", :owner => user)
    assert(item.id != nil, "ID is not correct")
  end
end
