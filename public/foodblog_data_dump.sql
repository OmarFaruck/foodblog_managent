INSERT INTO categories (name, icon, created_at, updated_at) VALUES 
('Breakfast', 'breakfast.svg', NOW(), NOW()),
('Lunch', 'lunch.svg', NOW(), NOW()),
('Dinner', 'dinner.svg', NOW(), NOW()),
('Dessert', 'dessert.svg', NOW(), NOW()),
('Appetizer', 'appetizer.svg', NOW(), NOW()),
('Soup', 'soup.svg', NOW(), NOW()),
('Salad', 'salad.svg', NOW(), NOW()),
('Baking', 'baking.svg', NOW(), NOW()),
('Vegetarian', 'vegetarian.svg', NOW(), NOW()),
('Seafood', 'seafood.svg', NOW(), NOW());

INSERT INTO users (name, email, email_verified_at, password, avatar, bio, role, created_at, updated_at) VALUES
('Admin User', 'admin@foodblog.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin.jpg', 'Food blog administrator and professional chef with 10 years of culinary experience.', 'admin', NOW(), NOW()),
('Julia Chen', 'julia@foodblog.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'julia.jpg', 'Pastry chef specializing in French desserts and Asian fusion cuisine.', 'user', NOW(), NOW()),
('Marco Rossi', 'marco@foodblog.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'marco.jpg', 'Italian home cook sharing family recipes passed down for generations.', 'user', NOW(), NOW()),
('Priya Patel', 'priya@foodblog.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'priya.jpg', 'Vegetarian food enthusiast specializing in modern Indian cuisine.', 'user', NOW(), NOW()),
('David Kim', 'david@foodblog.com', NOW(), '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'david.jpg', 'Culinary school graduate passionate about Korean-American fusion dishes.', 'user', NOW(), NOW());

INSERT INTO recipes (category_id, user_id, title, description, recipe_image, prep_time, cook_time, serving_size, is_featured, created_at, updated_at) VALUES
(3, 3, 'Classic Spaghetti Carbonara', 'Authentic Italian carbonara with pancetta, eggs, and pecorino cheese. No cream needed for this rich, silky pasta dish.', 'carbonara.jpg', 15, 15, 4, true, NOW(), NOW()),
(4, 2, 'Salted Caramel Chocolate Tart', 'Buttery shortcrust pastry filled with smooth salted caramel and topped with rich chocolate ganache.', 'chocolate_tart.jpg', 40, 30, 8, true, NOW(), NOW()),
(1, 4, 'Masala Dosa with Coconut Chutney', 'Crispy fermented rice crepes filled with spiced potato filling, served with fresh coconut chutney.', 'masala_dosa.jpg', 30, 15, 4, false, NOW(), NOW()),
(7, 4, 'Mediterranean Quinoa Salad', 'Protein-packed quinoa salad with cucumbers, tomatoes, feta cheese, and a lemon-herb dressing.', 'quinoa_salad.jpg', 20, 15, 6, false, NOW(), NOW()),
(10, 5, 'Miso Glazed Salmon', 'Flaky salmon fillets marinated in a sweet and savory miso glaze, perfect with steamed rice.', 'miso_salmon.jpg', 10, 15, 4, true, NOW(), NOW()),
(8, 2, 'Sourdough Artisan Bread', 'Crusty artisan bread with a chewy interior, using a mature sourdough starter for complex flavor.', 'sourdough.jpg', 30, 45, 10, false, NOW(), NOW()),
(5, 3, 'Arancini di Riso', 'Sicilian rice balls stuffed with ragù, peas, and mozzarella, then breaded and fried until golden.', 'arancini.jpg', 60, 30, 8, false, NOW(), NOW()),
(6, 1, 'Roasted Butternut Squash Soup', 'Velvety smooth soup made with roasted butternut squash, apple, and warming spices.', 'squash_soup.jpg', 20, 45, 6, true, NOW(), NOW()),
(9, 4, 'Chickpea Curry with Spinach', 'Creamy chickpea curry simmered with tomatoes and wilted spinach. A protein-rich vegetarian meal.', 'chickpea_curry.jpg', 15, 25, 4, false, NOW(), NOW()),
(2, 5, 'Korean Bibimbap Bowl', 'Colorful rice bowl topped with seasoned vegetables, marinated beef, and a fried egg.', 'bibimbap.jpg', 30, 20, 2, false, NOW(), NOW()),
(4, 2, 'Lemon Lavender Shortbread', 'Buttery shortbread cookies infused with lemon zest and culinary lavender.', 'shortbread.jpg', 20, 15, 24, false, NOW(), NOW()),
(3, 1, 'Herb Roasted Chicken', 'Whole chicken roasted with fresh herbs, lemon, and garlic. Simple but impressive.', 'roast_chicken.jpg', 20, 75, 6, true, NOW(), NOW()),
(5, 3, 'Mushroom Risotto', 'Creamy arborio rice slowly cooked with mushrooms, white wine, and parmesan cheese.', 'risotto.jpg', 15, 30, 4, false, NOW(), NOW()),
(7, 5, 'Asian Slaw with Ginger Dressing', 'Crunchy cabbage slaw with carrots, bell peppers, and a zingy ginger-sesame dressing.', 'asian_slaw.jpg', 20, 0, 8, false, NOW(), NOW()),
(9, 4, 'Stuffed Bell Peppers', 'Bell peppers filled with a seasoned mixture of rice, beans, corn, and topped with cheese.', 'stuffed_peppers.jpg', 25, 35, 6, false, NOW(), NOW());

INSERT INTO nutrition_facts (recipe_id, calories, protein, fat, carbohydrates, cholesterol, created_at, updated_at) VALUES
(1, 520, 18.5, 24.0, 55.0, 185, NOW(), NOW()),
(2, 450, 5.2, 30.5, 42.0, 120, NOW(), NOW()),
(3, 320, 8.0, 5.5, 62.0, 0, NOW(), NOW()),
(4, 280, 9.5, 14.0, 32.0, 15, NOW(), NOW()),
(5, 380, 34.0, 22.0, 8.5, 85, NOW(), NOW()),
(6, 210, 7.2, 1.0, 43.0, 0, NOW(), NOW()),
(7, 420, 12.5, 22.0, 42.0, 45, NOW(), NOW()),
(8, 220, 3.5, 9.0, 32.0, 0, NOW(), NOW()),
(9, 350, 14.0, 12.0, 48.0, 0, NOW(), NOW()),
(10, 520, 25.0, 18.0, 65.0, 190, NOW(), NOW()),
(11, 140, 1.5, 8.0, 16.0, 60, NOW(), NOW()),
(12, 410, 38.0, 24.0, 2.0, 130, NOW(), NOW()),
(13, 380, 8.0, 16.0, 48.0, 15, NOW(), NOW()),
(14, 120, 2.5, 7.0, 14.0, 0, NOW(), NOW()),
(15, 310, 10.0, 8.0, 48.0, 25, NOW(), NOW());

INSERT INTO ingredients (name, created_at, updated_at) VALUES
('Spaghetti', NOW(), NOW()),
('Eggs', NOW(), NOW()),
('Pancetta', NOW(), NOW()),
('Pecorino Romano cheese', NOW(), NOW()),
('Black pepper', NOW(), NOW()),
('Butter', NOW(), NOW()),
('All-purpose flour', NOW(), NOW()),
('Sugar', NOW(), NOW()),
('Heavy cream', NOW(), NOW()),
('Dark chocolate', NOW(), NOW()),
('Sea salt', NOW(), NOW()),
('Rice flour', NOW(), NOW()),
('Urad dal', NOW(), NOW()),
('Potatoes', NOW(), NOW()),
('Mustard seeds', NOW(), NOW()),
('Coconut', NOW(), NOW()),
('Quinoa', NOW(), NOW()),
('Cucumber', NOW(), NOW()),
('Cherry tomatoes', NOW(), NOW()),
('Feta cheese', NOW(), NOW()),
('Lemon', NOW(), NOW()),
('Olive oil', NOW(), NOW()),
('Salmon fillets', NOW(), NOW()),
('Miso paste', NOW(), NOW()),
('Honey', NOW(), NOW()),
('Soy sauce', NOW(), NOW()),
('Sourdough starter', NOW(), NOW()),
('Bread flour', NOW(), NOW()),
('Arborio rice', NOW(), NOW()),
('Mozzarella cheese', NOW(), NOW()),
('Ground beef', NOW(), NOW()),
('Breadcrumbs', NOW(), NOW()),
('Butternut squash', NOW(), NOW()),
('Apple', NOW(), NOW()),
('Vegetable broth', NOW(), NOW()),
('Cinnamon', NOW(), NOW()),
('Chickpeas', NOW(), NOW()),
('Spinach', NOW(), NOW()),
('Coconut milk', NOW(), NOW()),
('Curry powder', NOW(), NOW()),
('Short grain rice', NOW(), NOW()),
('Carrots', NOW(), NOW()),
('Zucchini', NOW(), NOW()),
('Bean sprouts', NOW(), NOW()),
('Gochujang', NOW(), NOW()),
('Sesame oil', NOW(), NOW()),
('Lavender buds', NOW(), NOW()),
('Powdered sugar', NOW(), NOW()),
('Whole chicken', NOW(), NOW()),
('Fresh rosemary', NOW(), NOW()),
('Garlic', NOW(), NOW()),
('Mushrooms', NOW(), NOW()),
('Parmesan cheese', NOW(), NOW()),
('White wine', NOW(), NOW()),
('Cabbage', NOW(), NOW()),
('Red bell pepper', NOW(), NOW()),
('Sesame seeds', NOW(), NOW()),
('Fresh ginger', NOW(), NOW()),
('Brown rice', NOW(), NOW()),
('Black beans', NOW(), NOW()),
('Corn', NOW(), NOW()),
('Cheddar cheese', NOW(), NOW());

INSERT INTO recipe_ingredients (recipe_id, ingredient_id, ingredient_group) VALUES
-- Recipe 1: Classic Spaghetti Carbonara
(1, 1, 'Base'),
(1, 2, 'Sauce'),
(1, 3, 'Sauce'),
(1, 4, 'Garnish'),
(1, 5, 'Seasoning'),

-- Recipe 2: Salted Caramel Chocolate Tart
(2, 6, 'Pastry'),
(2, 7, 'Pastry'),
(2, 8, 'Caramel'),
(2, 9, 'Caramel'),
(2, 10, 'Ganache'),
(2, 11, 'Garnish'),

-- Recipe 3: Masala Dosa
(3, 12, 'Dosa batter'),
(3, 13, 'Dosa batter'),
(3, 14, 'Filling'),
(3, 15, 'Filling'),
(3, 16, 'Chutney'),

-- Recipe 4: Mediterranean Quinoa Salad
(4, 17, 'Base'),
(4, 18, 'Vegetables'),
(4, 19, 'Vegetables'),
(4, 20, 'Garnish'),
(4, 21, 'Dressing'),
(4, 22, 'Dressing'),

-- Recipe 5: Miso Glazed Salmon
(5, 23, 'Main'),
(5, 24, 'Glaze'),
(5, 25, 'Glaze'),
(5, 26, 'Glaze'),

-- Recipe 6: Sourdough Artisan Bread
(6, 27, 'Starter'),
(6, 28, 'Dough'),
(6, 11, 'Dough'),

-- Recipe 7: Arancini di Riso
(7, 29, 'Base'),
(7, 30, 'Filling'),
(7, 31, 'Filling'),
(7, 32, 'Coating'),
(7, 2, 'Coating'),

-- Recipe 8: Roasted Butternut Squash Soup
(8, 33, 'Main'),
(8, 34, 'Main'),
(8, 35, 'Base'),
(8, 9, 'Finishing'),
(8, 36, 'Seasoning'),

-- Recipe 9: Chickpea Curry with Spinach
(9, 37, 'Main'),
(9, 38, 'Main'),
(9, 39, 'Sauce'),
(9, 40, 'Seasoning'),

-- Recipe 10: Korean Bibimbap Bowl
(10, 41, 'Base'),
(10, 42, 'Vegetables'),
(10, 43, 'Vegetables'),
(10, 44, 'Vegetables'),
(10, 2, 'Topping'),
(10, 45, 'Sauce'),
(10, 46, 'Sauce'),

-- Recipe 11: Lemon Lavender Shortbread
(11, 6, 'Dough'),
(11, 7, 'Dough'),
(11, 8, 'Dough'),
(11, 21, 'Flavor'),
(11, 47, 'Flavor'),
(11, 48, 'Coating'),

-- Recipe 12: Herb Roasted Chicken
(12, 49, 'Main'),
(12, 50, 'Seasoning'),
(12, 51, 'Seasoning'),
(12, 22, 'Basting'),

-- Recipe 13: Mushroom Risotto
(13, 29, 'Base'),
(13, 52, 'Main'),
(13, 53, 'Finishing'),
(13, 54, 'Cooking liquid'),
(13, 6, 'Finishing'),

-- Recipe 14: Asian Slaw with Ginger Dressing
(14, 55, 'Base'),
(14, 42, 'Vegetables'),
(14, 56, 'Vegetables'),
(14, 57, 'Garnish'),
(14, 58, 'Dressing'),
(14, 46, 'Dressing'),

-- Recipe 15: Stuffed Bell Peppers
(15, 56, 'Shell'),
(15, 59, 'Filling'),
(15, 60, 'Filling'),
(15, 61, 'Filling'),
(15, 62, 'Topping');

INSERT INTO directions (recipe_id, step_number, instruction, image, created_at, updated_at) VALUES
-- Recipe 1: Classic Spaghetti Carbonara
(1, 1, 'Bring a large pot of salted water to a boil. Add spaghetti and cook until al dente, about 8-10 minutes.', NULL, NOW(), NOW()),
(1, 2, 'While pasta cooks, dice pancetta and cook in a large skillet over medium heat until crispy, about 5 minutes.', 'carbonara_step2.jpg', NOW(), NOW()),
(1, 3, 'In a bowl, whisk together eggs, grated pecorino cheese, and freshly ground black pepper.', NULL, NOW(), NOW()),
(1, 4, 'When pasta is done, reserve 1/2 cup of pasta water, then drain pasta.', NULL, NOW(), NOW()),
(1, 5, 'Working quickly, add hot pasta to the skillet with pancetta, then remove from heat. Pour egg mixture over pasta and toss rapidly to create a creamy sauce. Add pasta water as needed to thin the sauce.', 'carbonara_step5.jpg', NOW(), NOW()),
(1, 6, 'Serve immediately with additional pecorino and black pepper on top.', NULL, NOW(), NOW()),

-- Recipe 2: Salted Caramel Chocolate Tart
(2, 1, 'Prepare the pastry by combining flour, butter, and a pinch of salt until it resembles breadcrumbs. Add cold water until the dough comes together.', NULL, NOW(), NOW()),
(2, 2, 'Roll out the pastry and line a 9-inch tart pan. Chill for 30 minutes.', 'tart_step2.jpg', NOW(), NOW()),
(2, 3, 'Blind bake the tart shell at 350°F for 15 minutes, then remove weights and bake for another 5-10 minutes until golden.', NULL, NOW(), NOW()),
(2, 4, 'For the caramel, heat sugar in a heavy saucepan until it turns amber. Carefully add butter and cream, stirring until smooth.', 'tart_step4.jpg', NOW(), NOW()),
(2, 5, 'Add sea salt to the caramel and pour into the cooled tart shell. Refrigerate until set.', NULL, NOW(), NOW()),
(2, 6, 'Make the ganache by pouring hot cream over chopped chocolate. Stir until smooth, then pour over the caramel layer.', NULL, NOW(), NOW()),
(2, 7, 'Refrigerate for at least 2 hours, then sprinkle with sea salt before serving.', NULL, NOW(), NOW()),

-- Recipe 3: Masala Dosa (just first 5 steps)
(3, 1, 'Soak rice flour and urad dal separately for 4-6 hours, then grind into a smooth batter. Ferment overnight.', 'dosa_step1.jpg', NOW(), NOW()),
(3, 2, 'For the potato filling, boil potatoes until tender, then mash and set aside.', NULL, NOW(), NOW()),
(3, 3, 'Heat oil in a pan, add mustard seeds, and when they splutter, add diced onions and cook until translucent.', NULL, NOW(), NOW()),
(3, 4, 'Add turmeric, green chilies, and curry leaves to the pan, then add the mashed potatoes and mix well.', 'dosa_step4.jpg', NOW(), NOW()),
(3, 5, 'Heat a flat griddle, pour a ladle of batter, and spread it into a thin circle. Drizzle oil around the edges and cook until golden.', NULL, NOW(), NOW()),

-- Recipe 4: Mediterranean Quinoa Salad (first 4 steps)
(4, 1, 'Rinse quinoa thoroughly and cook according to package instructions. Let cool.', NULL, NOW(), NOW()),
(4, 2, 'Dice cucumber, halve cherry tomatoes, and crumble feta cheese.', 'quinoa_step2.jpg', NOW(), NOW()),
(4, 3, 'Make the dressing by whisking together lemon juice, olive oil, minced garlic, salt, and pepper.', NULL, NOW(), NOW()),
(4, 4, 'In a large bowl, combine cooled quinoa with vegetables, feta, and dressing. Toss well and serve.', NULL, NOW(), NOW()),

-- Recipe 5: Miso Glazed Salmon (first 5 steps)
(5, 1, 'In a small bowl, mix miso paste, honey, soy sauce, and a little water to create a smooth glaze.', NULL, NOW(), NOW()),
(5, 2, 'Place salmon fillets on a lined baking sheet and brush generously with the miso glaze.', 'salmon_step2.jpg', NOW(), NOW()),
(5, 3, 'Let salmon marinate with the glaze for 15-30 minutes.', NULL, NOW(), NOW()),
(5, 4, 'Preheat broiler. Broil salmon for 8-10 minutes until the glaze caramelizes and fish flakes easily with a fork.', NULL, NOW(), NOW()),
(5, 5, 'Serve immediately with steamed rice and vegetables.', 'salmon_step5.jpg', NOW(), NOW());

INSERT INTO blogs (user_id, title, excerpt, content, image, created_at, updated_at) VALUES
(1, 'The Secret to Perfect Pasta Every Time', 'Master the art of cooking pasta like a true Italian chef with these essential tips.', 'Many home cooks struggle with pasta, ending up with either mushy or too firm results. The secret begins with using plenty of water - at least 4 quarts for a pound of pasta. Salt the water generously; it should taste like sea water. Only add pasta when the water is at a rolling boil. Most importantly, reserve some pasta water before draining. This starchy liquid is liquid gold for creating silky sauces that cling perfectly to your pasta. Remember to test for doneness frequently and aim for al dente - with a slight resistance when bitten. Finally, never rinse your pasta after cooking unless making a cold pasta salad. These simple steps will transform your pasta game forever.', 'perfect_pasta.jpg', NOW(), NOW()),

(2, 'Why Sourdough Baking Changed My Life', 'My journey from novice to passionate sourdough baker and how it became more than just bread.', 'Three years ago, I received a small jar of sourdough starter from a friend. Little did I know this bubbling mixture would transform not just my baking, but my entire approach to food. Sourdough baking taught me patience - you simply cannot rush fermentation. It connected me to ancient traditions spanning thousands of years across cultures. The simple ingredients (just flour, water, and salt) produced complex flavors that commercial bread could never match. Beyond flavor, maintaining my starter became a meditative daily ritual, a brief pause in my otherwise hectic schedule. The satisfaction of slicing into a loaf with perfect, honeycomb-like holes and crisp crust is incomparable. I\'ve since built connections with other bakers, farmers growing heritage grains, and neighbors who eagerly await my weekly bakes. Sourdough isn\'t just bread - it\'s a lifestyle that has enriched every aspect of my relationship with food.', 'sourdough_journey.jpg', NOW(), NOW()),

(3, 'Regional Italian Pasta Shapes and Their Perfect Sauces', 'Explore the fascinating world of Italian pasta and learn which sauces pair perfectly with different shapes.', 'Italy\'s pasta tradition goes far beyond spaghetti and lasagna. Each region has developed unique pasta shapes perfectly suited to local ingredients and sauce styles. In Liguria, twisted trofie pasta captures every bit of herbaceous pesto. Emilia-Romagna\'s ribbon-like tagliatelle stands up beautifully to rich, meaty Bolognese. The ear-shaped orecchiette from Puglia cups around broccoli rabe and sausage. Sicily\'s tube-like bucatini has a tiny hole running through it, perfect for soaking up simple tomato sauces while maintaining a delightful chew. The shell-like conchiglette from Campania traps creamy sauces in its gentle curves. Understanding these intentional design elements helps home cooks create more authentic Italian meals. The regional pasta shape always reflects the local sauce tradition - thick sauces need shapes with ridges or curves for clinging, while delicate sauces pair with thinner, smoother shapes. Mastering these combinations elevates any pasta dish from good to transcendent.', 'italian_pasta.jpg', NOW(), NOW()),

(4, 'Spices 101: Building Your Indian Spice Pantry', 'Essential spices for authentic Indian cooking and how to use them in your everyday meals.', 'The vibrant flavors of Indian cuisine come primarily from its masterful use of spices. To create authentic dishes at home, start with these fundamentals: Cumin seeds provide earthy warmth and should be toasted before grinding for maximum flavor. Turmeric adds golden color and subtle earthy notes while offering anti-inflammatory benefits. Cardamom pods, both green and black varieties, infuse dishes with intense aromatic qualities. Coriander seeds bring citrusy brightness that balances heavier flavors. Mustard seeds add pungent pops of texture when crackled in hot oil. Cinnamon, cloves, and star anise form the backbone of many garam masala blends. Fresh curry leaves, though not technically a spice, are essential for authentic South Indian dishes, imparting a unique citrus-meets-herbs flavor impossible to substitute. For heat, choose between bright red Kashmiri chilies for color with moderate heat or potent green chilies for intense spiciness. Store spices in airtight containers away from light and heat, and replace them every 6-12 months for best flavor. Master the technique of tempering (tadka) - briefly frying spices in hot oil to release their essential oils before adding other ingredients. This simple method transforms ordinary dishes into extraordinary ones with complex, layered flavors.', 'indian_spices.jpg', NOW(), NOW()),

(5, 'The Art of Korean Fermentation', 'Discover how traditional Korean fermentation techniques create depth of flavor and preserve seasonal ingredients.', 'Korean cuisine exemplifies the transformative power of fermentation. Beyond kimchi, numerous fermented preparations create the complex flavor profiles that make Korean food so distinctive. Doenjang (fermented soybean paste) develops over months in traditional clay pots called onggi, which allow the paste to breathe while protecting it from contaminants. The resulting umami-rich paste forms the base of countless soups and stews. Gochujang combines fermented soybeans with red chili powder, glutinous rice, and salt to create a paste that balances sweet, spicy and savory notes. Traditional sikhae preserves seasonal vegetables or seafood through lactic acid fermentation with sweet rice. The process not only extends shelf life but develops complex flavors impossible to achieve through other cooking methods. Modern Korean chefs are exploring new applications of these ancient techniques, creating innovative dishes while honoring cultural heritage. Home cooks can begin their fermentation journey with simple projects like quick kimchi or water kimchi (dongchimi), gradually building skills for more complex projects. The microbiologically rich environment of these fermented foods also offers significant health benefits, including improved digestion and immune function. Understanding these techniques connects us to food traditions that have sustained communities for thousands of years.', 'korean_fermentation.jpg', NOW(), NOW());

INSERT INTO subscribers (email, created_at, updated_at) VALUES
('john.smith@example.com', NOW(), NOW()),
('maria.rodriguez@example.com', NOW(), NOW()),
('alex.jones@example.com', NOW(), NOW()),
('sarah.williams@example.com', NOW(), NOW()),
('mohammed.ali@example.com', NOW(), NOW()),
('emma.thompson@example.com', NOW(), NOW()),
('james.wilson@example.com', NOW(), NOW()),
('olivia.brown@example.com', NOW(), NOW()),
('michael.davis@example.com', NOW(), NOW()),
('sophia.miller@example.com', NOW(), NOW());