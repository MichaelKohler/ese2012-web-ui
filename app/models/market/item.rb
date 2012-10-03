module Market

  class Item
    # Items have a name
    # Items have a price.
    # An item can be active or inactive.
    # An item has an owner.

    attr_accessor :id, :name, :price, :owner, :active

    @@item_id_counter = 0

    # constructor - give a name to the item and set a specified price
    # @param [Object] params - dictionary of symbols
    def self.init(params={})
      item = self.new
      item.id = @@item_id_counter
      item.name = params[:name] || "default item"
      item.price = params[:price] || 0
      item.active = params[:active] || false
      item.owner = params[:owner]
      params[:owner].items << item if params[:owner]
      @@item_id_counter += 1
      item
    end

    # activate the item
    def activate
      self.active = true
    end

    # deactivate the item
    def inactivate
      self.active = false
    end
  end
end
