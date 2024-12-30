puts "Clearing existing data..."
CartItem.destroy_all
Cart.destroy_all
Order.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all
OrderStatus.destroy_all
PaymentMethod.destroy_all

puts "Creating Users..."
admin = User.create!(email: "admin@example.com", password: "password", role: "admin")
customer = User.create!(email: "customer@example.com", password: "password", role: "customer")

puts "Creating Categories..."
electronics = Category.create!(name: "Electronics")
clothing = Category.create!(name: "Clothing")
books = Category.create!(name: "Books")

puts "Creating Products..."
product1 = Product.create!(
  name: "Smartphone",
  description: "High-end smartphone with 128GB storage.",
  price: 699.99,
  stock: 50,
  category: electronics
)

product2 = Product.create!(
  name: "T-shirt",
  description: "Comfortable cotton t-shirt.",
  price: 19.99,
  stock: 100,
  category: clothing
)

product3 = Product.create!(
  name: "Ruby Programming Book",
  description: "Learn Ruby with hands-on projects.",
  price: 39.99,
  stock: 30,
  category: books
)

puts "Creating Shipping Address..."
shipping_address = customer.shipping_addresses.create!(
  street: "123 Main St",
  city: "New York",
  state: "NY",
  postal_code: "10001",
  country: "USA"
)

puts "Creating Order Statuses..."
pending = OrderStatus.create!(name: "Pending")
shipped = OrderStatus.create!(name: "Shipped")

puts "Creating Orders..."
order1 = Order.create!(
  user: customer,
  order_status: pending,  
  total_price: product1.price,
  status: "Pending"       
)

puts "Creating Payment Methods..."
payment_method = PaymentMethod.create!(
  order: order1,
  method: "Credit Card",
  details: "Visa ending in 4242"
)

puts "Adding Products to Order..."
order1.cart_items.create!(
  product: product1,
  quantity: 1,
  price: product1.price
)

puts "Setting up Cart for Customer..."
cart = Cart.create!(user: customer)

cart.cart_items.create!(
  product: product2,
  quantity: 2,
  price: product2.price
)

cart.cart_items.create!(
  product: product3,
  quantity: 1,
  price: product3.price
)

puts "Seeding completed successfully!"









puts "Clearing existing data..."
CartItem.destroy_all
Cart.destroy_all
PaymentMethod.destroy_all
Order.destroy_all
ShippingAddress.destroy_all
OrderStatus.destroy_all
Product.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating Users..."
admin = User.create!(email: "admin@example.com", password: "password", role: "admin")
customer = User.create!(email: "customer@example.com", password: "password", role: "customer")

puts "Creating Categories..."
electronics = Category.create!(name: "Electronics")
clothing = Category.create!(name: "Clothing")
books = Category.create!(name: "Books")

puts "Creating Products..."
product1 = Product.create!(
  name: "Smartphone",
  description: "High-end smartphone with 128GB storage.",
  price: 699.99,
  stock: 50,
  category: electronics
)

product2 = Product.create!(
  name: "T-shirt",
  description: "Comfortable cotton t-shirt.",
  price: 19.99,
  stock: 100,
  category: clothing
)

product3 = Product.create!(
  name: "Ruby Programming Book",
  description: "Learn Ruby with hands-on projects.",
  price: 39.99,
  stock: 30,
  category: books
)

puts "Creating Order Statuses..."
pending = OrderStatus.create!(name: "Pending")
shipped = OrderStatus.create!(name: "Shipped")

puts "Creating Shipping Address..."
shipping_address = customer.shipping_addresses.create!(
  street: "123 Main St",
  city: "New York",
  state: "NY",
  postal_code: "10001",
  country: "USA"
)

puts "Creating Orders..."
order1 = Order.create!(
  user: customer,
  order_status: pending,
  total_price: product1.price,
  status: "Pending"
)

puts "Creating Payment Methods..."
payment_method = PaymentMethod.create!(
  order: order1,
  method: "Credit Card",
  details: "Visa ending in 4242"
)

puts "Adding Products to Order..."
order1.cart_items.create!(
  product: product1,
  quantity: 1,
  price: product1.price
)

puts "Setting up Cart for Customer..."
cart = Cart.create!(user: customer)

cart.cart_items.create!(
  product: product2,
  quantity: 2,
  price: product2.price
)

cart.cart_items.create!(
  product: product3,
  quantity: 1,
  price: product3.price
)

PaymentMethod.create([{ method: 'Credit Card' }, { method: 'PayPal' }, { method: 'Cash on Delivery' }])


puts "Seeding completed successfully!"
