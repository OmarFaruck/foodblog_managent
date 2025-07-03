-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 03, 2025 at 03:02 AM
-- Server version: 10.6.22-MariaDB
-- PHP Version: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mahfoozu_foodblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `user_id`, `title`, `excerpt`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'The Secret to Perfect Pasta Every Time', 'Master the art of cooking pasta like a true Italian chef with these essential tips.', 'Many home cooks struggle with pasta, ending up with either mushy or too firm results. The secret begins with using plenty of water - at least 4 quarts for a pound of pasta. Salt the water generously; it should taste like sea water. Only add pasta when the water is at a rolling boil. Most importantly, reserve some pasta water before draining. This starchy liquid is liquid gold for creating silky sauces that cling perfectly to your pasta. Remember to test for doneness frequently and aim for al dente - with a slight resistance when bitten. Finally, never rinse your pasta after cooking unless making a cold pasta salad. These simple steps will transform your pasta game forever.', 'perfect_pasta.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 2, 'Why Sourdough Baking Changed My Life', 'My journey from novice to passionate sourdough baker and how it became more than just bread.', 'Three years ago, I received a small jar of sourdough starter from a friend. Little did I know this bubbling mixture would transform not just my baking, but my entire approach to food. Sourdough baking taught me patience - you simply cannot rush fermentation. It connected me to ancient traditions spanning thousands of years across cultures. The simple ingredients (just flour, water, and salt) produced complex flavors that commercial bread could never match. Beyond flavor, maintaining my starter became a meditative daily ritual, a brief pause in my otherwise hectic schedule. The satisfaction of slicing into a loaf with perfect, honeycomb-like holes and crisp crust is incomparable. I\'ve since built connections with other bakers, farmers growing heritage grains, and neighbors who eagerly await my weekly bakes. Sourdough isn\'t just bread - it\'s a lifestyle that has enriched every aspect of my relationship with food.', 'sourdough_journey.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 3, 'Regional Italian Pasta Shapes and Their Perfect Sauces', 'Explore the fascinating world of Italian pasta and learn which sauces pair perfectly with different shapes.', 'Italy\'s pasta tradition goes far beyond spaghetti and lasagna. Each region has developed unique pasta shapes perfectly suited to local ingredients and sauce styles. In Liguria, twisted trofie pasta captures every bit of herbaceous pesto. Emilia-Romagna\'s ribbon-like tagliatelle stands up beautifully to rich, meaty Bolognese. The ear-shaped orecchiette from Puglia cups around broccoli rabe and sausage. Sicily\'s tube-like bucatini has a tiny hole running through it, perfect for soaking up simple tomato sauces while maintaining a delightful chew. The shell-like conchiglette from Campania traps creamy sauces in its gentle curves. Understanding these intentional design elements helps home cooks create more authentic Italian meals. The regional pasta shape always reflects the local sauce tradition - thick sauces need shapes with ridges or curves for clinging, while delicate sauces pair with thinner, smoother shapes. Mastering these combinations elevates any pasta dish from good to transcendent.', 'italian_pasta.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 4, 'Spices 101: Building Your Indian Spice Pantry', 'Essential spices for authentic Indian cooking and how to use them in your everyday meals.', 'The vibrant flavors of Indian cuisine come primarily from its masterful use of spices. To create authentic dishes at home, start with these fundamentals: Cumin seeds provide earthy warmth and should be toasted before grinding for maximum flavor. Turmeric adds golden color and subtle earthy notes while offering anti-inflammatory benefits. Cardamom pods, both green and black varieties, infuse dishes with intense aromatic qualities. Coriander seeds bring citrusy brightness that balances heavier flavors. Mustard seeds add pungent pops of texture when crackled in hot oil. Cinnamon, cloves, and star anise form the backbone of many garam masala blends. Fresh curry leaves, though not technically a spice, are essential for authentic South Indian dishes, imparting a unique citrus-meets-herbs flavor impossible to substitute. For heat, choose between bright red Kashmiri chilies for color with moderate heat or potent green chilies for intense spiciness. Store spices in airtight containers away from light and heat, and replace them every 6-12 months for best flavor. Master the technique of tempering (tadka) - briefly frying spices in hot oil to release their essential oils before adding other ingredients. This simple method transforms ordinary dishes into extraordinary ones with complex, layered flavors.', 'indian_spices.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 5, 'The Art of Korean Fermentation', 'Discover how traditional Korean fermentation techniques create depth of flavor and preserve seasonal ingredients.', 'Korean cuisine exemplifies the transformative power of fermentation. Beyond kimchi, numerous fermented preparations create the complex flavor profiles that make Korean food so distinctive. Doenjang (fermented soybean paste) develops over months in traditional clay pots called onggi, which allow the paste to breathe while protecting it from contaminants. The resulting umami-rich paste forms the base of countless soups and stews. Gochujang combines fermented soybeans with red chili powder, glutinous rice, and salt to create a paste that balances sweet, spicy and savory notes. Traditional sikhae preserves seasonal vegetables or seafood through lactic acid fermentation with sweet rice. The process not only extends shelf life but develops complex flavors impossible to achieve through other cooking methods. Modern Korean chefs are exploring new applications of these ancient techniques, creating innovative dishes while honoring cultural heritage. Home cooks can begin their fermentation journey with simple projects like quick kimchi or water kimchi (dongchimi), gradually building skills for more complex projects. The microbiologically rich environment of these fermented foods also offers significant health benefits, including improved digestion and immune function. Understanding these techniques connects us to food traditions that have sustained communities for thousands of years.', 'korean_fermentation.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Breakfast', 'categories/breakfast.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 'Lunch', 'categories/lunch.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 'Dinner', 'categories/dessert.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 'Dessert', 'categories/chocolate.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 'Appetizer', 'categories/dessert.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 'Soup', 'categories/lunch.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 'Salad', 'categories/meat.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 'Baking', 'categories/chocolate.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 'Vegetarian', 'categories/vegan.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 'Seafood', 'categories/meat.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `directions`
--

CREATE TABLE `directions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `step_number` int(11) NOT NULL,
  `instruction` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directions`
--

INSERT INTO `directions` (`id`, `recipe_id`, `step_number`, `instruction`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Bring a large pot of salted water to a boil. Add spaghetti and cook until al dente, about 8-10 minutes.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 1, 2, 'While pasta cooks, dice pancetta and cook in a large skillet over medium heat until crispy, about 5 minutes.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 1, 3, 'In a bowl, whisk together eggs, grated pecorino cheese, and freshly ground black pepper.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 1, 4, 'When pasta is done, reserve 1/2 cup of pasta water, then drain pasta.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 1, 5, 'Working quickly, add hot pasta to the skillet with pancetta, then remove from heat. Pour egg mixture over pasta and toss rapidly to create a creamy sauce. Add pasta water as needed to thin the sauce.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 1, 6, 'Serve immediately with additional pecorino and black pepper on top.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 2, 1, 'Prepare the pastry by combining flour, butter, and a pinch of salt until it resembles breadcrumbs. Add cold water until the dough comes together.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 2, 2, 'Roll out the pastry and line a 9-inch tart pan. Chill for 30 minutes.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 2, 3, 'Blind bake the tart shell at 350°F for 15 minutes, then remove weights and bake for another 5-10 minutes until golden.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 2, 4, 'For the caramel, heat sugar in a heavy saucepan until it turns amber. Carefully add butter and cream, stirring until smooth.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(11, 2, 5, 'Add sea salt to the caramel and pour into the cooled tart shell. Refrigerate until set.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(12, 2, 6, 'Make the ganache by pouring hot cream over chopped chocolate. Stir until smooth, then pour over the caramel layer.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(13, 2, 7, 'Refrigerate for at least 2 hours, then sprinkle with sea salt before serving.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(14, 3, 1, 'Soak rice flour and urad dal separately for 4-6 hours, then grind into a smooth batter. Ferment overnight.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(15, 3, 2, 'For the potato filling, boil potatoes until tender, then mash and set aside.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(16, 3, 3, 'Heat oil in a pan, add mustard seeds, and when they splutter, add diced onions and cook until translucent.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(17, 3, 4, 'Add turmeric, green chilies, and curry leaves to the pan, then add the mashed potatoes and mix well.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(18, 3, 5, 'Heat a flat griddle, pour a ladle of batter, and spread it into a thin circle. Drizzle oil around the edges and cook until golden.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(19, 4, 1, 'Rinse quinoa thoroughly and cook according to package instructions. Let cool.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(20, 4, 2, 'Dice cucumber, halve cherry tomatoes, and crumble feta cheese.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(21, 4, 3, 'Make the dressing by whisking together lemon juice, olive oil, minced garlic, salt, and pepper.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(22, 4, 4, 'In a large bowl, combine cooled quinoa with vegetables, feta, and dressing. Toss well and serve.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(23, 5, 1, 'In a small bowl, mix miso paste, honey, soy sauce, and a little water to create a smooth glaze.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(24, 5, 2, 'Place salmon fillets on a lined baking sheet and brush generously with the miso glaze.', 'direction-items/direction.png', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(25, 5, 3, 'Let salmon marinate with the glaze for 15-30 minutes.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(26, 5, 4, 'Preheat broiler. Broil salmon for 8-10 minutes until the glaze caramelizes and fish flakes easily with a fork.', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(27, 5, 5, 'Serve immediately with steamed rice and vegetables.', 'salmon_step5.jpg', '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Spaghetti', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 'Eggs', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 'Pancetta', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 'Pecorino Romano cheese', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 'Black pepper', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 'Butter', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 'All-purpose flour', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 'Sugar', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 'Heavy cream', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 'Dark chocolate', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(11, 'Sea salt', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(12, 'Rice flour', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(13, 'Urad dal', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(14, 'Potatoes', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(15, 'Mustard seeds', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(16, 'Coconut', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(17, 'Quinoa', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(18, 'Cucumber', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(19, 'Cherry tomatoes', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(20, 'Feta cheese', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(21, 'Lemon', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(22, 'Olive oil', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(23, 'Salmon fillets', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(24, 'Miso paste', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(25, 'Honey', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(26, 'Soy sauce', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(27, 'Sourdough starter', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(28, 'Bread flour', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(29, 'Arborio rice', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(30, 'Mozzarella cheese', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(31, 'Ground beef', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(32, 'Breadcrumbs', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(33, 'Butternut squash', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(34, 'Apple', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(35, 'Vegetable broth', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(36, 'Cinnamon', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(37, 'Chickpeas', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(38, 'Spinach', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(39, 'Coconut milk', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(40, 'Curry powder', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(41, 'Short grain rice', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(42, 'Carrots', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(43, 'Zucchini', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(44, 'Bean sprouts', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(45, 'Gochujang', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(46, 'Sesame oil', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(47, 'Lavender buds', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(48, 'Powdered sugar', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(49, 'Whole chicken', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(50, 'Fresh rosemary', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(51, 'Garlic', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(52, 'Mushrooms', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(53, 'Parmesan cheese', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(54, 'White wine', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(55, 'Cabbage', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(56, 'Red bell pepper', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(57, 'Sesame seeds', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(58, 'Fresh ginger', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(59, 'Brown rice', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(60, 'Black beans', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(61, 'Corn', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(62, 'Cheddar cheese', '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_06_23_062435_create_categories_table', 1),
(5, '2025_06_23_064209_create_recipes_table', 1),
(6, '2025_06_23_100059_create_nutrition_facts_table', 1),
(7, '2025_06_23_100727_create_ingredients_table', 1),
(8, '2025_06_23_100806_create_recipe_ingredients_table', 1),
(9, '2025_06_23_101214_create_directions_table', 1),
(10, '2025_06_23_101526_create_blogs_table', 1),
(11, '2025_06_23_101800_create_subscribers_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nutrition_facts`
--

CREATE TABLE `nutrition_facts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `calories` double DEFAULT NULL,
  `protein` double DEFAULT NULL COMMENT 'in grams',
  `fat` double DEFAULT NULL COMMENT 'in grams',
  `carbohydrates` double DEFAULT NULL COMMENT 'in grams',
  `cholesterol` double DEFAULT NULL COMMENT 'in mg',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nutrition_facts`
--

INSERT INTO `nutrition_facts` (`id`, `recipe_id`, `calories`, `protein`, `fat`, `carbohydrates`, `cholesterol`, `created_at`, `updated_at`) VALUES
(1, 1, 520, 18.5, 24, 55, 185, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 2, 450, 5.2, 30.5, 42, 120, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 3, 320, 8, 5.5, 62, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 4, 280, 9.5, 14, 32, 15, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 5, 380, 34, 22, 8.5, 85, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 6, 210, 7.2, 1, 43, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 7, 420, 12.5, 22, 42, 45, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 8, 220, 3.5, 9, 32, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 9, 350, 14, 12, 48, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 10, 520, 25, 18, 65, 190, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(11, 11, 140, 1.5, 8, 16, 60, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(12, 12, 410, 38, 24, 2, 130, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(13, 13, 380, 8, 16, 48, 15, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(14, 14, 120, 2.5, 7, 14, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(15, 15, 310, 10, 8, 48, 25, '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `recipe_image` varchar(255) DEFAULT NULL,
  `prep_time` int(11) NOT NULL,
  `cook_time` int(11) NOT NULL,
  `serving_size` int(11) NOT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `category_id`, `user_id`, `title`, `description`, `recipe_image`, `prep_time`, `cook_time`, `serving_size`, `is_featured`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'Classic Spaghetti Carbonara', 'Authentic Italian carbonara with pancetta, eggs, and pecorino cheese. No cream needed for this rich, silky pasta dish.', 'recipe-items/food-13.png', 15, 15, 4, 1, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 4, 2, 'Salted Caramel Chocolate Tart', 'Buttery shortcrust pastry filled with smooth salted caramel and topped with rich chocolate ganache.', 'recipe-items/food-14.png', 40, 30, 8, 1, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 1, 4, 'Masala Dosa with Coconut Chutney', 'Crispy fermented rice crepes filled with spiced potato filling, served with fresh coconut chutney.', 'recipe-items/food-15.png', 30, 15, 4, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 7, 4, 'Mediterranean Quinoa Salad', 'Protein-packed quinoa salad with cucumbers, tomatoes, feta cheese, and a lemon-herb dressing.', 'recipe-items/food-16.png', 20, 15, 6, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 10, 5, 'Miso Glazed Salmon', 'Flaky salmon fillets marinated in a sweet and savory miso glaze, perfect with steamed rice.', 'recipe-items/food-17.png', 10, 15, 4, 1, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 8, 2, 'Sourdough Artisan Bread', 'Crusty artisan bread with a chewy interior, using a mature sourdough starter for complex flavor.', 'recipe-items/food-18.png', 30, 45, 10, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 5, 3, 'Arancini di Riso', 'Sicilian rice balls stuffed with ragù, peas, and mozzarella, then breaded and fried until golden.', 'recipe-items/food-19.png', 60, 30, 8, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 6, 1, 'Roasted Butternut Squash Soup', 'Velvety smooth soup made with roasted butternut squash, apple, and warming spices.', 'recipe-items/food-20.png', 20, 45, 6, 1, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 9, 4, 'Chickpea Curry with Spinach', 'Creamy chickpea curry simmered with tomatoes and wilted spinach. A protein-rich vegetarian meal.', 'recipe-items/food-13.png', 15, 25, 4, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 2, 5, 'Korean Bibimbap Bowl', 'Colorful rice bowl topped with seasoned vegetables, marinated beef, and a fried egg.', 'recipe-items/food-14.png', 30, 20, 2, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(11, 4, 2, 'Lemon Lavender Shortbread', 'Buttery shortbread cookies infused with lemon zest and culinary lavender.', 'recipe-items/food-15.png', 20, 15, 24, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(12, 3, 1, 'Herb Roasted Chicken', 'Whole chicken roasted with fresh herbs, lemon, and garlic. Simple but impressive.', 'recipe-items/food-16.png', 20, 75, 6, 1, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(13, 5, 3, 'Mushroom Risotto', 'Creamy arborio rice slowly cooked with mushrooms, white wine, and parmesan cheese.', 'recipe-items/food-17.png', 15, 30, 4, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(14, 7, 5, 'Asian Slaw with Ginger Dressing', 'Crunchy cabbage slaw with carrots, bell peppers, and a zingy ginger-sesame dressing.', 'recipe-items/food-18.png', 20, 0, 8, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(15, 9, 4, 'Stuffed Bell Peppers', 'Bell peppers filled with a seasoned mixture of rice, beans, corn, and topped with cheese.', 'recipe-items/food-19.png', 25, 35, 6, 0, '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `recipe_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `ingredient_group` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `recipe_ingredients`
--

INSERT INTO `recipe_ingredients` (`id`, `recipe_id`, `ingredient_id`, `ingredient_group`) VALUES
(1, 1, 1, 'Base'),
(2, 1, 2, 'Sauce'),
(3, 1, 3, 'Sauce'),
(4, 1, 4, 'Garnish'),
(5, 1, 5, 'Seasoning'),
(6, 2, 6, 'Pastry'),
(7, 2, 7, 'Pastry'),
(8, 2, 8, 'Caramel'),
(9, 2, 9, 'Caramel'),
(10, 2, 10, 'Ganache'),
(11, 2, 11, 'Garnish'),
(12, 3, 12, 'Dosa batter'),
(13, 3, 13, 'Dosa batter'),
(14, 3, 14, 'Filling'),
(15, 3, 15, 'Filling'),
(16, 3, 16, 'Chutney'),
(17, 4, 17, 'Base'),
(18, 4, 18, 'Vegetables'),
(19, 4, 19, 'Vegetables'),
(20, 4, 20, 'Garnish'),
(21, 4, 21, 'Dressing'),
(22, 4, 22, 'Dressing'),
(23, 5, 23, 'Main'),
(24, 5, 24, 'Glaze'),
(25, 5, 25, 'Glaze'),
(26, 5, 26, 'Glaze'),
(27, 6, 27, 'Starter'),
(28, 6, 28, 'Dough'),
(29, 6, 11, 'Dough'),
(30, 7, 29, 'Base'),
(31, 7, 30, 'Filling'),
(32, 7, 31, 'Filling'),
(33, 7, 32, 'Coating'),
(34, 7, 2, 'Coating'),
(35, 8, 33, 'Main'),
(36, 8, 34, 'Main'),
(37, 8, 35, 'Base'),
(38, 8, 9, 'Finishing'),
(39, 8, 36, 'Seasoning'),
(40, 9, 37, 'Main'),
(41, 9, 38, 'Main'),
(42, 9, 39, 'Sauce'),
(43, 9, 40, 'Seasoning'),
(44, 10, 41, 'Base'),
(45, 10, 42, 'Vegetables'),
(46, 10, 43, 'Vegetables'),
(47, 10, 44, 'Vegetables'),
(48, 10, 2, 'Topping'),
(49, 10, 45, 'Sauce'),
(50, 10, 46, 'Sauce'),
(51, 11, 6, 'Dough'),
(52, 11, 7, 'Dough'),
(53, 11, 8, 'Dough'),
(54, 11, 21, 'Flavor'),
(55, 11, 47, 'Flavor'),
(56, 11, 48, 'Coating'),
(57, 12, 49, 'Main'),
(58, 12, 50, 'Seasoning'),
(59, 12, 51, 'Seasoning'),
(60, 12, 22, 'Basting'),
(61, 13, 29, 'Base'),
(62, 13, 52, 'Main'),
(63, 13, 53, 'Finishing'),
(64, 13, 54, 'Cooking liquid'),
(65, 13, 6, 'Finishing'),
(66, 14, 55, 'Base'),
(67, 14, 42, 'Vegetables'),
(68, 14, 56, 'Vegetables'),
(69, 14, 57, 'Garnish'),
(70, 14, 58, 'Dressing'),
(71, 14, 46, 'Dressing'),
(72, 15, 56, 'Shell'),
(73, 15, 59, 'Filling'),
(74, 15, 60, 'Filling'),
(75, 15, 61, 'Filling'),
(76, 15, 62, 'Topping');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('5XrmRo17732mnC1tewR9KnXle8TdjKKrdQRhUxsM', NULL, '182.163.114.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiMHBuQ0t1M1ZTdFRJSFY5enF3VGhDRVlzQTNlSk4zd1hNcG81ejJjZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDA6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbS9kYXNoYm9hcmQiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjU6ImVtYWlsIjtzOjE4OiJhZG1pbkBmb29kYmxvZy5jb20iO3M6NzoidXNlcl9pZCI7aToxO3M6NDoibmFtZSI7czoxMDoiQWRtaW4gVXNlciI7fQ==', 1751465227),
('9tfjjjGhOBFFrt4eGm8Tc7QTitod0FXAE7d08uv2', NULL, '182.163.114.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoidTVNMUNEaDhTWmFJaHpRZmt5UmVkNkkxMzV0YjYydDAzTDFNMkpDcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToiZW1haWwiO3M6MTg6ImFkbWluQGZvb2RibG9nLmNvbSI7czo3OiJ1c2VyX2lkIjtpOjE7czo0OiJuYW1lIjtzOjEwOiJBZG1pbiBVc2VyIjt9', 1751523807),
('beuUDtgYnrJOPXs7H2m9CNFUOpQfZ2MHqirelpyD', NULL, '182.163.114.215', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiU01tZFpWb1VWQVR6THdqMUJtMnhzU3l5STVXNmtVdFVibFdrbHBxUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751457614),
('CBLjJlRpfYENXqG4stcmQlVkO19TM8u7meAZh7xD', NULL, '23.27.145.249', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiUGJIRGt0N2d5ODBLbk1QWlZvOEhGTDJFQTdCd2l0eVFQRlh5N0lNQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751476276),
('ETQrNPNRCgBUv6YvMDhx2qJa6M2Pw7beic9hop2p', NULL, '23.27.145.76', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidm84d2JJSUhRcExZNVpXWTRiNmsyeXQ0dHlvMXIyNkZ4NlJHZFo4eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmZvb2RibG9nLmxhcmF2ZWxjcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1751476137),
('Gl3Y5B1DXfFlEhun0IZHCzJ2c5p6l3o4LFVXagid', NULL, '23.27.145.129', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoic0ZIZzdXOFpMalFta2N5dWdoZkZYanY2RnNNRXd1N2pZck9zVkNwYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzQ6Imh0dHBzOi8vd3d3LmZvb2RibG9nLmxhcmF2ZWxjcy5jb20iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1751471438),
('kdyeFHpuoRcccK9HPVVe1ndfXm5gJfyTCxSqKx87', NULL, '149.57.180.81', 'Mozilla/5.0 (X11; Linux i686; rv:109.0) Gecko/20100101 Firefox/120.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3ROZmV0Q3FrbVBvdHhXV0pUd2VzZHhLeE13OHA2RVRYdjd4ZmdmaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1751471487),
('tunIk12umgC0zVaGw7zfUwstmwZBbJFwacyIGR7I', NULL, '103.136.159.201', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiZUNra2VJeTBRb3lmTm9tME90ank1T3VZdzUzdUhHODVrNmUxYVRCUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHBzOi8vZm9vZGJsb2cubGFyYXZlbGNzLmNvbS9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToiZW1haWwiO3M6MTg6ImFkbWluQGZvb2RibG9nLmNvbSI7czo3OiJ1c2VyX2lkIjtpOjE7czo0OiJuYW1lIjtzOjEwOiJBZG1pbiBVc2VyIjt9', 1751472686);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subscribers`
--

INSERT INTO `subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'john.smith@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 'maria.rodriguez@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 'alex.jones@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 'sarah.williams@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 'mohammed.ali@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(6, 'emma.thompson@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(7, 'james.wilson@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(8, 'olivia.brown@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(9, 'michael.davis@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(10, 'sophia.miller@example.com', '2025-06-24 07:52:27', '2025-06-24 07:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `bio` varchar(255) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `bio`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@foodblog.com', '2025-06-24 07:52:27', '$2y$12$H/uZYrrw/lW3w8RfPrt./.jTLjAy.AkRwAhII4uNnecq47frVztLG', 'admin.jpg', 'Food blog administrator and professional chef with 10 years of culinary experience.', 'admin', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(2, 'Julia Chen', 'julia@foodblog.com', '2025-06-24 07:52:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'julia.jpg', 'Pastry chef specializing in French desserts and Asian fusion cuisine.', 'user', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(3, 'Marco Rossi', 'marco@foodblog.com', '2025-06-24 07:52:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'marco.jpg', 'Italian home cook sharing family recipes passed down for generations.', 'user', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(4, 'Priya Patel', 'priya@foodblog.com', '2025-06-24 07:52:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'priya.jpg', 'Vegetarian food enthusiast specializing in modern Indian cuisine.', 'user', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27'),
(5, 'David Kim', 'david@foodblog.com', '2025-06-24 07:52:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'david.jpg', 'Culinary school graduate passionate about Korean-American fusion dishes.', 'user', NULL, '2025-06-24 07:52:27', '2025-06-24 07:52:27');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `directions`
--
ALTER TABLE `directions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directions_recipe_id_foreign` (`recipe_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nutrition_facts`
--
ALTER TABLE `nutrition_facts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `nutrition_facts_recipe_id_foreign` (`recipe_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_category_id_foreign` (`category_id`),
  ADD KEY `recipes_user_id_foreign` (`user_id`);

--
-- Indexes for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_ingredients_recipe_id_foreign` (`recipe_id`),
  ADD KEY `recipe_ingredients_ingredient_id_foreign` (`ingredient_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `directions`
--
ALTER TABLE `directions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ingredients`
--
ALTER TABLE `ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `nutrition_facts`
--
ALTER TABLE `nutrition_facts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `directions`
--
ALTER TABLE `directions`
  ADD CONSTRAINT `directions_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `nutrition_facts`
--
ALTER TABLE `nutrition_facts`
  ADD CONSTRAINT `nutrition_facts_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `recipes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recipe_ingredients`
--
ALTER TABLE `recipe_ingredients`
  ADD CONSTRAINT `recipe_ingredients_ingredient_id_foreign` FOREIGN KEY (`ingredient_id`) REFERENCES `ingredients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recipe_ingredients_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
