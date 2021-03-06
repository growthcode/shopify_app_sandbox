class TagCustomers
  attr_accessor :shop_url

  # Configure the Shopify connection
  def initialize
    @shop_url = "http://#{ENV["SHOPIFY_API_KEY"]}:#{ENV["SHOPIFY_PASSWORD"]}@#{ENV["SHOP"]}.myshopify.com/admin"
    ShopifyAPI::Base.site = @shop_url
  end

  # Tests the Shopify connection with a simple GET request
  def test_connection
    return ShopifyAPI::Shop.current
  end
end

# Called when the file is run on the command line, but not in a require
if __FILE__ == $PROGRAM_NAME
  puts TagCustomers.new.test_connection.inspect # Prints the result
end
