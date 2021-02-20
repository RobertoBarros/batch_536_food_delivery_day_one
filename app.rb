require 'csv'

require_relative 'router'

require_relative 'app/models/meal'
require_relative 'app/models/customer'
require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/customers_controller'

meal_repository = MealRepository.new('data/meals.csv')
customer_repository = CustomerRepository.new('data/customers.csv')

customers_controller = CustomersController.new(customer_repository)
meals_controller = MealsController.new(meal_repository)

router = Router.new(meals_controller, customers_controller)
router.run
