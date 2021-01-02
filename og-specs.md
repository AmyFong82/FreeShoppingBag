# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project 
		(A) I am using the rails gem.

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
		(A) Party has_many users.

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
		(A) Drinks belongs_to Party.

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
		(A) User has_many Snacks through Parties, Food has_many Users through Parties.

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
		(A) User has_many Snacks through Parties, Snack has_many Users through Parties.

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
		(A) User can submit party.name, party.date, party.location.
		
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
		(A) Added validations to all models.

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
	(A) User.name, User.num_of_parties
	Not done yet!!

- [x] Include signup
	(A) User can signup at "/signup"

- [x] Include login
	(A) User can login at '/login'

- [x] Include logout
	(A) User can logout
	
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)


- [x] Include nested resource show or index (URL e.g. users/2/recipes)
	(A) nested resource show: users/1/parties/5

- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)


- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate