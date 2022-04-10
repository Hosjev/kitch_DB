DROP TABLE IF EXISTS booze;
DROP TABLE IF EXISTS boozeless;
DROP TABLE IF EXISTS drink_other;
DROP TABLE IF EXISTS drink_other_cats;
DROP TABLE IF EXISTS be_drinks;

CREATE TABLE booze (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE boozeless (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE drink_other_cats (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  priority INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE drink_other (
  id SERIAL PRIMARY KEY,
  name VARCHAR(100) UNIQUE NOT NULL,
  cat_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(cat_id) REFERENCES drink_other_cats(id)
);

CREATE TABLE be_drinks(
  id SERIAL PRIMARY KEY,
  drink_id INTEGER NOT NULL,
  name VARCHAR(100) NOT NULL,
  type VARCHAR(100) NOT NULL,
  container VARCHAR(100),
  image VARCHAR(100) NOT NULL,
  instructions TEXT NOT NULL,
  ingredients JSON NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

GRANT SELECT ON booze, boozeless, drink_other, drink_other_cats, be_drinks TO flask_query;

INSERT INTO booze (name) VALUES
  ('151 Proof Rum'),
  ('Absinthe'),
  ('Absolut Citron'),
  ('Absolut Kurant'),
  ('Absolut Peppar'),
  ('Absolut Vodka'),
  ('Advocaat'),
  ('Ale'),
  ('Amaretto'),
  ('Amaro Montenegro'),
  ('Anisette'),
  ('Aperol'),
  ('Apfelkorn'),
  ('Apple Brandy'),
  ('Apple Schnapps'),
  ('Applejack'),
  ('Apricot Brandy'),
  ('Aquavit'),
  ('Asafoetida'),
  ('Añejo Rum'),
  ('Bacardi Limon'),
  ('Baileys Irish Cream'),
  ('Banana Liqueur'),
  ('Beer'),
  ('Benedictine'),
  ('Black Sambuca'),
  ('Blackberry Brandy'),
  ('Blackcurrant Cordial'),
  ('Blackstrap Rum'),
  ('Blended Scotch'),
  ('Blended Whiskey'),
  ('Blue Curacao'),
  ('Bourbon'),
  ('Brandy'),
  ('Butterscotch Schnapps'),
  ('Cachaca'),
  ('Campari'),
  ('Chambord Raspberry Liqueur'),
  ('Champagne'),
  ('Cherry Brandy'),
  ('Cherry Grenadine'),
  ('Cherry Heering'),
  ('Cherry Liqueur'),
  ('Chocolate Liqueur'),
  ('Cider'),
  ('Coconut Liqueur'),
  ('Coconut Rum'),
  ('Coffee Brandy'),
  ('Coffee Liqueur'),
  ('Cognac'),
  ('Cointreau'),
  ('Corona'),
  ('Cranberry Vodka'),
  ('Creme De Banane'),
  ('Creme De Cacao'),
  ('Creme De Cassis'),
  ('Creme De Mure'),
  ('Crown Royal'),
  ('Curacao'),
  ('Dark Creme De Cacao'),
  ('Dark Rum'),
  ('Drambuie'),
  ('Dry Vermouth'),
  ('Dubonnet Rouge'),
  ('Elderflower Cordial'),
  ('Erin Cream'),
  ('Everclear'),
  ('Falernum'),
  ('Firewater'),
  ('Frangelico'),
  ('Galliano'),
  ('Gin'),
  ('Godiva Liqueur'),
  ('Gold Rum'),
  ('Gold Tequila'),
  ('Goldschlager'),
  ('Grain Alcohol'),
  ('Grand Marnier'),
  ('Green Chartreuse'),
  ('Green Creme De Menthe'),
  ('Grenadine'),
  ('Guinness Stout'),
  ('Hot Damn'),
  ('Hpnotiq'),
  ('Irish Whiskey'),
  ('Islay Single Malt Scotch'),
  ('Jack Daniels'),
  ('Jagermeister'),
  ('Jim Beam'),
  ('Johnnie Walker'),
  ('Jägermeister'),
  ('Kahlua'),
  ('Kirschwasser'),
  ('Kiwi Liqueur'),
  ('Kummel'),
  ('Lager'),
  ('Lemon Vodka'),
  ('Light Rum'),
  ('Lillet Blanc'),
  ('Lillet'),
  ('Lime Juice Cordial'),
  ('Lime Vodka'),
  ('Malibu Rum'),
  ('Maraschino Liqueur'),
  ('Maui'),
  ('Melon Liqueur'),
  ('Mezcal'),
  ('Midori Melon Liqueur'),
  ('Orange Curacao'),
  ('Ouzo'),
  ('Passoa'),
  ('Peach Brandy'),
  ('Peach Schnapps'),
  ('Peach Vodka'),
  ('Peachtree Schnapps'),
  ('Peppermint Schnapps'),
  ('Pernod'),
  ('Pisang Ambon'),
  ('Pisco'),
  ('Port'),
  ('Prosecco'),
  ('Raspberry Liqueur'),
  ('Raspberry Vodka'),
  ('Red Wine'),
  ('Ricard'),
  ('Rose'),
  ('Rosso Vermouth'),
  ('Ruby Port'),
  ('Rum'),
  ('Rye Whiskey'),
  ('Sambuca'),
  ('Schweppes Russchian'),
  ('Scotch'),
  ('Sherry'),
  ('Sloe Gin'),
  ('Southern Comfort'),
  ('Spiced Rum'),
  ('St. Germain'),
  ('Strawberry Liqueur'),
  ('Strawberry Schnapps'),
  ('Surge'),
  ('Sweet Vermouth'),
  ('Tennessee Whiskey'),
  ('Tequila'),
  ('Tia Maria'),
  ('Triple Sec'),
  ('Vermouth'),
  ('Vodka'),
  ('Whiskey'),
  ('Whisky'),
  ('White Creme De Menthe'),
  ('White Rum'),
  ('White Wine'),
  ('Wild Turkey'),
  ('Wine'),
  ('Yellow Chartreuse'),
  ('Yukon Jack');

INSERT INTO boozeless (name) VALUES
  ('Vanilla Extract (Whiskey)'),
  ('Pineapple Juice (Rum)'),
  ('White Grape Juice (Vodka)'),
  ('Apricot Juice (Cognac)'),
  ('Apple Juice (Vermouth)'),
  ('Almond Extract (Amaretto)');

INSERT INTO drink_other_cats (name, priority) VALUES
  ('soda/juice', 1),
  ('dairy', 2),
  ('fruit', 3),
  ('bitters', 4),
  ('syrup', 5),
  ('spice', 6),
  ('extra', 7);

INSERT INTO drink_other (name, cat_id) VALUES
  ('7-up', (select id from drink_other_cats where name = 'soda/juice')),
  ('Agave Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Allspice', (select id from drink_other_cats where name = 'spice')),
  ('Almond Flavoring', (select id from drink_other_cats where name = 'extra')),
  ('Almond', (select id from drink_other_cats where name = 'extra')),
  ('Angelica Root', (select id from drink_other_cats where name = 'spice')),
  ('Angostura Bitters', (select id from drink_other_cats where name = 'bitters')),
  ('Anis', (select id from drink_other_cats where name = 'spice')),
  ('Anise', (select id from drink_other_cats where name = 'spice')),
  ('Apple Cider', (select id from drink_other_cats where name = 'soda/juice')),
  ('Apple Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Apple', (select id from drink_other_cats where name = 'fruit')),
  ('Apricot Nectar', (select id from drink_other_cats where name = 'soda/juice')),
  ('Apricot', (select id from drink_other_cats where name = 'fruit')),
  ('Banana', (select id from drink_other_cats where name = 'fruit')),
  ('Basil', (select id from drink_other_cats where name = 'spice')),
  ('Berries', (select id from drink_other_cats where name = 'fruit')),
  ('Bitter Lemon', (select id from drink_other_cats where name = 'bitters')),
  ('Bitters', (select id from drink_other_cats where name = 'bitters')),
  ('Black Pepper', (select id from drink_other_cats where name = 'spice')),
  ('Blackberries', (select id from drink_other_cats where name = 'fruit')),
  ('Blackcurrant Squash', (select id from drink_other_cats where name = 'extra')),
  ('Blood Orange', (select id from drink_other_cats where name = 'fruit')),
  ('Blueberries', (select id from drink_other_cats where name = 'fruit')),
  ('Brown Sugar', (select id from drink_other_cats where name = 'extra')),
  ('Butter', (select id from drink_other_cats where name = 'extra')),
  ('Candy', (select id from drink_other_cats where name = 'extra')),
  ('Cantaloupe', (select id from drink_other_cats where name = 'fruit')),
  ('Caramel Coloring', (select id from drink_other_cats where name = 'extra')),
  ('Caramel Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Carbonated Soft Drink', (select id from drink_other_cats where name = 'soda/juice')),
  ('Carbonated Water', (select id from drink_other_cats where name = 'soda/juice')),
  ('Cardamom', (select id from drink_other_cats where name = 'spice')),
  ('Carrot', (select id from drink_other_cats where name = 'extra')),
  ('Cayenne Pepper', (select id from drink_other_cats where name = 'spice')),
  ('Celery Salt', (select id from drink_other_cats where name = 'spice')),
  ('Cherries', (select id from drink_other_cats where name = 'fruit')),
  ('Cherry Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Cherry', (select id from drink_other_cats where name = 'fruit')),
  ('Chocolate Ice-cream', (select id from drink_other_cats where name = 'dairy')),
  ('Chocolate Milk', (select id from drink_other_cats where name = 'dairy')),
  ('Chocolate Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Chocolate Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Chocolate', (select id from drink_other_cats where name = 'extra')),
  ('Cinnamon', (select id from drink_other_cats where name = 'spice')),
  ('Cloves', (select id from drink_other_cats where name = 'spice')),
  ('Club Soda', (select id from drink_other_cats where name = 'soda/juice')),
  ('Coca-cola', (select id from drink_other_cats where name = 'soda/juice')),
  ('Cocoa Powder', (select id from drink_other_cats where name = 'extra')),
  ('Coconut Milk', (select id from drink_other_cats where name = 'dairy')),
  ('Coconut Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Coffee', (select id from drink_other_cats where name = 'extra')),
  ('Condensed Milk', (select id from drink_other_cats where name = 'dairy')),
  ('Coriander', (select id from drink_other_cats where name = 'spice')),
  ('Corn Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Cornstarch', (select id from drink_other_cats where name = 'extra')),
  ('Cranberries', (select id from drink_other_cats where name = 'fruit')),
  ('Cranberry Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Cream Of Coconut', (select id from drink_other_cats where name = 'extra')),
  ('Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Cucumber', (select id from drink_other_cats where name = 'extra')),
  ('Cumin Seed', (select id from drink_other_cats where name = 'spice')),
  ('Daiquiri Mix', (select id from drink_other_cats where name = 'soda/juice')),
  ('Demerara Sugar', (select id from drink_other_cats where name = 'extra')),
  ('Dr. Pepper', (select id from drink_other_cats where name = 'soda/juice')),
  ('Egg White', (select id from drink_other_cats where name = 'extra')),
  ('Egg Yolk', (select id from drink_other_cats where name = 'extra')),
  ('Egg', (select id from drink_other_cats where name = 'extra')),
  ('Espresso', (select id from drink_other_cats where name = 'extra')),
  ('Fennel Seeds', (select id from drink_other_cats where name = 'spice')),
  ('Figs', (select id from drink_other_cats where name = 'fruit')),
  ('Food Coloring', (select id from drink_other_cats where name = 'extra')),
  ('Fresca', (select id from drink_other_cats where name = 'soda/juice')),
  ('Fresh Lemon Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Fresh Lime Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Fruit Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Fruit Punch', (select id from drink_other_cats where name = 'soda/juice')),
  ('Fruit', (select id from drink_other_cats where name = 'fruit')),
  ('Ginger Ale', (select id from drink_other_cats where name = 'soda/juice')),
  ('Ginger Beer', (select id from drink_other_cats where name = 'soda/juice')),
  ('Ginger Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Ginger', (select id from drink_other_cats where name = 'spice')),
  ('Glycerine', (select id from drink_other_cats where name = 'extra')),
  ('Grape Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Grape Soda', (select id from drink_other_cats where name = 'soda/juice')),
  ('Grapefruit Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Grapes', (select id from drink_other_cats where name = 'fruit')),
  ('Guava Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Half-and-half', (select id from drink_other_cats where name = 'dairy')),
  ('Heavy Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Honey Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Honey', (select id from drink_other_cats where name = 'extra')),
  ('Hot Chocolate', (select id from drink_other_cats where name = 'extra')),
  ('Hot Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Ice', (select id from drink_other_cats where name = 'extra')),
  ('Iced Tea', (select id from drink_other_cats where name = 'extra')),
  ('Irish Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Jello', (select id from drink_other_cats where name = 'extra')),
  ('Kiwi', (select id from drink_other_cats where name = 'fruit')),
  ('Kool-aid', (select id from drink_other_cats where name = 'soda/juice')),
  ('Lavender', (select id from drink_other_cats where name = 'spice')),
  ('Lemon Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Lemon Peel', (select id from drink_other_cats where name = 'fruit')),
  ('Lemon', (select id from drink_other_cats where name = 'fruit')),
  ('Lemon-lime Soda', (select id from drink_other_cats where name = 'soda/juice')),
  ('Lemonade', (select id from drink_other_cats where name = 'soda/juice')),
  ('Licorice Root', (select id from drink_other_cats where name = 'spice')),
  ('Light Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Lime Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Lime Peel', (select id from drink_other_cats where name = 'fruit')),
  ('Lime', (select id from drink_other_cats where name = 'fruit')),
  ('Limeade', (select id from drink_other_cats where name = 'soda/juice')),
  ('Mango', (select id from drink_other_cats where name = 'fruit')),
  ('Maple Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Maraschino Cherry', (select id from drink_other_cats where name = 'fruit')),
  ('Marjoram Leaves', (select id from drink_other_cats where name = 'spice')),
  ('Marshmallows', (select id from drink_other_cats where name = 'extra')),
  ('Milk', (select id from drink_other_cats where name = 'dairy')),
  ('Mini-snickers Bars', (select id from drink_other_cats where name = 'extra')),
  ('Mint Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Mint', (select id from drink_other_cats where name = 'spice')),
  ('Mountain Dew', (select id from drink_other_cats where name = 'soda/juice')),
  ('Nutmeg', (select id from drink_other_cats where name = 'spice')),
  ('Olive Brine', (select id from drink_other_cats where name = 'extra')),
  ('Olive', (select id from drink_other_cats where name = 'extra')),
  ('Orange Bitters', (select id from drink_other_cats where name = 'bitters')),
  ('Orange Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Orange Peel', (select id from drink_other_cats where name = 'fruit')),
  ('Orange Spiral', (select id from drink_other_cats where name = 'fruit')),
  ('Orange', (select id from drink_other_cats where name = 'fruit')),
  ('Oreo Cookie', (select id from drink_other_cats where name = 'extra')),
  ('Orgeat Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Papaya', (select id from drink_other_cats where name = 'fruit')),
  ('Passion Fruit Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Passion Fruit Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Peach Bitters', (select id from drink_other_cats where name = 'bitters')),
  ('Peach Nectar', (select id from drink_other_cats where name = 'soda/juice')),
  ('Pepper', (select id from drink_other_cats where name = 'spice')),
  ('Peppermint Extract', (select id from drink_other_cats where name = 'extra')),
  ('Pepsi Cola', (select id from drink_other_cats where name = 'soda/juice')),
  ('Peychaud Bitters', (select id from drink_other_cats where name = 'bitters')),
  ('Pina Colada Mix', (select id from drink_other_cats where name = 'soda/juice')),
  ('Pineapple Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Pineapple Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Pineapple', (select id from drink_other_cats where name = 'fruit')),
  ('Pink Lemonade', (select id from drink_other_cats where name = 'soda/juice')),
  ('Pomegranate Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Powdered Sugar', (select id from drink_other_cats where name = 'extra')),
  ('Raisins', (select id from drink_other_cats where name = 'fruit')),
  ('Raspberry Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Red Chili Flakes', (select id from drink_other_cats where name = 'spice')),
  ('Root Beer', (select id from drink_other_cats where name = 'soda/juice')),
  ('Rosemary Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Rosemary', (select id from drink_other_cats where name = 'spice')),
  ('Salt', (select id from drink_other_cats where name = 'spice')),
  ('Salted Chocolate', (select id from drink_other_cats where name = 'extra')),
  ('Sarsaparilla', (select id from drink_other_cats where name = 'soda/juice')),
  ('Sherbet', (select id from drink_other_cats where name = 'extra')),
  ('Sirup Of Roses', (select id from drink_other_cats where name = 'extra')),
  ('Soda Water', (select id from drink_other_cats where name = 'soda/juice')),
  ('Sour Mix', (select id from drink_other_cats where name = 'soda/juice')),
  ('Soy Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Sprite', (select id from drink_other_cats where name = 'soda/juice')),
  ('Strawberries', (select id from drink_other_cats where name = 'fruit')),
  ('Sugar Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Sugar', (select id from drink_other_cats where name = 'extra')),
  ('Sweet And Sour', (select id from drink_other_cats where name = 'extra')),
  ('Tabasco Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Tea', (select id from drink_other_cats where name = 'extra')),
  ('Thyme', (select id from drink_other_cats where name = 'spice')),
  ('Tomato Juice', (select id from drink_other_cats where name = 'soda/juice')),
  ('Tonic Water', (select id from drink_other_cats where name = 'soda/juice')),
  ('Tropicana', (select id from drink_other_cats where name = 'soda/juice')),
  ('Vanilla Extract', (select id from drink_other_cats where name = 'extra')),
  ('Vanilla Ice-cream', (select id from drink_other_cats where name = 'dairy')),
  ('Vanilla Syrup', (select id from drink_other_cats where name = 'syrup')),
  ('Vanilla', (select id from drink_other_cats where name = 'extra')),
  ('Water', (select id from drink_other_cats where name = 'extra')),
  ('Watermelon', (select id from drink_other_cats where name = 'fruit')),
  ('Whipped Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Whipping Cream', (select id from drink_other_cats where name = 'dairy')),
  ('Worcestershire Sauce', (select id from drink_other_cats where name = 'extra')),
  ('Wormwood', (select id from drink_other_cats where name = 'spice')),
  ('Yoghurt', (select id from drink_other_cats where name = 'dairy')),
  ('Zima', (select id from drink_other_cats where name = 'soda/juice'));

INSERT INTO be_drinks (drink_id, name, type, container, image, instructions, ingredients) VALUES
  (
    17222,
    'A1',
    'Cocktail',
    'Cocktail glass',
    '2x8thr1504816928.jpg',
    'Pour all ingredients into a cocktail shaker, mix and serve over ice into a chilled glass.',
    '{"Gin": "1 3/4 shot", "Grand Marnier": "1 Shot", "Lemon Juice": "1/4 Shot", "Grenadine": "1/8 Shot"}'
  ),
  (
    13501,
    'ABC',
    'Shot',
    'Shot glass',
    'tqpvqp1472668328.jpg',
    'Layered in a shot glass.',
    '{"Amaretto": "1/3", "Baileys Irish Cream": "1/3", "Cognac": "1/3"}'
  ),
  (
    17225,
    'Ace',
    'Cocktail',
    'Martini Glass',
    'l3cd7f1504818306.jpg',
    'Shake all the ingredients in a cocktail shaker and ice then strain in a cold glass.',
    '{"Gin": "2 shots", "Grenadine": "1/2 shot", "Heavy Cream": "1/2 shot", "Milk": "1/2 shot", "Egg White": "1/2 Fresh"}'
  ),
  (
    17837,
    'Adam',
    'Ordinary Drink',
    'Cocktail glass',
    'v0at4i1582478473.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Dark Rum": "2 oz", "Lemon Juice": "1 oz", "Grenadine": "1 tsp"}'
  ),
  (
    13938,
    'AT&T',
    'Ordinary Drink',
    'Highball Glass',
    'rhhwmp1493067619.jpg',
    'Pour Vodka and Gin over ice, add Tonic and Stir',
    '{"Absolut Vodka": "1 oz", "Gin": "1 oz", "Tonic Water": "4 oz"}'
  ),
  (
    14610,
    'ACID',
    'Shot',
    'Shot glass',
    'xuxpxt1479209317.jpg',
    'Poor in the 151 first followed by the 101 served with a Coke or Dr Pepper chaser.',
    '{"151 Proof Rum": "1 oz Bacardi", "Wild Turkey": "1 oz"}'
  ),
  (
    17833,
    'A. J.',
    'Ordinary Drink',
    'Cocktail glass',
    'l74qo91582480316.jpg',
    'Shake ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Applejack": "1 1/2 oz", "Grapefruit Juice": "1 oz"}'
  ),
  (
    17839,
    'Affair',
    'Ordinary Drink',
    'Highball glass',
    'h5za6y1582477994.jpg',
    'Pour schnapps, orange juice, and cranberry juice over ice in a highball glass. Top with club soda and serve.',
    '{"Strawberry Schnapps": "2 oz", "Orange Juice": "2 oz", "Cranberry Juice": "2 oz", "Club Soda": "to Taste"}'
  ),
  (
    15106,
    'Apello',
    'Other/Unknown',
    'Collins Glass',
    'uptxtv1468876415.jpg',
    'Stirr. Grnish with maraschino cherry.',
    '{"Orange Juice": "4 cl", "Grapefruit Juice": "3 cl", "Apple Juice": "1 cl", "Maraschino Cherry": "1"}'
  ),
  (
    15266,
    'Avalon',
    'Ordinary Drink',
    'Highball glass',
    '3k9qic1493068931.jpg',
    'Fill a tall glass with ice. Layer the Finlandia Vodka, lemon and apple juices, Pisang Ambon, and top up with lemonade. Stir slightly and garnish with a spiralled cucumber skin and a red cherry. The cucumber provides zest and looks attractive. This drink, created by Timo Haimi, took first prize in the 1991 Finlandia Vodka Long Drink Competition.',
    '{"Vodka": "3 parts", "Pisang Ambon": "1 part", "Apple Juice": "6 parts", "Lemon Juice": "1 1/2 part", "Lemonade": "to Taste"}'
  ),
  (
    17835,
    'Abilene',
    'Ordinary Drink',
    'Highball glass',
    'smb2oe1582479072.jpg',
    'Pour all of the ingredients into a highball glass almost filled with ice cubes. Stir well.',
    '{"Dark Rum": "1 1/2 oz", "Peach Nectar": "2 oz", "Orange Juice": "3 oz"}'
  ),
  (
    11023,
    'Almeria',
    'Ordinary Drink',
    'Cocktail glass',
    'rwsyyu1483388181.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Dark Rum": "2 oz", "Kahlua": "1 oz", "Egg White": "1"}'
  ),
  (
    17228,
    'Addison',
    'Cocktail',
    'Martini Glass',
    'yzva7x1504820300.jpg',
    'Shake together all the ingredients and strain into a cold glass.',
    '{"Gin": "1 1/2 shot", "Vermouth": "1 1/2 shot"}'
  ),
  (
    17836,
    'Acapulco',
    'Ordinary Drink',
    'Old-fashioned glass',
    'il9e0r1582478841.jpg',
    'Combine and shake all ingredients (except mint) with ice and strain into an old-fashioned glass over ice cubes. Add the sprig of mint and serve.',
    '{"Light Rum": "1 1/2 oz", "Triple Sec": "1 1/2 tsp", "Lime Juice": "1 tblsp", "Sugar": "1 tsp", "Egg White": "1", "Mint": "1"}'
  ),
  (
    17840,
    'Affinity',
    'Ordinary Drink',
    'Cocktail glass',
    'wzdtnn1582477684.jpg',
    'In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.',
    '{"Scotch": "1 1/2 oz", "Sweet Vermouth": "1 oz", "Dry Vermouth": "1 oz", "Orange Bitters": "2 dashes"}'
  ),
  (
    11046,
    'Applecar',
    'Ordinary Drink',
    'Cocktail glass',
    'sbffau1504389764.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Applejack": "1 oz", "Triple Sec": "1 oz", "Lemon Juice": "1 oz"}'
  ),
  (
    17180,
    'Aviation',
    'Cocktail',
    'Cocktail glass',
    'trbplb1606855233.jpg',
    'Add all ingredients into cocktail shaker filled with ice. Shake well and strain into cocktail glass. Garnish with a cherry.',
    '{"Gin": "4.5 cl", "Lemon Juice": "1.5 cl", "Maraschino Liqueur": "1.5 cl"}'
  ),
  (
    11014,
    'Alexander',
    'Ordinary Drink',
    'Cocktail glass',
    '0clus51606772388.jpg',
    'Shake all ingredients with ice and strain contents into a cocktail glass. Sprinkle nutmeg on top and serve.',
    '{"Gin": "1/2 oz", "Creme De Cacao": "1/2 oz white", "Light Cream": "2 oz", "Nutmeg": "to Taste"}'
  ),
  (
    11020,
    'Algonquin',
    'Ordinary Drink',
    'Cocktail glass',
    'uwryxx1483387873.jpg',
    'Combine and shake all ingredients with ice, strain contents into a cocktail glass, and serve.',
    '{"Blended Whiskey": "1 1/2 oz", "Dry Vermouth": "1 oz", "Pineapple Juice": "1 oz"}'
  ),
  (
    11021,
    'Allegheny',
    'Ordinary Drink',
    'Cocktail glass',
    'uwvyts1483387934.jpg',
    'Shake all ingredients (except lemon peel) with ice and strain into a cocktail glass. Top with the twist of lemon peel and serve.',
    '{"Dry Vermouth": "1 oz", "Bourbon": "1 oz", "Blackberry Brandy": "1 1/2 tsp", "Lemon Juice": "1 1/2 tsp", "Lemon Peel": "1 twist of"}'
  ),
  (
    11055,
    'Artillery',
    'Ordinary Drink',
    'Cocktail glass',
    'g1vnbe1493067747.jpg',
    'Stir all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Sweet Vermouth": "1 1/2 tsp", "Gin": "1 1/2 oz", "Bitters": "2 dashes"}'
  ),
  (
    12560,
    'Afterglow',
    'Cocktail',
    'Highball Glass',
    'vuquyv1468876052.jpg',
    'Mix. Serve over ice.',
    '{"Grenadine": "1 part", "Orange Juice": "4 parts", "Pineapple Juice": "4 parts"}'
  ),
  (
    12756,
    'Autodafé',
    'Ordinary Drink',
    'Highball glass',
    '7dkf0i1487602928.jpg',
    'Mix and fill up with soda water. Drunk by finns on a sunny day any time of the year and day.',
    '{"Vodka": "4 cl", "Lime Juice": "1 dash", "Soda Water": "to Taste"}'
  ),
  (
    13162,
    'Afternoon',
    'Coffee / Tea',
    'Collins Glass',
    'vyrurp1472667777.jpg',
    'Build into a suiting glass, with no ice. Cream on top if wanted. Served directly.',
    '{"Kahlua": "1 cl", "Baileys Irish Cream": "1 cl", "Frangelico": "1 1/2", "Coffee": "4 cl hot", "Cream": "to Taste"}'
  ),
  (
    15182,
    'After sex',
    'Ordinary Drink',
    'Highball glass',
    'xrl66i1493068702.jpg',
    'Pour the vodka and creme over some ice cubes in a tall glass and fill up with juice. to make it beuty full make the top of the glass with a grenadine and sugar',
    '{"Vodka": "2 cl", "Creme De Banane": "1 cl", "Orange Juice": "to Taste"}'
  ),
  (
    15941,
    'Americano',
    'Ordinary Drink',
    'Collins glass',
    '709s6m1613655124.jpg',
    'Pour the Campari and vermouth over ice into glass, add a splash of soda water and garnish with half orange slice.',
    '{"Campari": "1 oz", "Sweet Vermouth": "1 oz red", "Lemon Peel": "Twist of", "Orange Peel": "Twist of"}'
  ),
  (
    16311,
    'Applejack',
    'Cocktail',
    'Cocktail glass',
    'sutyqp1479209062.jpg',
    'Add all ingredients into mixing glass, chill and strain into cocktail glass',
    '{"Jack Daniels": "1 oz", "Midori Melon Liqueur": "1/2 oz", "Sour Mix": "2 oz"}'
  ),
  (
    16333,
    'Adam Bomb',
    'Punch / Party Drink',
    'Margarita/Coupette glass',
    'tpxurs1454513016.jpg',
    'Add ice to blender (or to glass if prefer on the rocks) then fruit, and fruite juice depending on personal prefference then add the Rum, Vodka, Tequila, and triple sec. blend till smooth, rim glass with sugar or salt and pour mixture in. garnish with lemon or lime slice.',
    '{"Rum": "1 part", "Vodka": "1 part", "Tequila": "1 part", "Triple Sec": "1/2 part", "Fruit": "to Taste", "Ice": "to Taste", "Salt": "1-3 pint", "Fruit Juice": "to Taste"}'
  ),
  (
    16419,
    'Avalanche',
    'Shake',
    'Highball glass',
    'uppqty1472720165.jpg',
    'Mix in highball glass over ice, shake well.',
    '{"Crown Royal": "1 shot", "Kahlua": "1 shot", "Cream": "Fill with"}'
  ),
  (
    17227,
    'Addington',
    'Cocktail',
    'Cocktail glass',
    'ib0b7g1504818925.jpg',
    'Mix both the vermouth''s in a shaker and strain into a cold glass. Top up with a squirt of Soda Water.',
    '{"Sweet Vermouth": "2 shots", "Dry Vermouth": "1 shot", "Soda Water": "Top up with"}'
  ),
  (
    11024,
    'Almond Joy',
    'Ordinary Drink',
    'Cocktail glass',
    'xutuqs1483388296.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Amaretto": "1/2 oz", "Creme De Cacao": "1/2 oz white", "Light Cream": "2 oz"}'
  ),
  (
    11034,
    'Angel Face',
    'Ordinary Drink',
    'Cocktail glass',
    'vaukir1606772580.jpg',
    'Shake all ingredients with ice and strain contents into a cocktail glass.',
    '{"Apricot Brandy": "1/2 oz", "Apple Brandy": "1/2 oz", "Gin": "1 oz"}'
  ),
  (
    11052,
    'Archbishop',
    'Ordinary Drink',
    'Old-fashioned glass',
    '4g6xds1582579703.jpg',
    'In an old-fashioned glass almost filled with ice cubes, combine all of the ingredients. Stir well.',
    '{"Gin": "2 oz", "Wine": "1 oz Green Ginger", "Benedictine": "1 tsp", "Lime": "1"}'
  ),
  (
    13807,
    'After Five',
    'Shot',
    'Shot glass',
    'sk3lr91493068595.jpg',
    '1. Pour Kahlua into shot glass to about 1/2 full. 2. Using a spoon(inverted), slowly pour in the Peppermint Schnapps until glass is about 3/4 full. Done correctly, the Schnapps will flow under the Kahlua for a clear layer. 3. Again using a spoon, but this time right side up, slowly top off the glass with a layer of Bailey''s. Be careful to place the spoon right at the top of the Kahlua layer and to raise it as the glass fills up. Done correctly, this will provide a layer of Bailey''s floating over the Kahlua. 4. Toss it down all at once for something like a Peppermint Pattie, WITH A BANG!!! NOTE: Best if all ingredients are chilled',
    '{"Peppermint Schnapps": "to Taste", "Kahlua": "to Taste", "Baileys Irish Cream": "to Taste"}'
  ),
  (
    17226,
    'Adam & Eve',
    'Cocktail',
    'Cocktail glass',
    'vfeumw1504819077.jpg',
    'Shake together all the ingredients and strain into a cold glass.',
    '{"Gin": "1 shot", "Cognac": "1 shot", "Creme De Cassis": "1 shot", "Fresh Lemon Juice": "1/8 shot"}'
  ),
  (
    178319,
    'Aquamarine',
    'Cocktail',
    'Martini Glass',
    'zvsre31572902738.jpg',
    'Shake well in a shaker with ice. Strain in a martini glass.',
    '{"Hpnotiq": "2 oz", "Pineapple Juice": "1 oz", "Banana Liqueur": "1 oz"}'
  ),
  (
    12790,
    'Absinthe #2',
    'Homemade Liqueur',
    'Jar',
    'uxxtrt1472667197.jpg',
    'Mix together and let sit a few days. Strain through a coffee filter. To serve mix 1 part absinthe to 4 parts water, add ice, enjoy.',
    '{"Vodka": "1 bottle", "Sugar": "50 gr", "Anise": "50 ml pure", "Licorice Root": "1 tblsp", "Wormwood": "1"}'
  ),
  (
    14360,
    'Absolut Sex',
    'Shot',
    'Old-fashioned glass',
    'xtrvtx1472668436.jpg',
    'Shake Absolut Kurant, Midori, and Cranberry juice in shaker with ice: Strain into rocks glass: Splash of seven on top.Absolut Sex.',
    '{"Absolut Kurant": "3/4 oz", "Midori Melon Liqueur": "3/4 oz", "Cranberry Juice": "1 oz", "Sprite": "1 splash"}'
  ),
  (
    14364,
    'Aztec Punch',
    'Punch / Party Drink',
    'Punch bowl',
    'uqwuyp1454514591.jpg',
    'Mix all ingredients in a pitcher. Mix thoroughly and pour into whatever is available, the bigger the better! This drink packs a big punch, so don''t over do it.',
    '{"Lemonade": "1 can", "Vodka": "5 oz", "Rum": "7 oz", "Ginger Ale": "About 1 bottle"}'
  ),
  (
    14622,
    'Arctic Fish',
    'Punch / Party Drink',
    'Beer pilsner',
    'ttsvwy1472668781.jpg',
    'Fill glass with ice and fish, add vodka, grape soda and orange juice. DO NOT STIR!!!!! Serve well chilled.',
    '{"Vodka": "1/3 part", "Grape Soda": "1/3 part", "Orange Juice": "1/3 part", "Ice": "lots", "Candy": "1 dash"}'
  ),
  (
    11029,
    'Amaretto Tea',
    'Ordinary Drink',
    'Pousse cafe glass',
    'b7qzo21493070167.jpg',
    'Pour hot tea into a pousse-cafe glass, using a spoon in glass to prevent cracking. Add amaretto, but do not stir. Top with chilled whipped cream and serve.',
    '{"Tea": "6 oz hot", "Amaretto": "2 oz", "Whipped Cream": "Chilled"}'
  ),
  (
    11050,
    'Apricot Lady',
    'Ordinary Drink',
    'Old-fashioned glass',
    '7ityp11582579598.jpg',
    'In a shaker half-filled with ice cubes, combine the rum, apricot brandy, triple sec, lemon juice, and egg white. Shake well. Strain into an old-fashioned glass almost filled with ice cubes. Garnish with the orange slice.',
    '{"Light Rum": "1 1/2 oz", "Apricot Brandy": "1 oz", "Triple Sec": "1 tsp", "Lemon Juice": "1/2 oz", "Egg White": "1", "Orange": "1"}'
  ),
  (
    12564,
    'Apple Karate',
    'Cocktail',
    'Highball Glass',
    'syusvw1468876634.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Apple Juice": "2 cups", "Carrot": "1 large"}'
  ),
  (
    13423,
    'Atlantic Sun',
    'Ordinary Drink',
    'Collins Glass',
    'doyxqb1493067556.jpg',
    'Shake all the ingredients, top the drink with soda. Garnish with a slice of orange.',
    '{"Vodka": "2 cl Smirnoff", "Southern Comfort": "2 cl", "Passion Fruit Syrup": "2 cl", "Sweet And Sour": "6 cl", "Club Soda": "1 dash"}'
  ),
  (
    15567,
    'Adam Sunrise',
    'Ordinary Drink',
    'Collins Glass',
    'vtuyvu1472812112.jpg',
    'Fill blender up with ice. Fill half with Bartons Vodka. Put 10 tsp of sugar, add 1/2 can lemonade concentrate, fill to top with water. Blend for 60 seconds.',
    '{"Vodka": "1/2", "Lemonade": "1/2 can", "Water": "1/2", "Sugar": "10 tsp"}'
  ),
  (
    16289,
    'Apple Grande',
    'Punch / Party Drink',
    'Punch Bowl',
    'wqrptx1472668622.jpg',
    'Chill both ingredients!! Mix in a tumbler and enjoy!',
    '{"Tequila": "3 oz", "Apple Cider": "12 oz"}'
  ),
  (
    17066,
    'Army special',
    'Cocktail',
    'Cocktail glass',
    '55muhh1493068062.jpg',
    'Pour Vodka, Gin and lime cordial into glass, and top up with crushed ice. Wait for ice to melt slightly and sip without a straw.',
    '{"Vodka": "30 ml", "Gin": "30 ml", "Lime Juice Cordial": "45 ml", "Ice": "1/2 glass crushed"}'
  ),
  (
    11026,
    'Amaretto Mist',
    'Ordinary Drink',
    'Old-fashioned glass',
    'utpxxq1483388370.jpg',
    'Pour amaretto in an old-fashioned glass over crushed ice. Add the wedge of lime and serve. (A wedge of lemon may be substituted for lime, if preferred.)',
    '{"Amaretto": "1 1/2 oz", "Lime": "1"}'
  ),
  (
    11027,
    'Amaretto Rose',
    'Ordinary Drink',
    'Collins glass',
    '3jm41q1493069578.jpg',
    'Pour amaretto and lime juice over ice in a collins glass. Fill with club soda and serve.',
    '{"Amaretto": "1 1/2 oz", "Lime Juice": "1/2 oz", "Club Soda": "to Taste"}'
  ),
  (
    11053,
    'Arise My Love',
    'Ordinary Drink',
    'Champagne flute',
    'wyrrwv1441207432.jpg',
    'Put creme de menthe into a champagne flute. Fill with chilled champagne and serve.',
    '{"Champagne": "Chilled", "Green Creme De Menthe": "1 tsp"}'
  ),
  (
    13086,
    'Atomic Lokade',
    'Ordinary Drink',
    'Collins Glass',
    'n3zfrh1493067412.jpg',
    'In a shaker, place lemonade, vodka, blue Curacao, and triple sec together. Shake with ice and strain into glass. Add sugar to taste',
    '{"Lemonade": "5 oz", "Vodka": "1 oz", "Blue Curacao": "1/2 oz", "Triple Sec": "1/2 oz", "Sugar": "to Taste", "Ice": "to Taste"}'
  ),
  (
    13683,
    'Apple Slammer',
    'Shot',
    'Shot glass',
    '09yd5f1493069852.jpg',
    'pour into a shot glass and present to consumer, they are expected to cover the top of the shotglass with thier palm, raise the glass, slam it on the bar and the swallow quickly.',
    '{"7-up": "1 part", "Apple Schnapps": "1 part"}'
  ),
  (
    13731,
    'Amaretto Sour',
    'Ordinary Drink',
    'Collins Glass',
    'xnzc541493070211.jpg',
    'Shake and strain. Garnish with a cherry and an orange slice.',
    '{"Amaretto": "1 1/2 oz", "Sour Mix": "3 oz"}'
  ),
  (
    15849,
    'Apricot punch',
    'Punch / Party Drink',
    'Punch bowl',
    'tuxxtp1472668667.jpg',
    'Pour all ingrediants into a large punch bowl. Add ice and 4 oranges that are peeled and divided.',
    '{"Apricot Brandy": "1 qt", "Champagne": "4 fifth", "Vodka": "1 fifth", "7-up": "4 L", "Orange Juice": "1/2 gal"}'
  ),
  (
    17223,
    'Abbey Martini',
    'Cocktail',
    'Cocktail glass',
    '2mcozt1504817403.jpg',
    'Put all ingredients into a shaker and mix, then strain contents into a chilled cocktail glass.',
    '{"Gin": "2 shots", "Sweet Vermouth": "1 shot", "Orange Juice": "1 shot", "Angostura Bitters": "3 dashes"}'
  ),
  (
    178321,
    'Amaretto fizz',
    'Cocktail',
    'Collins glass',
    '92h3jz1582474310.jpg',
    'Mix Amaretto, orange juice and sparkling wine in a jug. Add a strip orange zest to each glass, if you like.',
    '{"Amaretto": "4 cl", "Orange Juice": "6 cl", "White Wine": "15 cl", "Orange Peel": "Garnish with"}'
  ),
  (
    178325,
    'Aperol Spritz',
    'Cocktail',
    'Wine Glass',
    'iloasq1587661955.jpg',
    'Put a couple of cubes of ice into 2 glasses and add a 50 ml measure of Aperol to each. Divide the prosecco between the glasses and then top up with soda, if you like.',
    '{"Aperol": "100 ml", "Prosecco": "150 ml", "Soda Water": "Top"}'
  ),
  (
    17834,
    'Abbey Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'mr30ob1582479875.jpg',
    'Shake all ingredients (except for the cherry) with ice and strain into a cocktail glass. Top with the cherry and serve.',
    '{"Gin": "1 1/2 oz", "Orange Bitters": "1 dash", "Orange": "Juice of 1/4", "Cherry": "1"}'
  ),
  (
    11019,
    'Alfie Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'ypxsqy1483387829.jpg',
    'Combine and shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Lemon Vodka": "1 1/2 oz", "Triple Sec": "1 dash", "Pineapple Juice": "1 tblsp"}'
  ),
  (
    12562,
    'Alice Cocktail',
    'Cocktail',
    'Cocktail glass',
    'qyqtpv1468876144.jpg',
    'Shake well, strain into a large cocktail glass.',
    '{"Grenadine": "1 cl", "Orange Juice": "1 cl", "Pineapple Juice": "2 cl", "Cream": "4 cl"}'
  ),
  (
    15194,
    'Amaretto Shake',
    'Ordinary Drink',
    'Collins Glass',
    'xk79al1493069655.jpg',
    'Combine all ingredients in a blender and blend at high speed until smooth. Serve in chilled glass garnished with bittersweet chocolate shavings.',
    '{"Chocolate Ice-cream": "2 scoops", "Brandy": "2 oz", "Amaretto": "2 oz"}'
  ),
  (
    16405,
    'A Piece of Ass',
    'Other/Unknown',
    'Highball glass',
    'tqxyxx1472719737.jpg',
    'Put ice in glass. Pour in shots. Fill with Sour Mix.',
    '{"Amaretto": "1 shot", "Southern Comfort": "1 shot", "Ice": "cubes", "Sour Mix": "to Taste"}'
  ),
  (
    178353,
    'Apple Highball',
    'Cocktail',
    'Highball glass',
    '66mt9b1619695719.jpg',
    'Add ice in a highball glass. Rub a wedge of fresh lime around rim and place it in the glass. Add a shot of Apple schnapps, a shot of Courvoisier and top up with ginger ale.',
    '{"Lime": "Chopped", "Apple Schnapps": "1 shot", "Cognac": "1 shot", "Ginger": "Top"}'
  ),
  (
    17838,
    'Adonis Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'xrvruq1472812030.jpg',
    'Stir all ingredients with ice, strain contents into a cocktail glass, and serve.',
    '{"Sweet Vermouth": "3/4 oz", "Sherry": "1 1/2 oz dry", "Orange Bitters": "1 dash"}'
  ),
  (
    11012,
    'Alabama Slammer',
    'Ordinary Drink',
    'Highball glass',
    'jntghf1606771886.jpg',
    'Pour all ingredients (except for lemon juice) over ice in a highball glass. Stir, add a dash of lemon juice, and serve.',
    '{"Southern Comfort": "1 oz", "Amaretto": "1 oz", "Sloe Gin": "1/2 oz", "Lemon Juice": "1 dash"}'
  ),
  (
    11013,
    'Alaska Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'wsyryt1483387720.jpg',
    'Stir all ingredients with ice, strain contents into a cocktail glass. Drop in a twist of lemon and serve.',
    '{"Orange Bitters": "2 dashes", "Gin": "1 1/2 oz", "Yellow Chartreuse": "3/4 oz", "Lemon Peel": "Twist of"}'
  ),
  (
    11022,
    'Allies Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'qvprvp1483388104.jpg',
    'Stir all ingredients with ice, strain contents into a cocktail glass, and serve.',
    '{"Dry Vermouth": "1 oz", "Gin": "1 oz", "Kummel": "1/2 tsp"}'
  ),
  (
    11054,
    'Arthur Tompkins',
    'Ordinary Drink',
    'Whiskey sour glass',
    '7onfhz1493067921.jpg',
    'In a shaker half-filled with ice cubes, combine the gin, Grand Marnier, and lemon juice. Shake well. Strain into a sour glass and garnish with the lemon twist.',
    '{"Gin": "2 oz", "Grand Marnier": "1/2 oz", "Lemon Juice": "2 tsp", "Lemon Peel": "1 twist of"}'
  ),
  (
    12870,
    'Artillery Punch',
    'Punch / Party Drink',
    'Punch bowl',
    '9a4vqb1493067692.jpg',
    'Combine all the ingredients in a large punch bowl with a block of ice. If found too dry, sugar syrup may be added. Decorate with twists of lemon peel.',
    '{"Tea": "1 quart black", "Rye Whiskey": "1 quart", "Red Wine": "1 fifth", "Rum": "1 pint Jamaican", "Brandy": "1/2 pint", "Benedictine": "1 1/2 oz", "Orange Juice": "1 pint", "Lemon Juice": "1/2 pint"}'
  ),
  (
    14272,
    'Addison Special',
    'Cocktail',
    'Old-fashioned glass',
    '4vo5651493068493.jpg',
    'Combine ingredients in the order listed into a shaker. Fill half full with ice and shake well. Strain into glass with ice and garnish with a cherry and orange wedge.',
    '{"Vodka": "1 shot", "Grenadine": "1 tblsp", "Orange Juice": "Fill with"}'
  ),
  (
    17074,
    'Arizona Twister',
    'Cocktail',
    'Hurricane glass',
    'ido1j01493068134.jpg',
    'Just mix in the shots of rum, vodka, and tequila. Add splashes of the three juices, heavy on the pineapple. Top off with grenadine. Crushed ice should already be in glass. Top off the glass with a pineapple wedge.',
    '{"Vodka": "1 shot", "Malibu Rum": "1 shot", "Gold Tequila": "1 shot", "Orange Juice": "1 splash", "Pineapple Juice": "1 splash", "Cream Of Coconut": "1 splash", "Grenadine": "1 dash", "Ice": "crushed", "Pineapple": "1 wedge"}'
  ),
  (
    17168,
    'Amaretto Sunset',
    'Ordinary Drink',
    'Collins Glass',
    'apictz1493069760.jpg',
    'Shake ingredients in bartender''s mixer quickly, just 5 shakes. Strain out ice, serve in glass immediately with a slice of orange.',
    '{"Triple Sec": "1/2 jigger", "Amaretto": "3 shots", "Cider": "1/2 cup", "Ice": "Add 1/2 cup"}'
  ),
  (
    11028,
    'Amaretto Stinger',
    'Ordinary Drink',
    'Cocktail glass',
    'vvop4w1493069934.jpg',
    'Shake ingredients well with cracked ice, strain into a cocktail glass, and serve.',
    '{"Amaretto": "1 1/2 oz", "White Creme De Menthe": "3/4 oz"}'
  ),
  (
    12792,
    'Amaretto Liqueur',
    'Homemade Liqueur',
    'Collins Glass',
    'swqxuv1472719649.jpg',
    'Combine sugar and 3/4 cup water in a small saucepan. Bring to a boil, stirring constantly. Reduce heat and simmer until all sugar is dissolved. Remove from heat and cool. In an aging container, combine apricot halves, almond extract, grain alcohol with 1/2 cup water, and brandy. Stir in cooled sugar syrup mixture. Cap and let age for 2 days. Remove apricot halves. (Save apricot halves, can be used for cooking). Add food coloring and glycerine. Stir, recap and continue aging for 1 to 2 months. Re-bottle as desired. Liqueur is ready to serve but will continue to improve with additional aging.',
    '{"Sugar": "1 cup", "Water": "1/2 cup", "Apricot": "2", "Almond Flavoring": "1 tblsp", "Grain Alcohol": "1/2 cup pure", "Brandy": "1 cup", "Food Coloring": "2 drops blue", "Glycerine": "1/2 tsp"}'
  ),
  (
    12794,
    'Angelica Liqueur',
    'Homemade Liqueur',
    'Collins Glass',
    'yuurps1472667672.jpg',
    'Combine all herbs, nuts and spices with vodka in a 1 quart or larger aging container. Cap tightly and shake daily for 2 weeks. Strain through a fine muslin cloth or coffee filter, discarding solids. Clean out aging container. Place liquid back in container. Place sugar and water in saucepan and stir to combine over medium heat. When sugar is completely dissolved, set aside and let cool. When cool combine with food coloring and add to liqueur liquid. Cap and allow to age and mellow in a cool, dark place for one month.',
    '{"Angelica Root": "3 tblsp chopped", "Almond": "1 tblsp chopped", "Allspice": "1 cracked", "Cinnamon": "1 one-inch", "Anise": "3-6 crushed", "Coriander": "1/8 tsp powdered", "Marjoram Leaves": "1 tblsp fresh chopped", "Vodka": "1.5 cup", "Sugar": "1/2 cup granulated", "Water": "1/4 cup", "Food Coloring": "1 drop green"}'
  ),
  (
    14564,
    'A Splash of Nash',
    'Shot',
    'Highball glass',
    'rsvtrr1472668201.jpg',
    'Drop shot glass with banana & melon liquers into a 9 oz hi- ball glass containing soda water and cranberry juice. Drink in one shot.',
    '{"Cranberry Juice": "2 oz", "Soda Water": "2 oz", "Midori Melon Liqueur": "0.5 oz", "Creme De Banane": "0.5 oz"}'
  ),
  (
    14578,
    'Amaretto Sunrise',
    'Ordinary Drink',
    'Collins Glass',
    'akcpsh1493070267.jpg',
    'Mix together the amaretto and orange juice. Pour into glass and then add the grenadine untill you see the sunrise.',
    '{"Amaretto": "1 cl", "Orange Juice": "4 oz", "Grenadine": "1/4 cl"}'
  ),
  (
    14584,
    'Arizona Stingers',
    'Cocktail',
    'Hurricane glass',
    'y7w0721493068255.jpg',
    'Place ice cubes in the hurricane glass . Add the 2 HEAPING shots of Absolute Vodka (Note: You can add as many shots of Absolute as you want!) Fill the rest of glass with the Arizona Icetea with lemon. Stir to mix using a spoon. Drink up and enjoy!!!!!!!',
    '{"Absolut Vodka": "2 shots", "Iced Tea": "12 oz lemon"}'
  ),
  (
    17118,
    'Arctic Mouthwash',
    'Punch / Party Drink',
    'Cocktail glass',
    'wqstwv1478963735.jpg',
    'Blend all ingredients in a blender on high until ice is finely crushed. It should be of a slushy consistency. Pour immediately and serve.',
    '{"Maui": "5 oz blue", "Mountain Dew": "5 oz", "Ice": "cubes"}'
  ),
  (
    178337,
    'Autumn Garibaldi',
    'Cocktail',
    'Cordial glass',
    'ne7re71604179012.jpg',
    'Pour all ingredients into a glass over ice and stir with a bar spoon. Garnish with some orange slices.',
    '{"Campari": "1 1/2 oz", "Orange Juice": "2 1/2 oz", "Ginger Beer": "2 1/2 oz", "Orange Peel": "Garnish with"}'
  ),
  (
    12862,
    'Aloha Fruit punch',
    'Punch / Party Drink',
    'Collins Glass',
    'wsyvrt1468876267.jpg',
    'Add 1/4 cup water to ginger root. Boil 3 minutes. Strain. Add the liquid to the guava, lemon and pineapple juices. Make a syrup of sugar and remaining water. Cool. Combine with juices and pineapple. Chill throroughly.',
    '{"Water": "3/4 cup", "Ginger": "2 tsp", "Guava Juice": "2 cups", "Lemon Juice": "1 1/2 tblsp", "Pineapple": "1 1/2 cup", "Sugar": "1 cup", "Pineapple Juice": "3-4 cups"}'
  ),
  (
    12864,
    'Apple Cider Punch',
    'Punch / Party Drink',
    'Collins Glass',
    'xrqxuv1454513218.jpg',
    'If you use the whole all spice and cloves, tie them in cheesecloth. Heat the mixture. Stir occasionally. If you want an alcoholic drink, rum would be nice.',
    '{"Apple Cider": "4 qt", "Brown Sugar": "1 cup", "Lemonade": "6 oz frozen", "Orange Juice": "6 oz frozen", "Cloves": "6 whole", "Allspice": "6 whole", "Nutmeg": "1 tsp ground", "Cinnamon": "3 sticks"}'
  ),
  (
    14372,
    'Absolut limousine',
    'Other/Unknown',
    'Collins Glass',
    'ssqpyw1472719844.jpg',
    'Fill Absolut into a glass. Add Lime juice. Add Ice and lime wedges.',
    '{"Absolut Citron": "2/3", "Lime Juice": "1/3", "Ice": "Fill with", "Tonic Water": "Top it up with"}'
  ),
  (
    14374,
    'Absolut Evergreen',
    'Other/Unknown',
    'Collins Glass',
    'wrxrxp1472812609.jpg',
    'Mix, pour over ice and top up with Bitter Lemon.',
    '{"Absolut Citron": "2/3 part", "Pisang Ambon": "1/3 part", "Ice": "cubes", "Bitter Lemon": "to Taste"}'
  ),
  (
    15597,
    'Absolut Stress #2',
    'Ordinary Drink',
    'Collins Glass',
    'xuyqrw1472811825.jpg',
    'Mix well. Garnish with Orange and Cherry. Enjoy',
    '{"Absolut Vodka": "1 1/2 oz", "Peach Schnapps": "1/2 oz", "Coconut Liqueur": "1/2 oz", "Cranberry Juice": "1 1/2 oz", "Pineapple Juice": "1 1/2 oz"}'
  ),
  (
    17020,
    'Auburn Headbanger',
    'Shot',
    'Shot glass',
    'vw7iv91493067320.jpg',
    'Mix in spread glass over ice. Strain and pour in shot glass. Sit down before shotting. ENJOY!!',
    '{"Jägermeister": "1 oz", "Goldschlager": "1 oz"}'
  ),
  (
    17831,
    'A Furlong Too Late',
    'Ordinary Drink',
    'Highball glass',
    'ssxvww1472669166.jpg',
    'Pour the rum and ginger beer into a highball glass almost filled with ice cubes. Stir well. Garnish with the lemon twist.',
    '{"Light Rum": "2 oz", "Ginger Beer": "4 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    11025,
    'Amaretto And Cream',
    'Ordinary Drink',
    'Cocktail glass',
    'dj8n0r1504375018.jpg',
    'Shake well with cracked ice, strain contents into a cocktail glass, and serve.',
    '{"Amaretto": "1 1/2 oz", "Light Cream": "1 1/2 oz"}'
  ),
  (
    14107,
    'Absolut Summertime',
    'Cocktail',
    'Collins glass',
    'trpxxs1472669662.jpg',
    'Add all ingredients except lemon to shaker filled with ice. Cover and shake vigorously. Strain contents into ice filled collins glass. Garnish with lemon.',
    '{"Absolut Citron": "1 1/2 oz", "Sweet And Sour": "3/4 oz", "Sprite": "1/2 oz", "Soda Water": "3 oz", "Lemon": "1 slice"}'
  ),
  (
    15200,
    'A Day at the Beach',
    'Ordinary Drink',
    'Highball glass',
    'trptts1454514474.jpg',
    'Shake Rum, Amaretto, and Orange Juice in a shaker filled with ice. Strain over ice into a highball glass. Add Grenadine and garnish with a Pineapple Wedge and a Strawberry.',
    '{"Coconut Rum": "1 oz", "Amaretto": "1/2 oz", "Orange Juice": "4 oz", "Grenadine": "1/2 oz"}'
  ),
  (
    16354,
    'Arizona Antifreeze',
    'Shot',
    'Shot glass',
    'dbtylp1493067262.jpg',
    'Pour all ingredients into shot glass and slam !!!!',
    '{"Vodka": "1/3 oz", "Midori Melon Liqueur": "1/3 oz", "Sweet And Sour": "1/3 oz"}'
  ),
  (
    14306,
    'Amaretto Stone Sour',
    'Other/Unknown',
    'Collins Glass',
    'xwryyx1472719921.jpg',
    'Shake and Serve over ice',
    '{"Amaretto": "1 part", "Sour Mix": "1 part", "Orange Juice": "1 part"}'
  ),
  (
    16943,
    'A Gilligan''s Island',
    'Cocktail',
    'Collins glass',
    'wysqut1461867176.jpg',
    'Shaken, not stirred!',
    '{"Vodka": "1 oz", "Peach Schnapps": "1 oz", "Orange Juice": "3 oz", "Cranberry Juice": "3 oz"}'
  ),
  (
    17094,
    'Alice in Wonderland',
    'Ordinary Drink',
    'Collins Glass',
    'g12lj41493069391.jpg',
    'Just mix the three ingredients one to one to one',
    '{"Amaretto": "1 shot", "Grand Marnier": "1 shot", "Southern Comfort": "1 shot"}'
  ),
  (
    17224,
    'Absolutely Fabulous',
    'Cocktail',
    'Champagne flute',
    'abcpwr1504817734.jpg',
    'Mix the Vodka and Cranberry juice together in a shaker and strain into a glass. Top up with Champagne.',
    '{"Vodka": "1 shot", "Cranberry Juice": "2 shots", "Champagne": "Top up with"}'
  ),
  (
    12710,
    'Apple Berry Smoothie',
    'Other/Unknown',
    'Highball Glass',
    'xwqvur1468876473.jpg',
    'Throw everything into a blender and liquify.',
    '{"Berries": "1 cup", "Apple": "2"}'
  ),
  (
    16134,
    'Absolutly Screwed Up',
    'Cocktail',
    'Collins glass',
    'yvxrwv1472669728.jpg',
    'Shake it up it tasts better that way, but you can stir it if you want. 6 of those and you will be wasted for the rest of the night.',
    '{"Absolut Citron": "1 shot", "Orange Juice": "1 shot", "Triple Sec": "1 shot", "Ginger Ale": "Fill to top"}'
  ),
  (
    17005,
    'A True Amaretto Sour',
    'Cocktail',
    'Old-fashioned glass',
    'rptuxy1472669372.jpg',
    'Rub the rim of an old fashioned glass with lemon, and dip repeatedly into granulated sugar until it has a good  frosted  rim. Shake a jigger of Amaretto with the juice of 1/2 a lemon. Strain into glass and add ice. Garnish with a Marachino Cherry.',
    '{"Amaretto": "1 jigger", "Lemon": "Juice of 1/2", "Ice": "to Taste", "Maraschino Cherry": "to Taste"}'
  ),
  (
    11010,
    'After Dinner Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'vtytxq1483387578.jpg',
    'Shake all ingredients (except lime wedge) with ice and strain into a cocktail glass. Add the wedge of lime and serve.',
    '{"Apricot Brandy": "1 oz", "Triple Sec": "1 oz", "Lime": "1"}'
  ),
  (
    11011,
    'After Supper Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'quyxwu1483387610.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Triple Sec": "1 oz", "Apricot Brandy": "1 oz", "Lemon Juice": "1/2 tsp"}'
  ),
  (
    16202,
    'Amaretto Sweet & Sour',
    'Punch / Party Drink',
    'Margarita/Coupette glass',
    'vswwus1472668546.jpg',
    'Fill the blender with 3/4 ice. Add sweet & sour mix to the top of the ice. Add about 1  of pineapple juice, 1/2  of melon liqeur, and 1/2 to 1/4  of amaretto. Then blend the mix until it is of margaritta consistency or thinner.',
    '{"Amaretto": "to Taste", "Sweet And Sour": "to Taste", "Midori Melon Liqueur": "to Taste", "Pineapple Juice": "to Taste"}'
  ),
  (
    17229,
    'Adios Amigos Cocktail',
    'Cocktail',
    'Martini Glass',
    '8nk2mp1504819893.jpg',
    'Shake together all the ingredients and strain into a cold glass.',
    '{"Rum": "1 shot", "Dry Vermouth": "1/2 shot", "Cognac": "1/2 shot", "Gin": "1/2 shot", "Fresh Lime Juice": "1/4 shot", "Sugar Syrup": "1/4 shot", "Water": "1/2 shot"}'
  ),
  (
    15675,
    'A midsummernight dream',
    'Ordinary Drink',
    'Collins Glass',
    'ysqvqp1461867292.jpg',
    'Mix the strawberrys in a blender Pour it together with the vodka,kirch and strawberry liquer over ice in a shaker. Shake well and pour in a highballglass. Fill up with the Russchian water',
    '{"Vodka": "2 oz", "Kirschwasser": "1 oz", "Strawberry Liqueur": "1 tsp", "Strawberries": "5", "Schweppes Russchian": "to Taste"}'
  ),
  (
    16958,
    'Apple Pie with A Crust',
    'Other/Unknown',
    'Collins Glass',
    'qspqxt1472720078.jpg',
    'Just mix the two liquids and sprinkle in the cinnamon. Serve either cold or heated.',
    '{"Apple Juice": "3 parts", "Malibu Rum": "1 part", "Cinnamon": "3 dashes"}'
  ),
  (
    17832,
    'A Night In Old Mandalay',
    'Ordinary Drink',
    'Highball glass',
    'vyrvxt1461919380.jpg',
    'In a shaker half-filled with ice cubes, combine the light rum, añejo rum, orange juice, and lemon juice. Shake well. Strain into a highball glass almost filled with ice cubes. Top with the ginger ale. Garnish with the lemon twist.',
    '{"Light Rum": "1 oz", "Añejo Rum": "1 oz", "Orange Juice": "1 oz", "Lemon Juice": "1/2 oz", "Ginger Ale": "3 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    16082,
    'Almond Chocolate Coffee',
    'Ordinary Drink',
    'Coffee mug',
    'jls02c1493069441.jpg',
    'Pour in order into coffee cup. Top with whipped creme and chocolate shcvings.',
    '{"Amaretto": "3/4 oz", "Dark Creme De Cacao": "1/2 oz", "Coffee": "8 oz"}'
  ),
  (
    14560,
    'A.D.M. (After Dinner Mint)',
    'Cocktail',
    'Irish coffee cup',
    'ruxuvp1472669600.jpg',
    'shake vigorously',
    '{"White Creme De Menthe": "1/2 oz", "Southern Comfort": "3/4 oz", "Vodka": "1/2 oz", "Hot Chocolate": "Fill with"}'
  ),
  (
    15024,
    'Absolutely Cranberry Smash',
    'Ordinary Drink',
    'Cocktail glass',
    'vqwstv1472811884.jpg',
    'Stir ingredients together. Serve over ice.',
    '{"Absolut Vodka": "2 oz", "Cranberry Juice": "4 oz", "Ginger Ale": "2 oz", "Ice": "Add"}'
  ),
  (
    16100,
    'Amaretto Stone Sour Alternative',
    'Other/Unknown',
    'Highball glass',
    'wutxqr1472720012.jpg',
    'Shake sour mix, tequila and amaretto with ice. Strain into highball glass. Add a splash of OJ. Garnish with orange slice and a cherry.',
    '{"Sour Mix": "2 oz", "Amaretto": "2 oz", "Tequila": "2 oz", "Orange Juice": "Add splash"}'
  ),
  (
    13332,
    'B-53',
    'Shot',
    'Collins Glass',
    'rwqxrv1461866023.jpg',
    'Layer the Kahlua, Sambucca and Grand Marnier into a shot glas in that order. Better than B-52',
    '{"Kahlua": "1/3 shot", "Sambuca": "1/3 shot", "Grand Marnier": "1/3 shot"}'
  ),
  (
    15853,
    'B-52',
    'Shot',
    'Shot glass',
    '5a3vg61504372070.jpg',
    'Layer ingredients into a shot glass. Serve with a stirrer.',
    '{"Baileys Irish Cream": "1/3", "Grand Marnier": "1/3", "Kahlua": "1/4"}'
  ),
  (
    17254,
    'Bijou',
    'Cocktail',
    'Cocktail glass',
    'rysb3r1513706985.jpg',
    'Stir in mixing glass with ice and strain',
    '{"Orange Bitters": "1 dash", "Green Chartreuse": "1 oz", "Gin": "1 oz", "Sweet Vermouth": "1 oz"}'
  ),
  (
    11149,
    'Boxcar',
    'Ordinary Drink',
    'Whiskey sour glass',
    'pwgtpa1504366376.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a sour glass.',
    '{"Gin": "1 1/2 oz", "Triple Sec": "1 oz", "Lemon Juice": "1 tsp", "Grenadine": "1/2 tsp", "Egg White": "1"}'
  ),
  (
    13222,
    'Big Red',
    'Shot',
    'Shot glass',
    'yqwuwu1441248116.jpg',
    'Pour ingredients into 1 ounce shot glass',
    '{"Irish Cream": "1/2 oz", "Goldschlager": "1/2 oz"}'
  ),
  (
    17195,
    'Bellini',
    'Ordinary Drink',
    'Champagne Flute',
    'eaag491504367543.jpg',
    'Pour peach purée into chilled flute, add sparkling wine. Stir gently.',
    '{"Champagne": "6 oz", "Peach Schnapps": "1 oz"}'
  ),
  (
    17210,
    'Bramble',
    'Ordinary Drink',
    'Old-Fashioned glass',
    'twtbh51630406392.jpg',
    'Fill glass with crushed ice. Build gin, lemon juice and simple syrup over. Stir, and then pour blackberry liqueur over in a circular fashion to create marbling effect. Garnish with two blackberries and lemon slice.',
    '{"Gin": "4 cl", "Lemon Juice": "1.5 cl", "Sugar Syrup": "1 cl", "Creme De Mure": "1.5 cl"}'
  ),
  (
    11060,
    'Balmoral',
    'Ordinary Drink',
    'Cocktail glass',
    'vysuyq1441206297.jpg',
    'In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.',
    '{"Scotch": "1 1/2 oz", "Sweet Vermouth": "1/2 oz", "Dry Vermouth": "1/2 oz", "Bitters": "2 dashes"}'
  ),
  (
    11120,
    'Bluebird',
    'Ordinary Drink',
    'Cocktail glass',
    '5jhyd01582579843.jpg',
    'In a mixing glass half-filled with crushed ice, combine the gin, triple sec, Curacao, and bitters. Stir well. Strain into a cocktail glass and garnish with the lemon twist and the cherry.',
    '{"Gin": "1 1/2 oz", "Triple Sec": "1/2 oz", "Blue Curacao": "1/2 oz", "Bitters": "2 dashes", "Maraschino Cherry": "1", "Lemon Peel": "1 twist of"}'
  ),
  (
    178310,
    'Brooklyn',
    'Cocktail',
    'Cocktail glass',
    'ojsezf1582477277.jpg',
    'Combine ingredients with ice and stir until well-chilled. Strain into a chilled cocktail glass.',
    '{"Rye Whiskey": "2 oz", "Dry Vermouth": "1 oz", "Maraschino Liqueur": "1/4 oz", "Angostura Bitters": "3 dashes", "Maraschino Cherry": "1"}'
  ),
  (
    11124,
    'Boomerang',
    'Ordinary Drink',
    'Cocktail glass',
    '3m6yz81504389551.jpg',
    'In a mixing glass half-filled with ice cubes, combine the gin, vermouth, bitters, and maraschino liqueur. Stir well. Strain into a cocktail glass and garnish with the cherry.',
    '{"Gin": "2 oz", "Dry Vermouth": "1/2 oz", "Bitters": "2 dashes", "Maraschino Liqueur": "1/2 tsp", "Maraschino Cherry": "1"}'
  ),
  (
    12572,
    'Bora Bora',
    'Cocktail',
    'Highball glass',
    'xwuqvw1473201811.jpg',
    'Prepare in a blender or shaker, serve in a highball glass on the rocks. Garnish with 1 slice of pineapple and one cherry.',
    '{"Pineapple Juice": "10 cl", "Passion Fruit Juice": "6 cl", "Lemon Juice": "1 cl", "Grenadine": "1 cl"}'
  ),
  (
    17209,
    'Barracuda',
    'Ordinary Drink',
    'Margarita glass',
    'jwmr1x1504372337.jpg',
    'Shake pour ingredients with ice. Strain into glass, top with Sparkling wine.',
    '{"Rum": "4.5 cl", "Galliano": "1.5 cl", "Pineapple Juice": "6 cl", "Lime Juice": " 1 dash", "Prosecco": "top up"}'
  ),
  (
    17035,
    'Buccaneer',
    'Beer',
    'Beer pilsner',
    'upvtyt1441249023.jpg',
    'Pour the corona into an 18oz beer glass pour the bacardi limon into the beer stir very gently',
    '{"Corona": "1", "Bacardi Limon": "1 shot"}'
  ),
  (
    17825,
    'Brigadier',
    'Cocktail',
    'Coupe Glass',
    'nl89tf1518947401.jpg',
    'Mix ingredients in a warmed mug and stir.',
    '{"Hot Chocolate": "4 oz", "Green Chartreuse": "1 oz", "Cherry Heering": "1 oz"}'
  ),
  (
    178311,
    'Broadside',
    'Cocktail',
    'Highball glass',
    'l2o6xu1582476870.jpg',
    'Half fill the glass with ice cubes. Crush the wormwood and add to ice. Pour rum, scotch and butters, then serve!',
    '{"151 Proof Rum": "1 shot", "Scotch": "1/2 shot", "Bitters": "3 drops", "Wormwood": "1 Fresh", "Ice": "cubes"}'
  ),
  (
    11106,
    'Blackthorn',
    'Ordinary Drink',
    'Cocktail glass',
    'dgj92f1616098672.jpg',
    'Stir sloe gin and vermouth with ice and strain into a cocktail glass. Add the twist of lemon peel and serve.',
    '{"Sweet Vermouth": "1 oz", "Sloe Gin": "1 1/2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    13395,
    'Bob Marley',
    'Shot',
    'Shot glass',
    'rrqrst1477140664.jpg',
    'Layer in a 2 oz shot glass or pony glass',
    '{"Midori Melon Liqueur": "1/2 oz", "Jägermeister": "1/2 oz", "Goldschlager": "1/2 oz"}'
  ),
  (
    14538,
    'Bumble Bee',
    'Shot',
    'Shot glass',
    'uwqpvv1461866378.jpg',
    'This is a layered shot. First pour the Bailey''s into the shot glass. Then take an upside down spoon and touch it to the inside wall of the glass. Carefully add the Kahlua. Repeat this process for the Sambuca. If done properly, the alcohol will stay separated and resemble a bumble bee. Enjoy!!!',
    '{"Baileys Irish Cream": "1/3 oz", "Kahlua": "1/3 oz", "Sambuca": "1/3 oz"}'
  ),
  (
    14730,
    'Bubble Gum',
    'Shot',
    'Shot glass',
    'spuurv1468878783.jpg',
    'Layer in order into a shot glass.',
    '{"Vodka": "1/4", "Banana Liqueur": "1/4", "Orange Juice": "1/4", "Peach Schnapps": "1/4"}'
  ),
  (
    16986,
    'Bible Belt',
    'Other/Unknown',
    'Highball glass',
    '6bec6v1503563675.jpg',
    'Mix all ingredients, and pour over ice.',
    '{"Southern Comfort": "2 oz", "Triple Sec": "1/2 oz", "Lime": "2 wedges", "Sour Mix": "2 oz"}'
  ),
  (
    17120,
    'Brain Fart',
    'Punch / Party Drink',
    'Punch bowl',
    'rz5aun1504389701.jpg',
    'Mix all ingredients together. Slowly and gently. Works best if ice is added to punch bowl and soda''s are very cold.',
    '{"Everclear": "1 fifth", "Vodka": "1 fifth Smirnoff red label", "Mountain Dew": "2 L", "Surge": "2 L", "Lemon Juice": "1 small bottle", "Rum": "1 pint"}'
  ),
  (
    11113,
    'Bloody Mary',
    'Ordinary Drink',
    'Old-fashioned glass',
    't6caa21582485702.jpg',
    'Stirring gently, pour all ingredients into highball glass. Garnish.',
    '{"Vodka": "1 1/2 oz", "Tomato Juice": "3 oz", "Lemon Juice": "1 dash", "Worcestershire Sauce": "1/2 tsp", "Tabasco Sauce": "2-3 drops", "Lime": "1 wedge"}'
  ),
  (
    11117,
    'Blue Lagoon',
    'Ordinary Drink',
    'Highball glass',
    '5wm4zo1582579154.jpg',
    'Pour vodka and curacao over ice in a highball glass. Fill with lemonade, top with the cherry, and serve.',
    '{"Vodka": "1 oz", "Blue Curacao": "1 oz", "Lemonade": "to Taste", "Cherry": "to Taste"}'
  ),
  (
    11129,
    'Boston Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'kxlgbi1504366100.jpg',
    'Shake juice of lemon, powdered sugar, blended whiskey, and egg white with cracked ice and strain into a whiskey sour glass. Add the slice of lemon, top with the cherry, and serve.',
    '{"Blended Whiskey": "2 oz", "Lemon": "1 slice", "Powdered Sugar": "1 tsp", "Egg White": "1", "Cherry": "1"}'
  ),
  (
    11164,
    'Brandy Flip',
    'Ordinary Drink',
    'Whiskey sour glass',
    '6ty09d1504366461.jpg',
    'In a shaker half-filled with ice cubes, combine the brandy, egg, sugar, and cream. Shake well. Strain into a sour glass and garnish with the nutmeg.',
    '{"Brandy": "2 oz", "Egg": "1 whole", "Sugar": "1 tsp superfine", "Light Cream": "1/2 oz", "Nutmeg": "1/8 tsp grated"}'
  ),
  (
    11170,
    'Brandy Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'b1bxgq1582484872.jpg',
    'Shake brandy, juice of lemon, and powdered sugar with ice and strain into a whiskey sour glass. Decorate with the lemon slice, top with the cherry, and serve.',
    '{"Brandy": "2 oz", "Lemon": "1/2 slice", "Powdered Sugar": "1/2 tsp", "Cherry": "1"}'
  ),
  (
    13282,
    'Black & Tan',
    'Beer',
    'Pint glass',
    'rwpswp1454511017.jpg',
    'Fill pint glass half full with Bass. Next pour Guiness over a spoon slowly until glass is full. If done correctly the Guiness will stay on top and the Bass on bottom hence the name Black & Tan.',
    '{"Ale": "1 part Bass pale", "Guinness Stout": "1 part"}'
  ),
  (
    13405,
    'Brainteaser',
    'Shot',
    'Shot Glass',
    'ruywtq1461866066.jpg',
    'layered erin first, then sambuca and then avocart(should sit in middle of other two. To drink: use a straw to suck up avocart then shot the rest and then suck fumes up through straw.',
    '{"Sambuca": "30 ml white", "Erin Cream": "30 ml", "Advocaat": "5 ml"}'
  ),
  (
    15511,
    'Baby Eskimo',
    'Shake',
    'Collins Glass',
    'wywrtw1472720227.jpg',
    'Leave ice-cream out for about 10 minutes. Add ingredients in order, stir with chopstick (butter knife or spoon works too). Consume immediately and often. Nice and light, great for following a heavy drink.',
    '{"Kahlua": "2 oz", "Milk": "8 oz", "Vanilla Ice-cream": "2 scoops"}'
  ),
  (
    17220,
    'Butter Baby',
    'Shake',
    'Beer mug',
    '1xhjk91504783763.jpg',
    'Blend together in a blender. Serve in a chilled Beer mug with Fresh Blueberries and caramel for topping.',
    '{"Vanilla Ice-cream": "2 scoops", "Butterscotch Schnapps": "1 part", "Milk": "full glass", "Vodka": "2 parts"}'
  ),
  (
    17267,
    'Bahama Mama',
    'Cocktail',
    'Highball glass',
    'tyb4a41515793339.jpg',
    'Add 2 parts club soda or more or less to taste. Mix it all together and pour over a bunch of ice. Drink with a straw.',
    '{"Rum": "3 parts", "Dark Rum": "1 part", "Banana Liqueur": "1 part", "Grenadine": "1 part", "Pineapple Juice": "2 parts", "Orange Juice": "2 parts", "Sweet And Sour": "1 part"}'
  ),
  (
    178317,
    'Bee''s Knees',
    'Cocktail',
    'Martini Glass',
    'tx8ne41582475326.jpg',
    'Shake ingredients with crushed ice Garnish with orange peel',
    '{"Gold Rum": "6 cl", "Orange Juice": "2 cl", "Lime Juice": "2 cl", "Triple Sec": "2 jiggers"}'
  ),
  (
    11112,
    'Bloody Maria',
    'Ordinary Drink',
    'Old-fashioned glass',
    'yz0j6z1504389461.jpg',
    'Shake all ingredients (except lemon slice) with cracked ice and strain into an old-fashioned glass over ice cubes. Add the slice of lemon and serve.',
    '{"Tequila": "1 oz", "Tomato Juice": "2 oz", "Lemon Juice": "1 dash", "Tabasco Sauce": "1 dash", "Celery Salt": "1 dash", "Lemon": "1 slice"}'
  ),
  (
    11147,
    'Bourbon Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'dms3io1504366318.jpg',
    'In a shaker half-filled with ice cubes, combine the bourbon, lemon juice, and sugar. Shake well. Strain into a whiskey sour glass, garnish with the orange slice and cherry.',
    '{"Bourbon": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1/2 tsp superfine", "Orange": "1", "Maraschino Cherry": "1"}'
  ),
  (
    12876,
    'Berry Deadly',
    'Punch / Party Drink',
    'Collins Glass',
    'zk74k21593351065.jpg',
    'Add all ingredients to large bowl. Stir gently. Serve chilled.',
    '{"Everclear": "2 pint", "Wine": "1 bottle Boone Strawberry Hill", "Orange Juice": "1/2 gal", "Kool-aid": "1 gal Tropical Berry"}'
  ),
  (
    13066,
    'Bruce''s Puce',
    'Shot',
    'Shot glass',
    'svsvqv1473344558.jpg',
    'In a regular-sized shot glass, layer, with a spoon or cherry, the grenadine , the Kahlua , then the Bailey''s Irish cream in equal portions. It goes down really smooth ,and you don''t even need a chaser. It tastes just like chocolate milk.(Really!)',
    '{"Grenadine": "to Taste", "Kahlua": "to Taste", "Baileys Irish Cream": "to Taste"}'
  ),
  (
    14071,
    'Belgian Blue',
    'Soft Drink',
    'Highball glass',
    'jylbrq1582580066.jpg',
    'Just pour all ingredients in the glass and stir...',
    '{"Vodka": "2 cl", "Coconut Liqueur": "1 cl", "Blue Curacao": "1 cl", "Sprite": "Fill with"}'
  ),
  (
    17251,
    'Boulevardier',
    'Cocktail',
    'Martini Glass',
    'km84qi1513705868.jpg',
    'Stir with ice, strain, garnish and serve.',
    '{"Campari": "1 oz", "Sweet Vermouth": "1 oz", "Rye Whiskey": "1 1/4 oz", "Orange Peel": "1"}'
  ),
  (
    178312,
    'Bloody Punch',
    'Punch / Party Drink',
    'Punch bowl',
    '5yhd3n1571687385.jpg',
    'Place the thawed strawberries in a large bowl. Mash them with a fork to ensure no large chunks. Step 2 In a punch bowl or pitcher, combine mashed strawberries, lime pulp and soda. Mix well. Step 3 Add blueberries and raisins. They will float and look like bugs in the punch.',
    '{"Vodka": "10 shots", "Strawberries": "3 cups", "Lime Juice": "1/2 cup", "Lemon-lime Soda": "12 oz", "Raisins": "1 cup", "Blueberries": "1 cup"}'
  ),
  (
    11102,
    'Black Russian',
    'Ordinary Drink',
    'Old-fashioned glass',
    '8oxlqf1606772765.jpg',
    'Pour the ingredients into an old fashioned glass filled with ice cubes. Stir gently.',
    '{"Coffee Liqueur": "3/4 oz", "Vodka": "1 1/2 oz"}'
  ),
  (
    11119,
    'Blue Mountain',
    'Ordinary Drink',
    'Old-fashioned glass',
    'bih7ln1582485506.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into an old-fashioned glass almost filled with ice cubes.',
    '{"Añejo Rum": "1 1/2 oz", "Tia Maria": "1/2 oz", "Vodka": "1/2 oz", "Orange Juice": "1 oz", "Lemon Juice": "1 tsp"}'
  ),
  (
    11146,
    'Bourbon Sling',
    'Ordinary Drink',
    'Highball glass',
    '3s36ql1504366260.jpg',
    'In a shaker half-filled with ice cubes, combine the sugar, water, lemon juice, and bourbon. Shake well. Strain well. Strain into a highball glass. Garnish with the lemon twist.',
    '{"Sugar": "1 tsp superfine", "Water": "2 tsp", "Lemon Juice": "1 oz", "Bourbon": "2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    14356,
    'Blind Russian',
    'Shake',
    'Collins glass',
    'wxuqvr1472720408.jpg',
    'Fill glass with ice. Add all liquers. Add milk. shake.',
    '{"Baileys Irish Cream": "3/4 oz", "Godiva Liqueur": "3/4 oz", "Kahlua": "3/4 oz", "Butterscotch Schnapps": "1/2 oz", "Milk": " to fill"}'
  ),
  (
    16998,
    'Bruised Heart',
    'Shot',
    'Shot glass',
    '7if5kq1503564209.jpg',
    'Pour all ingredients in a mixing tin over ice, stir, and strain into shot glass',
    '{"Vodka": "1/2 oz", "Chambord Raspberry Liqueur": "1/2 oz", "Peachtree Schnapps": "1/2 oz", "Cranberry Juice": "1/2 oz"}'
  ),
  (
    17079,
    'Baby Guinness',
    'Shot',
    'Shot glass',
    'rvyvxs1473482359.jpg',
    'Pour Kahlua, almost filling shot glass. Then, carefully pour Baileys, using wall of shot glass. This will give the  Guinness  its  head .',
    '{"Kahlua": "2 1/2 oz", "Baileys Irish Cream": "1/2 oz"}'
  ),
  (
    17242,
    'Bombay Cassis',
    'Cocktail',
    'Balloon Glass',
    'h1e0e51510136907.jpg',
    'Add the Bombay Sapphire, Crème de Cassis and lime juice to a balloon glass and swirl well to mix. Fill the glass with good quality cubed ice. Top up with chilled and freshly opened Fever-Tree Ginger Beer. Gently stir to combine, top with a gently squeezed lime wedge and finish with a fresh ginger slice.',
    '{"Gin": "50 ml", "Creme De Cassis": "20 ml", "Fresh Lime Juice": "15 ml", "Ginger Beer": "75 ml", "Lime": "1", "Ginger": "1 long strip"}'
  ),
  (
    178331,
    'Bounty Hunter',
    'Cocktail',
    'Margarita glass',
    't8bgxl1596018175.jpg',
    'Add the spirits into a shaker as well as the pineapple juice, strain into a Margarita glass. Top with Prosecco and garnish with Blueberries.',
    '{"Rum": "1 shot", "Coconut Liqueur": "1 shot", "Blueberries": "Garnish with", "Pineapple Juice": "Dash", "Prosecco": "Top"}'
  ),
  (
    11118,
    'Blue Margarita',
    'Ordinary Drink',
    'Cocktail glass',
    'bry4qh1582751040.jpg',
    'Rub rim of cocktail glass with lime juice. Dip rim in coarse salt. Shake tequila, blue curacao, and lime juice with ice, strain into the salt-rimmed glass, and serve.',
    '{"Tequila": "1 1/2 oz", "Blue Curacao": "1 oz", "Lime Juice": "1 oz", "Salt": "Coarse"}'
  ),
  (
    11128,
    'Boston Sidecar',
    'Ordinary Drink',
    'Cocktail glass',
    'qzs5d11504365962.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "3/4 oz", "Brandy": "3/4 oz", "Triple Sec": "3/4 oz", "Lime": "Juice of 1/2"}'
  ),
  (
    11157,
    'Brandy Cobbler',
    'Ordinary Drink',
    'Old-fashioned glass',
    '5xgu591582580586.jpg',
    'In an old-fashioned glass, dissolve the sugar in the club soda. Add crushed ice until the glass is almost full. Add the brandy. Stir well. Garnish with the cherry and the orange and lemon slices.',
    '{"Sugar": "1 tsp superfine", "Club Soda": "3 oz", "Lemon": "1", "Brandy": "2 oz", "Maraschino Cherry": "1", "Orange": "1"}'
  ),
  (
    17268,
    'Blue Hurricane',
    'Cocktail',
    'Highball glass',
    'nwx02s1515795822.jpg',
    'If each part is 1/2 oz then use about 2.5 cups of ice. Blend it all together. Drink it with a big straw if you have one.',
    '{"Rum": "4 parts", "Dark Rum": "2 parts", "Passoa": "1 part", "Blue Curacao": "1 part", "Sweet And Sour": "6 parts", "Ice": "cubes"}'
  ),
  (
    11064,
    'Banana Daiquiri',
    'Ordinary Drink',
    'Champagne flute',
    'k1xatq1504389300.jpg',
    'Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.',
    '{"Light Rum": "1 1/2 oz", "Triple Sec": "1 tblsp", "Banana": "1", "Lime Juice": "1 1/2 oz", "Sugar": "1 tsp", "Cherry": "1"}'
  ),
  (
    16176,
    'Bellini Martini',
    'Ordinary Drink',
    'Cocktail glass',
    '3h9wv51504389379.jpg',
    'Add ice cubes to shaker. Add vodka. Add peach schnapps. Add peach nectar. Shake. Strain into glass. Add lemon twist peel.',
    '{"Ice": "8 cubes", "Vodka": "3 oz", "Peach Nectar": "1.5 oz", "Peach Schnapps": "1.5 oz", "Lemon Peel": "1"}'
  ),
  (
    16403,
    'Black and Brown',
    'Beer',
    'Beer pilsner',
    'wwuvxv1472668899.jpg',
    'CAREFULLY to avoid explosive head formation: Pour Beer glass half full of favorite rootbeer and top off with Guinness.',
    '{"Guinness Stout": "1/2", "Root Beer": "1/2"}'
  ),
  (
    178320,
    'Banana Cream Pi',
    'Cocktail',
    'Wine Glass',
    'm5p67n1582474609.jpg',
    'Serve over ice.',
    '{"Malibu Rum": "1 oz", "Banana Liqueur": "1 oz", "Pineapple Juice": "Top"}'
  ),
  (
    11016,
    'Brandy Alexander',
    'Ordinary Drink',
    'Whiskey Glass',
    'mlyk1i1606772340.jpg',
    'Shake all ingredients (except nutmeg) with ice and strain contents into a cocktail glass. Sprinkle nutmeg on top and serve.',
    '{"Brandy": "1 oz", "Creme De Cacao": "1 oz white", "Light Cream": "1 oz", "Nutmeg": "to Taste"}'
  ),
  (
    11084,
    'Bermuda Highball',
    'Ordinary Drink',
    'Highball glass',
    'qrvtww1441206528.jpg',
    'Pour brandy, gin, and dry vermouth into a highball glass over ice cubes. Fill with carbonated water and stir. Add the twist of lemon and serve. (Ginger ale may be substituted for carbonated water, if preferred.)',
    '{"Brandy": "3/4 oz", "Gin": "3/4 oz", "Dry Vermouth": "3/4 oz", "Carbonated Water": "to Taste", "Lemon Peel": "to Taste"}'
  ),
  (
    17183,
    'Bacardi Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'n433t21504348259.jpg',
    'Shake together with ice. Strain into glass and serve.',
    '{"Light Rum": "1 3/4 oz Bacardi", "Lime Juice": "1 oz", "Sugar Syrup": "1/2 tsp", "Grenadine": "1 dash"}'
  ),
  (
    16295,
    'Bleeding Surgeon',
    'Soft Drink',
    'Collins glass',
    'usuvvr1472719118.jpg',
    'Pour Shot of Rum over slice of orange. Fill the remaining space in glass half way full of surge or similar drink. Finish off glass with cranberry juice. Be carefull, warm surge may foam over the glass.',
    '{"Dark Rum": "1 shot", "Orange": "1 slice", "Surge": "1/2 glass", "Cranberry Juice": "1/2 glass"}'
  ),
  (
    178336,
    'Blueberry Mojito',
    'Cocktail',
    'Highball glass',
    '07iep51598719977.jpg',
    'Muddle the blueberries with the other ingredients and serve in a highball glass. Garnish with mint and a half slice of lime.',
    '{"Dark Rum": "2 shots", "Lime Juice": "1 shot", "Sugar": "Dash", "Blueberries": "Whole", "Lemon-lime Soda": "Top"}'
  ),
  (
    178356,
    'Butterfly Effect',
    'Cocktail',
    'Hurricane glass',
    'ht3hnk1619704289.jpg',
    'Grab your boston tin, fill it with cubes ice and then simply chuck in all your ingredients apart from your lemonade. Now it’s time to shake what your mama gave you until all your ingredients are blended to perfection. Add some cubes of ice to your hurricane glass, give them a swill to cool the whole thing down and then strain your raspberry vodka cocktail of wonder into the glass. Top with lemonade and chuck a sprig of mint on top for garnish. You can either get drinking at this point or go and try and grab a few butterflies to finish, the choice really is yours.',
    '{"Raspberry Vodka": "50 ml", "Cranberry Juice": "25 ml", "Lemonade": "25 ml", "Blue Curacao": "10 ml", "Sugar Syrup": "10 ml", "Lime Juice": "Dash", "Mint": "Sprig"}'
  ),
  (
    12654,
    'Banana Milk Shake',
    'Shake',
    'White wine glass',
    'rtwwsx1472720307.jpg',
    'Blend very well, preferably in a household mixer. Serve in a wine glass, garnish with whipped cream and a piece of banana.',
    '{"Milk": "10 cl cold", "Orange Juice": "4 cl", "Sugar Syrup": "2 tsp", "Banana": "1/2"}'
  ),
  (
    13068,
    'Brave Bull Shooter',
    'Shot',
    'Shot glass',
    'yrtypx1473344625.jpg',
    'Pour Tabasco into bottom of shot glass and fill with tequila.',
    '{"Tequila": "1/2 oz", "Tabasco Sauce": "1/2 oz"}'
  ),
  (
    17184,
    'Between The Sheets',
    'Ordinary Drink',
    'Cocktail glass',
    'of1rj41504348346.jpg',
    'Pour all ingredients into shaker with ice cubes, shake, strain into chilled cocktail glass.',
    '{"Brandy": "1 oz", "Light Rum": "1 oz", "Triple Sec": "1 oz", "Lemon Juice": "1 oz"}'
  ),
  (
    15951,
    'Black Forest Shake',
    'Shake',
    'Collins Glass',
    'xxtxsu1472720505.jpg',
    'In a blender put ice cubes, chocolate syrup, cherry brandy, vodka, and milk. Blend very well.',
    '{"Ice": "cubes", "Chocolate Syrup": "to Taste", "Cherry Brandy": "to Taste", "Vodka": "to Taste", "Milk": "to Taste"}'
  ),
  (
    11121,
    'Bobby Burns Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'km6se51484411608.jpg',
    'Stir all ingredients (except lemon peel) with ice and strain into a cocktail glass. Add the twist of lemon peel and serve.',
    '{"Sweet Vermouth": "1 1/2 oz", "Scotch": "1 1/2 oz", "Benedictine": "1 1/4 tsp", "Lemon Peel": "1 twist of"}'
  ),
  (
    14510,
    'Bailey''s Dream Shake',
    'Soft Drink',
    'Collins glass',
    'qxrvqw1472718959.jpg',
    'Blend ingredients for 30 seconds. Definitely refreshing for a hot summer''s day !',
    '{"Baileys Irish Cream": "2 oz", "Vanilla Ice-cream": "2 scoops", "Cream": "to Taste"}'
  ),
  (
    12656,
    'Banana Strawberry Shake',
    'Shake',
    'Highball Glass',
    'vqquwx1472720634.jpg',
    'Blend all together in a blender until smooth.',
    '{"Strawberries": "1/2 lb frozen", "Banana": "1 frozen", "Yoghurt": "1 cup plain", "Milk": "1 cup", "Honey": " to taste"}'
  ),
  (
    17221,
    'Boozy Snickers Milkshake',
    'Shake',
    'Mason jar',
    '861tzm1504784164.jpg',
    'Place the snickers bars in a plastic bag and roll over them with a rolling pin until crushed. Add crushed snickers pieces, ice cream, milk, caramel sauce, chocolate sauce, and chocolate liquor to a blender. Blend until shake is thick and frothy. Pour into glasses and top with chocolate liquor and whip cream.',
    '{"Vanilla Ice-cream": "3 cups", "Milk": "1 cup", "Godiva Liqueur": "1/2 cup", "Whipped Cream": "for topping", "Caramel Sauce": "4 tablespoons", "Chocolate Sauce": "4 tablespoons", "Mini-snickers Bars": "15"}'
  ),
  (
    12708,
    'Banana Cantaloupe Smoothie',
    'Other/Unknown',
    'Highball Glass',
    'uqxqsy1468876703.jpg',
    'Juice cantaloupe, pour juice into blender, add banana, and liquify.',
    '{"Cantaloupe": "Juice of 1/2", "Banana": "1"}'
  ),
  (
    16447,
    'Brandon and Will''s Coke Float',
    'Soft Drink',
    'Beer mug',
    'xspxyr1472719185.jpg',
    'Scoop two large scoops of vanilla ice-cream into frosted beer mug. Next, add 2 ounces Maker''s Mark. Then, pour in coke. Gently stir and enjoy.',
    '{"Vanilla Ice-cream": "2 scoops", "Coca-cola": "1 can", "Bourbon": "2 oz"}'
  ),
  (
    12658,
    'Banana Strawberry Shake Daiquiri',
    'Shake',
    'Cocktail Glass',
    'uvypss1472720581.jpg',
    'Blend all together in a blender until smooth.',
    '{"Strawberries": "1/2 lb frozen", "Banana": "1 frozen", "Apple Juice": "2 cups fresh"}'
  ),
  (
    17185,
    'Casino',
    'Ordinary Drink',
    'Cocktail glass',
    '1mvjxg1504348579.jpg',
    'Pour all ingredients into shaker with ice cubes. Shake well. Strain into chilled cocktail glass. Garnish with a lemon twist and a maraschino cherry. Serve without a straw.',
    '{"Gin": "2 oz", "Maraschino Liqueur": "1/4 tsp", "Lemon Juice": "1/4 tsp", "Orange Bitters": "2 dashes", "Cherry": "1"}'
  ),
  (
    11202,
    'Caipirinha',
    'Ordinary Drink',
    'Old-fashioned glass',
    'jgvn7p1582484435.jpg',
    'Place lime and sugar into old fashioned glass and muddle (mash the two ingredients together using a muddler or a wooden spoon). Fill the glass with ice and add the Cachaça.',
    '{"Sugar": "2 tsp", "Lime": "1", "Cachaca": "2 1/2 oz"}'
  ),
  (
    11239,
    'Cherry Rum',
    'Ordinary Drink',
    'Cocktail glass',
    'twsuvr1441554424.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "1 1/4 oz", "Cherry Brandy": "1 1/2 tsp", "Light Cream": "1 tblsp"}'
  ),
  (
    11288,
    'Cuba Libre',
    'Ordinary Drink',
    'Highball glass',
    'wmkbfj1606853905.jpg',
    'Build all ingredients in a Collins glass filled with ice. Garnish with lime wedge.',
    '{"Light Rum": "2 oz", "Lime": "Juice of 1/2", "Coca-cola": "to Taste"}'
  ),
  (
    13751,
    'Cuba Libra',
    'Ordinary Drink',
    'Highball glass',
    'ck6d0p1504388696.jpg',
    'Fill tall glass with ice cubes. Add rum. Rub cut edge of lime on rim of glass then squeeze juice into glass. Fill with Coca-Cola. Garnish with lime slice. Enjoy!',
    '{"Dark Rum": "1-2 shot", "Lime": "Squeeze", "Coca-cola": "Fill with", "Ice": "to Taste"}'
  ),
  (
    14181,
    'Cafe Savoy',
    'Coffee / Tea',
    'Coffee mug',
    'vqwptt1441247711.jpg',
    'Fill mug almost to top with coffee.Add milk, triple sec and brandy. Stir.',
    '{"Coffee": "to Taste", "Milk": "1/2 oz", "Triple Sec": "1/2 oz", "Brandy": "to Taste"}'
  ),
  (
    14608,
    'Cream Soda',
    'Cocktail',
    'Highball glass',
    'yqstxr1479209367.jpg',
    'Pour 1oz of Spiced Rum into a highball glass with ice. Fill with Ginger Ale.',
    '{"Spiced Rum": "1 oz", "Ginger Ale": "to Taste"}'
  ),
  (
    17830,
    'Corn n Oil',
    'Cocktail',
    'Old-fashioned glass',
    'pk6dwi1592767243.jpg',
    'Cut the half lime in half again. Add the lime, falernum, and bitters to a rocks glass. Muddle. Add the rum. (Aged Barbados rum such as Plantation 5 Year is recommended). Add ice and stir. Float the blackstrap rum on top. Serve with a straw.',
    '{"Lime": "1/2", "Falernum": "1/3 oz", "Angostura Bitters": "2 dashes", "Añejo Rum": "1 oz", "Blackstrap Rum": "1 oz"}'
  ),
  (
    11222,
    'Casa Blanca',
    'Ordinary Drink',
    'Cocktail glass',
    'usspxq1441553762.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "2 oz", "Triple Sec": "1 1/2 tsp", "Lime Juice": "1 1/2 tsp", "Maraschino Liqueur": "1 1/2 tsp"}'
  ),
  (
    17186,
    'Clover Club',
    'Ordinary Drink',
    'Cocktail glass',
    't0aja61504348715.jpg',
    'Dry shake ingredients to emulsify, add ice, shake and served straight up.',
    '{"Gin": "1 1/2 oz", "Grenadine": "2 tsp", "Lemon": "Juice of 1/2", "Egg White": "1"}'
  ),
  (
    17135,
    'Citrus Coke',
    'Soft Drink',
    'Highball Glass',
    'uyrvut1479473214.jpg',
    'Pour half of coke in a glass. Then add Bacardi and top it off with the remaining coke. Stir and drink up!',
    '{"Bacardi Limon": "1 part", "Coca-cola": "2 parts"}'
  ),
  (
    11242,
    'Chicago Fizz',
    'Ordinary Drink',
    'Highball glass',
    'qwvwqr1441207763.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Light Rum": "1 oz", "Port": "1 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Egg White": "1", "Carbonated Water": "to Taste"}'
  ),
  (
    11251,
    'City Slicker',
    'Ordinary Drink',
    'Cocktail glass',
    'dazdlg1504366949.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Brandy": "2 oz", "Triple Sec": "1/2 oz", "Lemon Juice": "1 tblsp"}'
  ),
  (
    12800,
    'Coffee-Vodka',
    'Homemade Liqueur',
    'Collins Glass',
    'qvrrvu1472667494.jpg',
    'Boil water and sugar until dissolved. Turn off heat. Slowly add dry instant coffee and continue stirring. Add a chopped vanilla bean to the vodka, then combine the cooled sugar syrup and coffee solution with the vodka. Cover tightly and shake vigorously each day for 3 weeks. Strain and filter. Its also best to let the sugar mixture cool completely so the vodka won''t evaporate when its added. If you like a smoother feel to the liqueur you can add about 1 teaspoon of glycerine to the finished product.',
    '{"Water": "2 cups", "Sugar": "2 cups white", "Coffee": "1/2 cup instant", "Vanilla": "1/2", "Vodka": "1 1/2 cup", "Caramel Coloring": "to Taste"}'
  ),
  (
    13206,
    'Caipirissima',
    'Ordinary Drink',
    'Collins Glass',
    'yd47111503565515.jpg',
    'Same as Caipirinha but instead of cachaca you add WHITE RUM. It''s great!!!!!!!!',
    '{"Lime": "2", "Sugar": "2 tblsp", "White Rum": "2-3 oz", "Ice": "crushed"}'
  ),
  (
    16047,
    'Campari Beer',
    'Beer',
    'Beer mug',
    'xsqrup1441249130.jpg',
    'Use a 15 oz glass. Add Campari first. Fill with beer.',
    '{"Lager": "1 bottle", "Campari": "1 1/2 cl"}'
  ),
  (
    17196,
    'Cosmopolitan',
    'Cocktail',
    'Cocktail glass',
    'kpsajh1504368362.jpg',
    'Add all ingredients into cocktail shaker filled with ice. Shake well and double strain into large cocktail glass. Garnish with lime wheel.',
    '{"Absolut Citron": "1 1/4 oz", "Lime Juice": "1/4 oz", "Cointreau": "1/4 oz", "Cranberry Juice": "1/4 cup"}'
  ),
  (
    11224,
    'Casino Royale',
    'Ordinary Drink',
    'Whiskey sour glass',
    '3qpv121504366699.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a sour glass.',
    '{"Gin": "2 oz", "Lemon Juice": "1/2 oz", "Maraschino Liqueur": "1 tsp", "Orange Bitters": "1 dash", "Egg Yolk": "1"}'
  ),
  (
    11255,
    'Clove Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'qxvtst1461867579.jpg',
    'Stir all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Sweet Vermouth": "1 oz", "Sloe Gin": "1/2 oz", "Wine": "1/2 oz Muscatel"}'
  ),
  (
    12798,
    'Coffee Liqueur',
    'Homemade Liqueur',
    'Collins Glass',
    'ryvtsu1441253851.jpg',
    'Combine coffee, sugar and water. Simmer 1 hour and let cool. Add vanilla and vodka. Age in sealed jar 2 to 3 weeks.',
    '{"Coffee": "10 tblsp instant", "Vanilla Extract": "4 tblsp", "Sugar": "2 1/2 cups", "Vodka": "1 qt", "Water": "2 1/2 cups"}'
  ),
  (
    13328,
    'Chocolate Milk',
    'Shot',
    'Shot Glass',
    'j6q35t1504889399.jpg',
    'Put the milk in the bottom, pour the Liquer on top and add the dash of amaretto. Do not mix. SLAM IT!',
    '{"Chocolate Liqueur": "1/2 shot", "Milk": "1/2 shot", "Amaretto": "1 dash"}'
  ),
  (
    17108,
    'Coke and Drops',
    'Soft Drink',
    'Cocktail glass',
    'yrtxxp1472719367.jpg',
    'Take a glass, pour the Coke in the glass, then you take 7 drops of lemon juice. Granish with a lemon slice on the rim of the glass.',
    '{"Coca-cola": "1 dl", "Lemon Juice": "7 drops"}'
  ),
  (
    17250,
    'Corpse Reviver',
    'Cocktail',
    'Cocktail glass',
    'gifgao1513704334.jpg',
    'Shake, strain, straight up, cocktail glass rinsed with absinthe',
    '{"Gin": "3/4 oz", "Triple Sec": "3/4 oz", "Lillet Blanc": "3/4 oz", "Lemon Juice": "3/4 oz", "Absinthe": "1 dash"}'
  ),
  (
    12734,
    'Chocolate Drink',
    'Cocoa',
    'Coffee mug',
    'q7w4xu1487603180.jpg',
    'Melt the bar in a small amount of boiling water. Add milk. Cook over low heat, whipping gently (with a whisk, i would assume) until heated well. Don''t let it boil! Serve in coffee mug.',
    '{"Chocolate": "125 gr", "Milk": "3/4 L", "Water": "to Taste"}'
  ),
  (
    12808,
    'Creme de Menthe',
    'Homemade Liqueur',
    'Collins Glass',
    'yxswtp1441253918.jpg',
    'Bring sugar and water to a boil and simmer for 10 minutes. Cool. Add the remaining ingredients and stir. Cover and let ripen for 1 month.',
    '{"Sugar": "8 cups", "Water": "6 cups", "Grain Alcohol": "1 pint", "Peppermint Extract": "1 oz pure", "Food Coloring": "1 tblsp green"}'
  ),
  (
    12890,
    'Cranberry Punch',
    'Punch / Party Drink',
    'Punch Bowl',
    'mzgaqu1504389248.jpg',
    'Combine first four ingredients. Stir until sugar is dissolved, chill. Then add ginger ale just before serving. Add ice ring to keep punch cold.',
    '{"Cranberry Juice": "4 cups", "Sugar": "1 1/2 cup", "Pineapple Juice": "4 cups", "Almond Flavoring": "1 tblsp", "Ginger Ale": "2 qt"}'
  ),
  (
    15615,
    'Chocolate Monkey',
    'Shake',
    'Parfait glass',
    'tyvpxt1468875212.jpg',
    'blend liqeuors with ice-cream, milk and syrup. pour into parfait glass, top with whipped cream and garnish with banana and cherry.',
    '{"Banana Liqueur": "1 shot", "Creme De Cacao": "2 shots", "Chocolate Ice-cream": "2 scoops", "Chocolate Syrup": "1 oz", "Chocolate Milk": "4 oz", "Whipped Cream": "1", "Cherry": "1", "Banana": "1 piece"}'
  ),
  (
    12802,
    'Cranberry Cordial',
    'Homemade Liqueur',
    'Collins Glass',
    'qtspsx1472667392.jpg',
    'Place the chopped cranberries in a 2 liter jar that has a tight-fitting lid. Add the sugar and rum. Adjust the lid securely and place the jar in a cool, dark place. Invert the jar and shake it every day for six weeks. Strain the cordial into bottles and seal with corks.',
    '{"Cranberries": "1/2 kg chopped", "Sugar": "3/4 L", "Light Rum": "1/2 L"}'
  ),
  (
    11227,
    'Champagne Cocktail',
    'Ordinary Drink',
    'Champagne flute',
    't5pv461606773026.jpg',
    'Add dash of Angostura bitter onto sugar cube and drop it into champagne flute. Add cognac followed by gently pouring chilled champagne. Garnish with orange slice and maraschino cherry.',
    '{"Champagne": "Chilled", "Sugar": "1 piece", "Bitters": "2 dashes", "Lemon Peel": "1 twist of", "Cognac": "1 dash"}'
  ),
  (
    12732,
    'Chocolate Beverage',
    'Cocoa',
    'Coffee mug',
    'jbqrhv1487603186.jpg',
    'Boil milk in the top of a deep double boiler five minutes. Remove from fire and add chocolate, mixed with the cinnamon, a little at a time, beating with molinillo or egg beater after each addition. When the chocolate is thoroughly blended, heat to the boiling point. Place over bottom of double boiler and add eggs, whipping constantly, until they are thoroughly blended and the mixture is frothing. Serve in coffee mug. Serves eight.',
    '{"Milk": "6 cups", "Chocolate": "3 oz Mexican", "Cinnamon": "1 tsp powdered", "Egg": "3"}'
  ),
  (
    11205,
    'California Lemonade',
    'Ordinary Drink',
    'Collins glass',
    'q5z4841582484168.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a collins glass over shaved ice. Fill with carbonated water and stir. Decorate with slices of orange and lemon. Add the cherry and serve with a straw.',
    '{"Blended Whiskey": "2 oz", "Lemon": "Juice of 1", "Lime": "Juice of 1", "Powdered Sugar": "1 tblsp", "Grenadine": "1/4 tsp", "Carbonated Water": "to Taste"}'
  ),
  (
    14133,
    'Cosmopolitan Martini',
    'Cocktail',
    'Cocktail Glass',
    'upxxpq1439907580.jpg',
    'Pour all ingredients in mixing glass half filled with ice, shake and strain into chilled Martini glass.',
    '{"Cointreau": "1/2 oz", "Vodka": "1 oz", "Lime": "Juice of 1/2", "Cranberry Juice": "1 splash"}'
  ),
  (
    14282,
    'California Root Beer',
    'Soft Drink',
    'Highball glass',
    'rsxuyr1472719526.jpg',
    'Put Kahlua and Galliano in highball glass fill with soda',
    '{"Kahlua": "3/4 oz", "Galliano": "3/4 oz", "Soda Water": "Fill with"}'
  ),
  (
    178329,
    'Captain Kidd''s Punch',
    'Cocktail',
    'Collins glass',
    'd83spj1596017390.jpg',
    'Mix all ingredients together in a shaker and strain into a collins glass. Use Caribbean dark Rum for a sweeter taste.',
    '{"Rum": "2 shots", "Lime Juice": "1 shot", "Egg White": "1 shot", "Bitters": "1 dash", "Sugar": "Ground", "Nutmeg": "Top"}'
  ),
  (
    11145,
    'Classic Old-Fashioned',
    'Ordinary Drink',
    'Old-fashioned glass',
    'w8cxqv1582485254.jpg',
    'In an old-fashioned glass, muddle the bitters and water into the sugar cube, using the back of a teaspoon. Almost fill the glass with ice cubes and add the bourbon. Garnish with the orange slice and the cherry. Serve with a swizzle stick.',
    '{"Bitters": "3 dashes", "Water": "1 tsp", "Sugar": "1", "Bourbon": "3 oz", "Orange": "1", "Maraschino Cherry": "1"}'
  ),
  (
    17065,
    'Caribbean Boilermaker',
    'Beer',
    'Beer pilsner',
    'svsxsv1454511666.jpg',
    'Pour the Corona into an 18oz beer glass pour the rum into the beer.',
    '{"Corona": "1 bottle", "Light Rum": "1 shot"}'
  ),
  (
    11243,
    'Chocolate Black Russian',
    'Ordinary Drink',
    'Champagne flute',
    'yyvywx1472720879.jpg',
    'Combine all ingredients in an electric blender and blend at a low speed for a short length of time. Pour into a chilled champagne flute and serve.',
    '{"Kahlua": "1 oz", "Vodka": "1/2 oz", "Chocolate Ice-cream": "5 oz"}'
  ),
  (
    178369,
    'Cocktail Horse’s Neck',
    'Cocktail',
    'Highball glass',
    '4vobt21643844913.jpg',
    'Wash and brush an organic, untreated lemon, then cut a spiral of lemon peel, using a citrus peel. If it is too large, cut it with a sharp knife. Put some ice in a tall tumbler glass, place the lemon peel inside and pour the cognac, add the ginger beer and let 2-3 drops of Angostura fall into it. Easy to do, but once you try it you''ll love it.',
    '{"Cognac": "4 cl", "Ginger Beer": "100 ml", "Angostura Bitters": "3 drops", "Lemon Peel": "1"}'
  ),
  (
    12730,
    'Castillian Hot Chocolate',
    'Cocoa',
    'Coffee mug',
    '3nbu4a1487603196.jpg',
    'Shift the cocoa and sugar together into a medium-sized saucepan. Dissolve the cornstarch in the water, and stir into the cocoa and sugar until it is a smooth paste. Begin heating the mixture, stirring it with a whisk, and gradually pour in the milk. Continue stirring with the whisk as you bring the liquid to a simmer. Allow the chocolate to simmer for about 10 minutes, stirring often, until it is thick, glossy and completely smooth. Serve steaming hot in coffee mug. Serves six.',
    '{"Cocoa Powder": "1/2 cup", "Sugar": "1 cup", "Cornstarch": "7 tsp", "Water": "1/2 cup", "Milk": "1 qt"}'
  ),
  (
    12796,
    'Caribbean Orange Liqueur',
    'Homemade Liqueur',
    'Collins Glass',
    'qwxuwy1472667570.jpg',
    'Pare very thinly the bright-colored rind from the oranges (no white). Blot the peel on paper towels to remove any excess oil. Put peel in a 4 cup screw-top jar. Add 2 cups vodka. Close jar. Store in a cool, dark place for 2 days or until the vodka has absorbed the flavor. Remove peel and add remaining vodka. Close jar and add remaining cup of vodka. Close the jar and store in a cool dark place at least 1 month to age.',
    '{"Orange": "3 large", "Vodka": "3 cups", "Sugar": "1 1/3 cup superfine"}'
  ),
  (
    17174,
    'Cherry Electric Lemonade',
    'Cocktail',
    'Pint glass',
    'tquyyt1451299548.jpg',
    'Now stir vigorously and then pour over a large cup of ice. Now drink it with a straw and stir occasionally.',
    '{"Gin": "1 oz", "Tequila": "1 oz", "Vodka": "1 oz", "White Rum": "1 oz", "Triple Sec": "1 oz", "Cherry Grenadine": "1 oz", "Sweet And Sour": "1 oz", "Club Soda": "3 oz"}'
  ),
  (
    17187,
    'Derby',
    'Ordinary Drink',
    'Cocktail glass',
    '52weey1606772672.jpg',
    'Pour all ingredients into a mixing glass with ice. Stir. Strain into a cocktail glass. Garnish with a sprig of fresh mint in the drink.',
    '{"Gin": "6 cl", "Peach Bitters": "2 dashes", "Mint": "2 Fresh leaves"}'
  ),
  (
    13128,
    'Diesel',
    'Beer',
    'Pint glass',
    'sxrrqq1454512852.jpg',
    'Pour the lager first then add the blackcurrant cordial. Top up with the cider. The colour sholud be very dark approaching the colour of Guiness.',
    '{"Lager": "1/2 pint", "Cider": "1/2 pint", "Blackcurrant Cordial": "1 dash"}'
  ),
  (
    11006,
    'Daiquiri',
    'Ordinary Drink',
    'Cocktail glass',
    'mrz9091589574515.jpg',
    'Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.',
    '{"Light Rum": "1 1/2 oz", "Lime": "Juice of 1/2", "Powdered Sugar": "1 tsp"}'
  ),
  (
    15409,
    'Danbooka',
    'Coffee / Tea',
    'Coffee Mug',
    'vurrxr1441246074.jpg',
    'pour it in and mix it.',
    '{"Coffee": "3 parts", "Everclear": "1 part"}'
  ),
  (
    11320,
    'Dragonfly',
    'Ordinary Drink',
    'Highball glass',
    'uc63bh1582483589.jpg',
    'In a highball glass almost filled with ice cubes, combine the gin and ginger ale. Stir well. Garnish with the lime wedge.',
    '{"Gin": "1 1/2 oz", "Ginger Ale": "4 oz", "Lime": "1"}'
  ),
  (
    16991,
    'Downshift',
    'Punch / Party Drink',
    'Hurricane glass',
    'y36z8c1503563911.jpg',
    'Start with the Sprite. Next comes the tequila. After that, add the Minute Maid Fruit Punch, then float the 151. Rocks optional.',
    '{"Fruit Punch": "2 part", "Sprite": "1 part", "Tequila": "2 shots", "151 Proof Rum": "Float Bacardi"}'
  ),
  (
    11324,
    'Dry Rob Roy',
    'Ordinary Drink',
    'Cocktail glass',
    'typuyq1439456976.jpg',
    'In a mixing glass half-filled with ice cubes, combine the Scotch and vermouth. Stir well. Strain into a cocktail glass. Garnish with the lemon twist.',
    '{"Scotch": "2 1/2 oz", "Dry Vermouth": "1 1/2 tsp", "Lemon Peel": "1 twist of"}'
  ),
  (
    11005,
    'Dry Martini',
    'Cocktail',
    'Cocktail glass',
    '6ck9yi1589574317.jpg',
    'Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.',
    '{"Gin": "1 2/3 oz", "Dry Vermouth": "1/3 oz", "Olive": "1"}'
  ),
  (
    14466,
    'Dirty Nipple',
    'Shot',
    'Shot glass',
    'vtyqrt1461866508.jpg',
    'This is a layered shot - the Bailey''s must be on top',
    '{"Kahlua": "to Taste", "Sambuca": "to Taste", "Baileys Irish Cream": "to Taste"}'
  ),
  (
    17181,
    'Dirty Martini',
    'Cocktail',
    'Cocktail glass',
    'vcyvpq1485083300.jpg',
    'Pour the vodka, dry vermouth and olive brine into a cocktail shaker with a handful of ice and shake well. Rub the rim of a martini glass with the wedge of lemon. Strain the contents of the cocktail shaker into the glass and add the olive. A dirty Martini contains a splash of olive brine or olive juice and is typically garnished with an olive.',
    '{"Vodka": "70ml/2fl oz", "Dry Vermouth": "1 tbsp", "Olive Brine": "2 tbsp", "Lemon": "1 wedge", "Olive": "1"}'
  ),
  (
    14482,
    'Darkwood Sling',
    'Soft Drink',
    'Cocktail glass',
    'sxxsyq1472719303.jpg',
    'There are many good cherry liqueurs you can use, but I prefere Heering. Add one share of the liqueur. Then you add one share of Soda. For a sour sling use Tonic (most people prefer the drink without Tonic). Afterwards you fill the glass with Orange Juice and ice cubes.',
    '{"Cherry Heering": "1 part", "Soda Water": "1 part", "Orange Juice": "1 part", "Ice": "cubes"}'
  ),
  (
    17177,
    'Dark Caipirinha',
    'Cocktail',
    'Highball glass',
    'uwstrx1472406058.jpg',
    'Muddle the sugar into the lime wedges in an old-fashioned glass. Fill the glass with ice cubes. Pour the cachaca into the glass. Stir well.',
    '{"Demerara Sugar": "2 tsp", "Lime": "1", "Cachaca": "2 1/2 oz"}'
  ),
  (
    17182,
    'Duchamp''s Punch',
    'Cocktail',
    'Old-fashioned glass',
    'g51naw1485084685.jpg',
    'Shake all ingredients. Double strain in a chilled double old fashioned glass with abig ice cube. Garnish with a couple of lavender sprigs',
    '{"Pisco": "5 cl", "Lime Juice": "2.5 cl", "Pineapple Syrup": "2.5 cl", "St. Germain": "1.5 cl", "Angostura Bitters": "2 Dashes", "Pepper": "Pinch", "Lavender": "2 sprigs"}'
  ),
  (
    17211,
    'Dark and Stormy',
    'Ordinary Drink',
    'Highball glass',
    't1tn0s1504374905.jpg',
    'In a highball glass filled with ice add 6cl dark rum and top with ginger beer. Garnish with lime wedge.',
    '{"Dark Rum": "5 cl", "Ginger Beer": "10 cl"}'
  ),
  (
    13194,
    'Damned if you do',
    'Shot',
    'Shot glass',
    'ql7bmx1503565106.jpg',
    'Pour into shot glass. Put in mouth. Repeat as deemed necessary.',
    '{"Whiskey": "0.75 oz", "Hot Damn": "0.25 oz"}'
  ),
  (
    11326,
    'Dubonnet Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'pfz3hz1582483111.jpg',
    'Stir all ingredients (except lemon peel) with ice and strain into a cocktail glass. Add the twist of lemon peel and serve.',
    '{"Dubonnet Rouge": "1 1/2 oz", "Gin": "3/4 oz", "Bitters": "1 dash", "Lemon Peel": "1 twist of"}'
  ),
  (
    12736,
    'Drinking Chocolate',
    'Cocoa',
    'Coffee mug',
    'u6jrdf1487603173.jpg',
    'Heat the cream and milk with the cinnamon and vanilla bean very slowly for 15-20 minutes. (If you don''t have any beans add 1-2 tsp of vanilla after heating). Remove the bean and cinnamon. Add the chocolate. Mix until fully melted. Serve topped with some very dense fresh whipped cream. Serves 1-2 depending upon how much of a glutton you are. For a richer chocolate, use 4 oz of milk, 4 oz of cream, 4 oz of chocolate. Serve in coffee mug.',
    '{"Heavy Cream": "2 oz", "Milk": "6-8 oz", "Cinnamon": "1 stick", "Vanilla": "1", "Chocolate": "2 oz finely chopped dark", "Whipped Cream": "Fresh"}'
  ),
  (
    178334,
    'Death in the Afternoon',
    'Cocktail',
    'Margarita glass',
    'y7s3rh1598719574.jpg',
    'Easy as you like, pour the absinthe into a chilled glass, top with champagne. Must be drunk mid afternoon for the optimum effect.',
    '{"Absinthe": "2 shots", "Champagne": "Top"}'
  ),
  (
    12668,
    'Egg Cream',
    'Other/Unknown',
    'Coffee mug',
    'mvis731484430445.jpg',
    'Mix syrup and milk in a fountain glass. Add soda water, serve with a straw.',
    '{"Chocolate Syrup": "2 tblsp", "Milk": "6 oz whole", "Soda Water": "6 oz"}'
  ),
  (
    12910,
    'Egg Nog #4',
    'Punch / Party Drink',
    'Punch bowl',
    'wpspsy1468875747.jpg',
    'In a small mixer bowl beat egg yolks till blended. Gradually add 1/4 cup sugar, beating at high speed till thick and lemon colored. Stir in milk, stir in rum, bourbon, vanilla, and salt. Chill thoroughly. Whip cream. Wash beaters well. In a large mixer bowl beat egg whites till soft peaks form. Gradually add remaining 1/4 cup sugar, beating to stiff peaks. Fold yolk mixture and whipped cream into egg whites. Serve immediately. Sprinkle nutmeg over each serving. Serve in a punch bowl or another big bowl. NOTE: For a nonalcoholic eggnog, prepare Eggnog as above, except omit the bourbon and rum and increase the milk to 3 cups.',
    '{"Egg Yolk": "6", "Sugar": "1/4 cup", "Milk": "2 cups", "Light Rum": "1/2 cup", "Bourbon": "1/2 cup", "Vanilla Extract": "1 tsp", "Salt": "1/4 tsp", "Whipping Cream": "1 cup", "Egg White": "6", "Nutmeg": "Ground"}'
  ),
  (
    11338,
    'English Highball',
    'Ordinary Drink',
    'Highball glass',
    'dhvr7d1504519752.jpg',
    'Pour brandy, gin, and sweet vermouth into a highball glass over ice cubes. Fill with carbonated water. Add the twist of lemon peel, stir, and serve. (Ginger ale may be substituted for carbonated water, if preferred.)',
    '{"Brandy": "3/4 oz", "Gin": "3/4 oz", "Sweet Vermouth": "3/4 oz", "Carbonated Water": "to Taste", "Lemon Peel": "to Taste"}'
  ),
  (
    17212,
    'Espresso Martini',
    'Cocktail',
    'Cocktail glass',
    'n0sx531504372951.jpg',
    'Pour ingredients into shaker filled with ice, shake vigorously, and strain into chilled martini glass',
    '{"Vodka": "5 cl", "Kahlua": "1 cl", "Sugar Syrup": "1 dash"}'
  ),
  (
    178309,
    'Espresso Rumtini',
    'Cocktail',
    'Cocktail glass',
    'acvf171561574403.jpg',
    'Mix together in a cocktail glass. Garnish with some choclate powder and coffee beans',
    '{"Rum": "1 shot", "Vanilla Syrup": "1/2 shot", "Espresso": "1 shot", "Coffee": "1 shot"}'
  ),
  (
    12916,
    'Egg Nog - Healthy',
    'Punch / Party Drink',
    'Collins Glass',
    'qxuppv1468875308.jpg',
    'Whip egg substitute and sugar together, combine with the two kinds of milk, vanilla, and rum. Mix well. Chill over night. Sprinkle with nutmeg. Makes 6 servings.',
    '{"Egg": "1/2 cup", "Sugar": "3 tblsp", "Condensed Milk": "13 oz skimmed", "Milk": "3/4 cup skimmed", "Vanilla Extract": "1 tsp", "Rum": "1 tsp", "Nutmeg": ""}'
  ),
  (
    11339,
    'English Rose Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'yxwrpp1441208697.jpg',
    'Rub rim of cocktail glass with lemon juice and dip rim of glass in powdered sugar. Shake all ingredients (except cherry) with ice and strain into sugar-rimmed glass. Top with the cherry and serve.',
    '{"Apricot Brandy": "3/4 oz", "Gin": "1 1/2 oz", "Dry Vermouth": "3/4 oz", "Grenadine": "1 tsp", "Lemon Juice": "1/4 tsp", "Cherry": "1"}'
  ),
  (
    178346,
    'Elderflower Caipirinha',
    'Cocktail',
    'Collins glass',
    'dif7a31614006331.jpg',
    'Take the glass and muddle the lime in it. Fill the glass with crushed ice and add the Cachaca. Stir well and top with some more crushed ice. Garnish with lime and enjoy!',
    '{"Cachaca": "60 ml", "Lime": "1", "Elderflower Cordial": "3 cl"}'
  ),
  (
    12914,
    'Egg-Nog - Classic Cooked',
    'Punch / Party Drink',
    'Pitcher',
    'quxsvt1468875505.jpg',
    'In large saucepan, beat together eggs, sugar and salt, if desired. Stir in 2 cups of the milk. Cook over low heat, stirring constantly, until mixture is thick enough to coat a metal spoon and reaches 160 degrees F. Remove from heat. Stir in remaining 2 cups milk and vanilla. Cover and regfigerate until thoroughly chilled, several hours or overnight. Just before serving, pour into bowl or pitcher. Garnish or add stir-ins, if desired. Choose 1 or several of: Chocolate curls, cinnamon sticks, extracts of flavorings, flavored brandy or liqueur, fruit juice or nectar, ground nutmeg, maraschino cherries, orange slices, peppermint sticks or candy canes, plain brandy, run or whiskey, sherbet or ice-cream, whipping cream, whipped. Serve immediately.',
    '{"Egg": "6", "Sugar": "1/4 cup", "Salt": "1/4 tsp", "Milk": "1 qt", "Vanilla Extract": "1 tsp"}'
  ),
  (
    17246,
    'Empellón Cocina''s Fat-Washed Mezcal',
    'Cocktail',
    'Beer Glass',
    'osgvxt1513595509.jpg',
    'To ensure that your pork fat is just as delicious as theirs, here’s their adobo marinade and what to do with it (you’ll also need a rack of ribs): 4 ancho chiles, 8 guajillo chiles and 4 chipotle chiles, plus 4 cloves roasted garlic, half a cup of cider vinegar, a quarter teaspoon of Mexican oregano, 1 teaspoon of ground black pepper, a whole clove, a quarter teaspoon of ground cinnamon and a half teaspoon of ground cumin. Toast the dried chiles and soak in water for at least an hour until they are rehydrated. Drain and discard the soaking liquid. Combine the soaked chiles with the remaining ingredients and purée until smooth. Cold smoke a rack of baby back pork ribs by taking a large hotel pan with woodchips on one side and charcoal on the other. Place another, smaller, pan with pork ribs, above the charcoal/woodchip pan. Ignite the charcoal, being careful to not ignite the woodchips. Cover both pans with foil and allow to smoke for 10-15 minutes, until desired level of smoke is achieved, then coat with adobo marinade and wrap in tin foil prior to placing ribs in a 300 degree oven for 7 hours. When the ribs have cooled, strain off the fat and use for the infusion. If you’re having a hard time coming up to the same kind of volume of fat, make up the balance with pork lard from a butcher. To get the same depth of flavor without the ribs, heat up the fat in a pot with a few spoons of the marinade. Once you’ve got your tub of seasoned pork fat in cooled liquid form, pour equal amounts of Ilegal Joven mezcal and fat into a sealable container. Seal the container and give it a really good shake, then put it in the freezer overnight. When the whole thing is separated and congealed, pour it through a fine mesh chinoise. If you don’t have a chinoise, try a fine mesh strainer, or if you don’t have one of those, try spooning off most of the fat. There will be some beads of orange fat left in the strained mezcal: run that through a few layers of cheesecloth (or coffee filters in a pinch) to get rid of the last of it. The mezcal is now ready for drinking, straight-up or in a cocktail. Habanero tincture Slice habaneros and add 2 ounces Ilegal Joven mezcal. Allow to sit overnight or until desired level of heat is achieved. Cocktail Combine mezcal and chocolate liqueur in a mixing glass with ice and stir for 45 seconds. Strain into chilled coupe. Carefully  sink  the coffee liqueur down the inside of the coupe over a spoon. Garnish with 5 drops habanero tincture.',
    '{"Mezcal": "2 oz", "Chocolate Liqueur": "3/4 oz", "Coffee Liqueur": "1/2 oz"}'
  ),
  (
    178352,
    'Frosé',
    'Cocktail',
    'Cocktail glass',
    'b4cadp1619695347.jpg',
    'Step 1 Pour rosé into a 13x9  pan and freeze until almost solid (it won''t completely solidify due to the alcohol), at least 6 hours. Step 2 Meanwhile, bring sugar and ½ cup water to a boil in a medium saucepan; cook, stirring constantly, until sugar dissolves, about 3 minutes. Add strawberries, remove from heat, and let sit 30 minutes to infuse syrup with strawberry flavor. Strain through a fine-mesh sieve into a small bowl (do not press on solids); cover and chill until cold, about 30 minutes. Step 3 Scrape rosé into a blender. Add lemon juice, 3½ ounces strawberry syrup, and 1 cup crushed ice and purée until smooth. Transfer blender jar to freezer and freeze until frosé is thickened (aim for milkshake consistency), 25–35 minutes. Step 4 Blend again until frosé is slushy. Divide among glasses. Step 5 Do Ahead: Rosé can be frozen 1 week ahead.',
    '{"Rose": "750 ml", "Sugar": "1/2 cup", "Strawberries": "8 oz", "Lemon Juice": "2-3 oz"}'
  ),
  (
    12768,
    'Frappé',
    'Coffee / Tea',
    'Highball Glass',
    'vqwryq1441245927.jpg',
    'Mix together. Blend at highest blender speed for about 1 minute. Pour into a glass and drink with a straw. Notes: This works best if everything is cold (if you make fresh coffee, mix it with the milk and let it sit in the fridge for 1/2 hour. If it is not frothy, add more milk, or even just some more milk powder. The froth gradually turns to liquid at the bottom of the glass, so you will find that you can sit and drink this for about 1/2 hour, with more iced coffee continually appearing at the bottom. Very refreshing.',
    '{"Coffee": "1/2 cup black", "Milk": "1/2 cup", "Sugar": "1-2 tsp"}'
  ),
  (
    11375,
    'Foxy Lady',
    'Ordinary Drink',
    'Cocktail glass',
    'r9cz3q1504519844.jpg',
    'Shake all ingredients with ice, strain into a chilled cocktail glass, and serve.',
    '{"Amaretto": "1/2 oz", "Creme De Cacao": "1/2 oz", "Light Cream": "2 oz"}'
  ),
  (
    17197,
    'French 75',
    'Ordinary Drink',
    'Collins glass',
    'hrxfbl1606773109.jpg',
    'Combine gin, sugar, and lemon juice in a cocktail shaker filled with ice. Shake vigorously and strain into a chilled champagne glass. Top up with Champagne. Stir gently.',
    '{"Gin": "1 1/2 oz", "Sugar": "2 tsp superfine", "Lemon Juice": "1 1/2 oz", "Champagne": "4 oz Chilled", "Orange": "1", "Maraschino Cherry": "1"}'
  ),
  (
    11382,
    'Frisco Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'acuvjz1582482022.jpg',
    'Shake all ingredients (except slices of lemon and lime) with ice and strain into a whiskey sour glass. Decorate with the slices of lemon and lime and serve.',
    '{"Blended Whiskey": "2 oz", "Benedictine": "1/2 oz", "Lemon": "1 slice", "Lime": "1 slice"}'
  ),
  (
    12674,
    'Fruit Shake',
    'Other/Unknown',
    'Highball Glass',
    'q0fg2m1484430704.jpg',
    'Blend til smooth.',
    '{"Yoghurt": "1 cup fruit", "Banana": "1", "Orange Juice": "4 oz frozen", "Fruit": "1/2 piece textural", "Ice": "6"}'
  ),
  (
    178344,
    'Figgy Thyme',
    'Cocktail',
    'Highball glass',
    'pbw4e51606766578.jpg',
    'In a lewis bag, crush up some ice like a baller/maniac (@glacioice). Pour your precious ice into a collins glass. In a cocktail shaker, muddle the figs and thyme together. Add honey vodka, lemon juice, and a large ice cube (@glacioice). Shake until well chilled, and strain into glass. Add tonic water and finally 2 dashes of angostura bitters. Garnish with sliced figs and thyme.',
    '{"Vodka": "2 oz", "Honey": "1 tsp", "Figs": "3", "Thyme": "1 Sprig", "Angostura Bitters": "2 dashes", "Tonic Water": "Top"}'
  ),
  (
    12670,
    'Fruit Cooler',
    'Other/Unknown',
    'Highball Glass',
    'i3tfn31484430499.jpg',
    'Toss strawberries with sugar, and let sit overnight in refrigerator. Cut lemon, reserve two slices. Juice the rest. Mix together the lemon juice, strawberries, apple juice, and soda water. Add slices of lemon (decor, really). In glasses, put ice cubes, and a slice of apple. Pour drink in, and serve.',
    '{"Apple Juice": "1 can frozen", "Strawberries": "1 cup", "Sugar": "2 tblsp", "Lemon": "1", "Apple": "1", "Soda Water": "1 L", "Ice": "to Taste"}'
  ),
  (
    14688,
    'Freddy Kruger',
    'Shot',
    'Shot glass',
    'tuppuq1461866798.jpg',
    'make it an ample size shot!!',
    '{"Jägermeister": "1/2 oz", "Sambuca": "1/2 oz", "Vodka": "1/2 oz"}'
  ),
  (
    15743,
    'Fuzzy Asshole',
    'Coffee / Tea',
    'Coffee mug',
    'wrvpuu1472667898.jpg',
    'fill coffe mug half full of coffee. Fill the other half full of Peach Schnapps. Stir and drink while hot.',
    '{"Coffee": "1/2", "Peach Schnapps": "1/2"}'
  ),
  (
    178328,
    'Funk and Soul',
    'Cocktail',
    'Collins glass',
    'qtv83q1596015790.jpg',
    'Mix all ingredients together and strain into a Collins glass. Use Jamaican rum where possible for a more authentic taste.',
    '{"Rum": "2 shots", "Apricot Nectar": "1 shot", "Pomegranate Juice": "1 shot", "Lemon": "Juice of 1/2", "Soda Water": "Top"}'
  ),
  (
    17213,
    'French Martini',
    'Cocktail',
    'Cocktail glass',
    'clth721504373134.jpg',
    'Pour all ingredients into shaker with ice cubes. Shake well and strain into a chilled cocktail glass. Squeeze oil from lemon peel onto the drink.',
    '{"Vodka": "4.5 cl", "Raspberry Liqueur": "1.5 cl", "Pineapple Juice": "1.5 cl"}'
  ),
  (
    17248,
    'French Negroni',
    'Cocktail',
    'Martini Glass',
    'x8lhp41513703167.jpg',
    'Add ice to a shaker and pour in all ingredients. Using a bar spoon, stir 40 to 45 revolutions or until thoroughly chilled. Strain into a martini glass or over ice into a rocks glass. Garnish with orange twist.',
    '{"Gin": "1 oz", "Lillet": "1 oz", "Sweet Vermouth": "1 oz", "Orange Peel": "1"}'
  ),
  (
    11368,
    'Flying Dutchman',
    'Ordinary Drink',
    'Old-fashioned glass',
    'mwko4q1582482903.jpg',
    'In an old-fashioned glass almost filled with ice cubes, combine the gin and triple sec. Stir well.',
    '{"Gin": "2 oz", "Triple Sec": "1/2 oz"}'
  ),
  (
    11387,
    'Frozen Daiquiri',
    'Ordinary Drink',
    'Champagne flute',
    '7oyrj91504884412.jpg',
    'Combine all ingredients (except for the cherry) in an electric blender and blend at a low speed for five seconds, then blend at a high speed until firm. Pour contents into a champagne flute, top with the cherry, and serve.',
    '{"Light Rum": "1 1/2 oz", "Triple Sec": "1 tblsp", "Lime Juice": "1 1/2 oz", "Sugar": "1 tsp", "Cherry": "1", "Ice": "1 cup crushed"}'
  ),
  (
    12672,
    'Fruit Flip-Flop',
    'Other/Unknown',
    'Highball Glass',
    'nfdx6p1484430633.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Yoghurt": "1 cup", "Fruit Juice": "1 cup"}'
  ),
  (
    13070,
    'Fahrenheit 5000',
    'Shot',
    'Shot glass',
    'tysssx1473344692.jpg',
    'Cover bottom of shot glass with Tabasco Sauce and then fill with half Firewater and half Absolut Peppar.',
    '{"Firewater": "1/2 oz", "Absolut Peppar": "1/2 oz", "Tabasco Sauce": "1 dash"}'
  ),
  (
    11369,
    'Flying Scotchman',
    'Ordinary Drink',
    'Cocktail glass',
    'q53l911582482518.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Scotch": "1 oz", "Sweet Vermouth": "1 oz", "Bitters": "1 dash", "Sugar Syrup": "1/4 tsp"}'
  ),
  (
    17198,
    'French Connection',
    'Ordinary Drink',
    'Old-fashioned glass',
    'zaqa381504368758.jpg',
    'Pour all ingredients directly into old fashioned glass filled with ice cubes. Stir gently.',
    '{"Cognac": "1 1/2 oz", "Amaretto": "3/4 oz"}'
  ),
  (
    13202,
    'Flaming Dr. Pepper',
    'Shot',
    'Collins Glass',
    'd30z931503565384.jpg',
    'Add Amaretto, Bacardi, and vodka. Mix in the Dr. Pepper and beer',
    '{"Amaretto": "1 oz", "Vodka": "1 oz", "151 Proof Rum": "1 oz Bacardi", "Dr. Pepper": "1 oz", "Beer": "1 oz"}'
  ),
  (
    13675,
    'Flander''s Flake-Out',
    'Ordinary Drink',
    'Collins Glass',
    'sqvqrx1461866705.jpg',
    'Bang ''em both in.',
    '{"Sambuca": "1/4 glass", "Sarsaparilla": "3/4 glass"}'
  ),
  (
    16485,
    'Flaming Lamborghini',
    'Cocktail',
    'Cocktail glass',
    'yywpss1461866587.jpg',
    'Pour the Sambuca and Kahlua into the Cocktail Glass and give the drinker a straw. Pour the Baileys and Blue Curacao into two sepsrate shot glasses either side of the cocktail glass. Set light the concotion in the cocktail glass and start to drink through the straw (this drink should be drunk in one) , as the bottom of the glass is reached put out the fire by pouring the Baileys and Blue Curacao into the cocktail glass and keep drinking till it''s all gone!!',
    '{"Kahlua": "1 oz", "Sambuca": "1 oz", "Blue Curacao": "1 oz", "Baileys Irish Cream": "1 oz"}'
  ),
  (
    11390,
    'Frozen Mint Daiquiri',
    'Ordinary Drink',
    'Old-fashioned glass',
    'jrhn1q1504884469.jpg',
    'Combine all ingredients with 1 cup of crushed ice in an electric blender. Blend at a low speed for a short length of time. Pour into an old-fashioned glass and serve.',
    '{"Light Rum": "2 oz", "Lime Juice": "1 tblsp", "Mint": "6", "Sugar": "1 tsp"}'
  ),
  (
    11391,
    'Frozen Pineapple Daiquiri',
    'Ordinary Drink',
    'Cocktail Glass',
    'k3aecd1582481679.jpg',
    'Combine all ingredients with 1 cup of crushed ice in an electric blender. Blend at a low speed for a short length of time. Pour into a cocktail glass and serve.',
    '{"Light Rum": "1 1/2 oz", "Pineapple": "4 chunks", "Lime Juice": "1 tblsp", "Sugar": "1/2 tsp"}'
  ),
  (
    15997,
    'GG',
    'Ordinary Drink',
    'Collins Glass',
    'vyxwut1468875960.jpg',
    'Pour the Galliano liqueur over ice. Fill the remainder of the glass with ginger ale and thats all there is to it. You now have a your very own GG.',
    '{"Galliano": "2 1/2 shots", "Ginger Ale": "to Taste", "Ice": "to Taste"}'
  ),
  (
    17255,
    'Gimlet',
    'Cocktail',
    'Martini Glass',
    '3xgldt1513707271.jpg',
    'Add all the ingredients to a shaker and fill with ice. Shake, and strain into a chilled cocktail glass or an Old Fashioned glass filled with fresh ice. Garnish with a lime wheel.',
    '{"Gin": "2 1/2 oz", "Lime Juice": "1/2 oz", "Sugar Syrup": "1/2 oz", "Lime": "1"}'
  ),
  (
    11410,
    'Gin Fizz',
    'Ordinary Drink',
    'Highball glass',
    'drtihp1606768397.jpg',
    'Shake all ingredients with ice cubes, except soda water. Pour into glass. Top with soda water.',
    '{"Gin": "2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Carbonated Water": "to Taste"}'
  ),
  (
    11417,
    'Gin Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'noxp7e1606769224.jpg',
    'In a shaker half-filled with ice cubes, combine the gin, lemon juice, and sugar. Shake well. Strain into a sour glass and garnish with the orange slice and the cherry.',
    '{"Gin": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1/2 tsp superfine", "Orange": "1", "Maraschino Cherry": "1"}'
  ),
  (
    11422,
    'Godchild',
    'Ordinary Drink',
    'Champagne flute',
    'm5nhtr1504820829.jpg',
    'Shake all ingredients well with cracked ice, strain into a champagne flute, and serve.',
    '{"Vodka": "1 oz", "Amaretto": "1 oz", "Heavy Cream": "1 oz"}'
  ),
  (
    11408,
    'Gin Daisy',
    'Ordinary Drink',
    'Old-fashioned glass',
    'z6e22f1582581155.jpg',
    'In a shaker half-filled with ice cubes, combine the gin, lemon juice, sugar, and grenadine. Shake well. Pour into an old-fashioned glass and garnish with the cherry and the orange slice.',
    '{"Gin": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1/2 tsp superfine", "Grenadine": "1/2 tsp", "Maraschino Cherry": "1", "Orange": "1"}'
  ),
  (
    11415,
    'Gin Sling',
    'Ordinary Drink',
    'Old-fashioned glass',
    '8cl9sm1582581761.jpg',
    'Dissolve powdered sugar in mixture of water and juice of lemon. Add gin. Pour into an old-fashioned glass over ice cubes and stir. Add the twist of orange peel and serve.',
    '{"Gin": "2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Water": "1 tsp", "Orange Peel": "Twist of"}'
  ),
  (
    11416,
    'Gin Smash',
    'Ordinary Drink',
    'Old-fashioned glass',
    'iprva61606768774.jpg',
    'Muddle sugar with carbonated water and mint sprigs in an old-fashioned glass. Add gin and 1 ice cube. Stir, add the orange slice and the cherry, and serve.',
    '{"Gin": "2 oz", "Carbonated Water": "1 oz", "Sugar": "1 cube", "Mint": "4", "Orange": "1 slice", "Cherry": "1"}'
  ),
  (
    11420,
    'Gin Toddy',
    'Ordinary Drink',
    'Old-fashioned glass',
    'jxstwf1582582101.jpg',
    'Mix powdered sugar and water in an old-fashioned glass. Add gin and one ice cube. Stir, add the twist of lemon peel, and serve.',
    '{"Gin": "2 oz", "Water": "2 tsp", "Powdered Sugar": "1/2 tsp", "Lemon Peel": "1 twist of"}'
  ),
  (
    11423,
    'Godfather',
    'Ordinary Drink',
    'Old-fashioned glass',
    'e5zgao1582582378.jpg',
    'Pour all ingredients directly into old fashioned glass filled with ice cubes. Stir gently.',
    '{"Scotch": "1 1/2 oz", "Amaretto": "3/4 oz"}'
  ),
  (
    11424,
    'Godmother',
    'Ordinary Drink',
    'Old-fashioned glass',
    'quksqg1582582597.jpg',
    'Pour vodka and amaretto into an old-fashioned glass over ice and serve.',
    '{"Vodka": "1 1/2 oz", "Amaretto": "3/4 oz"}'
  ),
  (
    12758,
    'Gagliardo',
    'Cocktail',
    'Cocktail glass',
    'lyloe91487602877.jpg',
    'Shake well and serve in a cocktail glass. This is a home cocktail of American/Internet Bar del Pozzo, Pavia, Italy.',
    '{"Peach Vodka": "5 parts", "Lemon Juice": "3 parts", "Galliano": "1 part", "Sirup Of Roses": "1 part"}'
  ),
  (
    12944,
    'Gluehwein',
    'Punch / Party Drink',
    'Irish coffee cup',
    'vuxwvt1468875418.jpg',
    'Boil sugar and spices in water, leave in the water for 30 minutes. Strain the spiced water and mix with the wine. Heat slowly until short of boiling temperature. (To remove alcohol, let it boil for a while.) You may add lemon or orange juice to taste. Serve in irish coffee cup.',
    '{"Red Wine": "1 L", "Water": "125 ml", "Sugar": "60 gr", "Cinnamon": "1", "Cloves": "3", "Lemon Peel": "1 tblsp"}'
  ),
  (
    17252,
    'Greyhound',
    'Cocktail',
    'Collins glass',
    'g5upn41513706732.jpg',
    'Add the vodka to a Collins glass filled with ice. Top with grapefruit juice and stir.',
    '{"Vodka": "1 1/2 oz", "Grapefruit Juice": "3 oz"}'
  ),
  (
    178365,
    'Gin Tonic',
    'Cocktail',
    'Highball glass',
    'qcgz0t1643821443.jpg',
    'Fill a highball glass with ice, pour the gin, top with tonic water and squeeze a lemon wedge and garnish with a lemon wedge.',
    '{"Gin": "4 cl", "Tonic Water": "10 cl", "Lemon Peel": "1 Slice", "Ice": "cubes"}'
  ),
  (
    178366,
    'Gin Lemon',
    'Cocktail',
    'Highball glass',
    'yhzvk91643821739.jpg',
    'For the preparation of the gin lemon you will not need the shaker. Fill the tumbler with ice, pour the gin and lemonade over it. Gently mix and decorate with a slice of lemon. Those who prefer can also add a few mint leaves. Your gin lemon is ready to be served.',
    '{"Gin": "6 cl", "Lemon Juice": "8 cl", "Lemon Peel": "1 Slice", "Ice": "cubes"}'
  ),
  (
    11407,
    'Gin Cooler',
    'Ordinary Drink',
    'Collins glass',
    '678xt11582481163.jpg',
    'Stir powdered sugar and 2 oz. carbonated water in a collins glass. Fill glass with ice and add gin. Fill with carbonated water and stir. Add the lemon peel and the orange spiral so that the end of the orange spiral dangles over rim of glass.',
    '{"Gin": "2 oz", "Carbonated Water": "to Taste", "Powdered Sugar": "to Taste", "Orange Spiral": "to Taste", "Lemon Peel": "to Taste"}'
  ),
  (
    11418,
    'Gin Squirt',
    'Ordinary Drink',
    'Highball glass',
    'xrbhz61504883702.jpg',
    'Stir gin, grenadine, and powdered sugar with ice and strain into a highball glass over ice cubes. Fill with carbonated water and stir. Decorate with the pineapple chunks and the strawberries and serve.',
    '{"Gin": "1 1/2 oz", "Grenadine": "1 tsp", "Powdered Sugar": "1 tblsp", "Pineapple": "3 chunks", "Strawberries": "2", "Carbonated Water": "to Taste"}'
  ),
  (
    15427,
    'Grand Blue',
    'Ordinary Drink',
    'Old-fashioned glass',
    'vsrsqu1472761749.jpg',
    'Serve in an old fashioned glass.',
    '{"Malibu Rum": "1 1/2 cl", "Peach Schnapps": "1 1/2 cl", "Blue Curacao": "1 1/2 cl", "Sweet And Sour": "3 cl"}'
  ),
  (
    17230,
    'Gin Rickey',
    'Cocktail',
    'Highball glass',
    's00d6f1504883945.jpg',
    'Half-fill a tall glass with ice. Mix the gin and Grenadine together and pour over the ice. Add the lime or lemon juice and top off with soda water. Decorate the glass with lime and/or lemon slices.',
    '{"Gin": "2 oz", "Grenadine": "1 tsp", "Lemon": "Juice of 1/2", "Soda Water": "Top up with", "Lime": "Garnish"}'
  ),
  (
    11419,
    'Gin Swizzle',
    'Ordinary Drink',
    'Highball glass',
    'sybce31504884026.jpg',
    'In a shaker half-filled with ice cubes, combine the lime juice, sugar, gin, and bitters. Shake well. Almost fill a colling glass with ice cubes. Stir until the glass is frosted. Strain the mixture in the shaker into the glass and add the club soda.',
    '{"Lime Juice": "1 1/2 oz", "Sugar": "1 tsp superfine", "Gin": "2 oz", "Bitters": "1 dash", "Club Soda": "3 oz"}'
  ),
  (
    11433,
    'Grass Skirt',
    'Ordinary Drink',
    'Old-fashioned glass',
    'qyvprp1473891585.jpg',
    'In a shaker half-filled with ice cubes, combine the gin, triple sec, pineapple juice, and grenadine. Shake well. Pour into an old-fashioned glass and garnish with the pineapple slice.',
    '{"Gin": "1 1/2 oz", "Triple Sec": "1 oz", "Pineapple Juice": "1 oz", "Grenadine": "1/2 tsp", "Pineapple": "1"}'
  ),
  (
    14642,
    'Grim Reaper',
    'Ordinary Drink',
    'Old-fashioned glass',
    'kztu161504883192.jpg',
    'Mix Kahlua and 151 in glass. Quickly add ice and pour grenadine over ice to give ice red tint.',
    '{"Kahlua": "1 oz", "151 Proof Rum": "1 oz Bacardi", "Grenadine": "1 dash"}'
  ),
  (
    17200,
    'Grasshopper',
    'Ordinary Drink',
    'Cocktail glass',
    'aqm9el1504369613.jpg',
    'Pour ingredients into a cocktail shaker with ice. Shake briskly and then strain into a chilled cocktail glass.',
    '{"Green Creme De Menthe": "3/4 oz", "Creme De Cacao": "3/4 oz white", "Light Cream": "3/4 oz"}'
  ),
  (
    12762,
    'Grizzly Bear',
    'Ordinary Drink',
    'Collins Glass',
    'k6v97f1487602550.jpg',
    'Served over ice. Sounds nasty, but tastes great.',
    '{"Amaretto": "1 part", "Jägermeister": "1 part", "Kahlua": "1 part", "Milk": "2 1/2 parts"}'
  ),
  (
    13497,
    'Green Goblin',
    'Beer',
    'Pint glass',
    'qxprxr1454511520.jpg',
    'Cider First, Lager then Curacao',
    '{"Cider": "1/2 pint hard", "Lager": "1/2 pint", "Blue Curacao": "1 shot"}'
  ),
  (
    17199,
    'Golden dream',
    'Ordinary Drink',
    'Cocktail glass',
    'qrot6j1504369425.jpg',
    'Shake with cracked ice. Strain into glass and serve.',
    '{"Galliano": "2 parts", "Triple Sec": "2 parts", "Orange Juice": "2 parts", "Cream": "1 part"}'
  ),
  (
    178342,
    'Gin and Soda',
    'Cocktail',
    'Highball glass',
    'nzlyc81605905755.jpg',
    'Pour the Gin and Soda water into a highball glass almost filled with ice cubes. Stir well. Garnish with the lime wedge.',
    '{"Gin": "2 oz", "Soda Water": "5 oz", "Lime": "1/4"}'
  ),
  (
    11403,
    'Gin And Tonic',
    'Ordinary Drink',
    'Highball glass',
    'z0omyp1582480573.jpg',
    'Pour the gin and the tonic water into a highball glass almost filled with ice cubes. Stir well. Garnish with the lime wedge.',
    '{"Gin": "2 oz", "Tonic Water": "5 oz", "Lime": "1"}'
  ),
  (
    178314,
    'Gin Basil Smash',
    'Cocktail',
    'Highball glass',
    'jqh2141572807327.jpg',
    'Muddle Basil leaves (~ 10) with Suggar Syrup in a shaker. Add Gin an Lemon Juice. Filter and serve in a tumbler with ice',
    '{"Gin": "6 cl", "Lemon Juice": "2 cl", "Sugar Syrup": "2 cl", "Basil": "Whole"}'
  ),
  (
    11396,
    'Gentleman''s Club',
    'Ordinary Drink',
    'Old-fashioned glass',
    'k2r7wv1582481454.jpg',
    'In an old-fashioned glass almost filled with ice cubes, combine all of the ingredients. Stir well.',
    '{"Gin": "1 1/2 oz", "Brandy": "1 oz", "Sweet Vermouth": "1 oz", "Club Soda": "1 oz"}'
  ),
  (
    17175,
    'Girl From Ipanema',
    'Ordinary Drink',
    'Wine Glass',
    'xypspq1469090633.jpg',
    'Add the cachaca, lemon juice and syrup to your boston glass. Add ice and shake until ice cold. Pour into a chilled flute and top-up with Champagne',
    '{"Cachaca": "25 ml", "Lemon Juice": "15 ml", "Agave Syrup": "10 ml", "Champagne": "top up with"}'
  ),
  (
    178340,
    'Garibaldi Negroni',
    'Cocktail',
    'Highball glass',
    'kb4bjg1604179771.jpg',
    'Mix together in a shaker and garnish with a simple orange slice. Fill your vitamin C and cocktail fix at the same time!',
    '{"Gin": "30 ml", "Campari": "30 ml", "Orange Juice": "90 ml", "Orange Peel": "Garnish with"}'
  ),
  (
    17002,
    'Gideon''s Green Dinosaur',
    'Ordinary Drink',
    'Collins glass',
    'p5r0tr1503564636.jpg',
    'Add all ingredients in collins glass with ice and stir.',
    '{"Dark Rum": "1/2 oz", "Vodka": "1/2 oz", "Triple Sec": "1/2 oz", "Tequila": "1/2 oz", "Melon Liqueur": "1/2 oz", "Mountain Dew": "Fill with"}'
  ),
  (
    12712,
    'Grape lemon pineapple Smoothie',
    'Other/Unknown',
    'Highball glass',
    '54z5h71487603583.jpg',
    'Throw everything into a blender and liquify.',
    '{"Grapes": "1 cup", "Lemon": "1/4", "Pineapple": "1/2"}'
  ),
  (
    16262,
    'H.D.',
    'Coffee / Tea',
    'Beer mug',
    'upusyu1472667977.jpg',
    'Mix the whisky and Baileys Cream in a beer-glass (at least 50 cl). Fill the rest of the glass with coffee.',
    '{"Whisky": "4 cl", "Baileys Irish Cream": "8 cl", "Coffee": "to Taste"}'
  ),
  (
    178316,
    'Honey Bee',
    'Cocktail',
    'Margarita glass',
    'vu8l7t1582475673.jpg',
    'Shake ingredients with crushed ice',
    '{"White Rum": "6 cl", "Honey": "2 cl", "Lemon Juice": "2 cl"}'
  ),
  (
    178345,
    'Hot Toddy',
    'Cocktail',
    'Irish coffee cup',
    'ggx0lv1613942306.jpg',
    'STEP 1 Whisk the whisky and honey together and split between 2 heatproof glasses. Add half of the cinnamon stick to each, then top up with 200ml boiling water. STEP 2 Add a splash of lemon juice to each, then taste and add more to your preference. Finish each with a slice of lemon, studded with a clove, and serve immediately.',
    '{"Whiskey": "50 ml", "Honey": "15 ml", "Cinnamon": "1", "Lemon": "1", "Cloves": "2"}'
  ),
  (
    15813,
    'Herbal flame',
    'Coffee / Tea',
    'Mason jar',
    'rrstxv1441246184.jpg',
    'Pour Hot Damn 100 in bottom of a jar or regular glass. Fill the rest of the glass with sweet tea. Stir with spoon, straw, or better yet a cinnamon stick and leave it in.',
    '{"Hot Damn": "5 shots", "Tea": "very sweet"}'
  ),
  (
    17202,
    'Horse''s Neck',
    'Ordinary Drink',
    'Highball glass',
    '006k4e1504370092.jpg',
    'Pour brandy and ginger ale directly into highball glass with ice cubes. Stir gently. Garnish with lemon zest. If desired, add dashes of Angostura Bitter.',
    '{"Lemon Peel": "1 long strip", "Brandy": "2 oz", "Ginger Ale": "5 oz", "Bitters": "2 dashes"}'
  ),
  (
    12766,
    'Happy Skipper',
    'Ordinary Drink',
    'Highball glass',
    '42w2g41487602448.jpg',
    'Pour Captain Morgan''s Spiced Rum over ice, fill glass to top with Ginger Ale. Garnish with lime. Tastes like a cream soda. Named for the Gilligan''s Island reference ( The Captain  *in*  Ginger  is a Happy Skipper!)',
    '{"Spiced Rum": "1 1/2 cl", "Ginger Ale": "to Taste", "Lime": "to Taste", "Ice": "to Taste"}'
  ),
  (
    17239,
    'Hunter''s Moon',
    'Cocktail',
    'Balloon Glass',
    't0iugg1509556712.jpg',
    'Put the Bombay Sapphire, Martini Bianco, sugar syrup & blackberries in a cocktail shaker with lots of ice and shake vigorously before pouring into a balloon glass, topping up with lemonade and garnishing with a wedge of orange.',
    '{"Vermouth": "25 ml", "Maraschino Cherry": "15 ml", "Sugar Syrup": "10 ml", "Lemonade": "100 ml", "Blackberries": "2"}'
  ),
  (
    11470,
    'Havana Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    '59splc1504882899.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Light Rum": "1 oz", "Pineapple Juice": "1 oz", "Lemon Juice": "1 tsp"}'
  ),
  (
    12954,
    'Holloween Punch',
    'Punch / Party Drink',
    'Punch bowl',
    'lfeoe41504888925.jpg',
    'Take a bunch of grape juice and a bunch of fizzy stuff (club soda, ginger ale, lemonlime, whatever). Mix them in a punch bowl. Take orange sherbet and lime sherbet. Scoop out scoops and float them in the punch, let them melt a little so that a nasty film spreads all over the top of the punch but there are still  bubbles  in it in the form of sherbet scoops. Looks horrible, tastes just fine.',
    '{"Grape Juice": "to Taste", "Carbonated Soft Drink": ", orange", "Sherbet": "to Taste"}'
  ),
  (
    14782,
    'Hot Creamy Bush',
    'Coffee / Tea',
    'Irish coffee cup',
    'spvrtp1472668037.jpg',
    'Combine all ingredients in glass',
    '{"Irish Whiskey": "1 shot", "Baileys Irish Cream": "3/4 shot", "Coffee": "6 oz hot"}'
  ),
  (
    17044,
    'Homemade Kahlua',
    'Homemade Liqueur',
    'Collins Glass',
    'uwtsst1441254025.jpg',
    'Dissolve sugar in 2 cups of boiling water and add corn syrup. Dissolve the instant coffee in the remaining water. Pour syrup and coffee in a gallon jug. Let it cool. Add vodka and vanilla when cold. For the best result, let the mixture  mature  for 4-5 weeks.',
    '{"Sugar": "2 1/2 cups", "Corn Syrup": "1 cup", "Coffee": "1 1/2 oz instant", "Vanilla Extract": "2 oz", "Water": "3 cups boiling", "Vodka": "1 fifth"}'
  ),
  (
    178313,
    'Halloween Punch',
    'Punch / Party Drink',
    'Punch bowl',
    '7hcgyj1571687671.jpg',
    'Tip the cherry juice, orange peel, chilli, cinnamon sticks, cloves and ginger into a large saucepan. Simmer for 5 mins, then turn off the heat. Leave to cool, then chill for at least 4 hrs, or up to 2 days – the longer you leave it the more intense the flavours. If serving to young children, take the chilli out after a few hours. When you’re ready to serve, pour the juice into a jug. Serve in glass bottles or glasses and pop a straw in each. If you''re adding vodka, do so at this stage. Dangle a fangs sweet from each glass.',
    '{"Cherry Juice": "1 bottle", "Orange Peel": "3", "Red Chili Flakes": "1", "Cloves": "10", "Ginger": "6", "Vodka": "20 cl"}'
  ),
  (
    11462,
    'Harvey Wallbanger',
    'Ordinary Drink',
    'Collins glass',
    '7os4gs1606854357.jpg',
    'Stir the vodka and orange juice with ice in the glass, then float the Galliano on top. Garnish and serve.',
    '{"Vodka": "1 oz", "Galliano": "1/2 oz", "Orange Juice": "4 oz"}'
  ),
  (
    11472,
    'Hawaiian Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'ujoh9x1504882987.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Gin": "2 oz", "Triple Sec": "1/2 oz", "Pineapple Juice": "1 tblsp"}'
  ),
  (
    17201,
    'Hemingway Special',
    'Ordinary Drink',
    'Cocktail glass',
    'jfcvps1504369888.jpg',
    'Pour all ingredients into a shaker with ice. Shake.',
    '{"Rum": "12 parts", "Grapefruit Juice": "8 parts", "Maraschino Liqueur": "3 parts", "Lime Juice": "3 parts"}'
  ),
  (
    11476,
    'Highland Fling Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    '0bkwca1492975553.jpg',
    'Stir all ingredients (except olive) with ice and strain into a cocktail glass. Add the olive and serve.',
    '{"Scotch": "1 1/2 oz", "Sweet Vermouth": "3/4 oz", "Orange Bitters": "2 dashes", "Olive": "1"}'
  ),
  (
    12738,
    'Hot Chocolate to Die for',
    'Cocoa',
    'Coffee mug',
    '0lrmjp1487603166.jpg',
    'Melt the chocolate, butter and vanilla in a double boiler. When just smooth stir in the cream.',
    '{"Chocolate": "12 oz fine", "Butter": "1 tsp", "Vanilla Extract": "1/2 tsp", "Half-and-half": "1 cup", "Marshmallows": "mini"}'
  ),
  (
    17176,
    'Ipamena',
    'Ordinary Drink',
    'Wine Glass',
    'yswuwp1469090992.jpg',
    'Cut half a lime into pieces, place in a shaker, add the sugar and crush. Measure the passion fruit juice, add it to the shaker and fill up with ice cubes. Close the shaker and shake vigorously. Pour the liquid into a glass, top up with ginger ale, stir with a teaspoon and then garnish the rim of the glass with a slice of lime',
    '{"Lime": "½", "Brown Sugar": "2 tsp", "Passion Fruit Juice": "4 cl", "Ginger Ale": "top up with", "Ice": "fill"}'
  ),
  (
    13539,
    'Ice Pick',
    'Ordinary Drink',
    'Collins Glass',
    'ypsrqp1469091726.jpg',
    'Put Vodka in glass fill with iced tea. Stir in lemon to taste.',
    '{"Vodka": "1 1/2 oz", "Iced Tea": "6 oz", "Lemon Juice": " to taste"}'
  ),
  (
    12770,
    'Iced Coffee',
    'Coffee / Tea',
    'Coffee mug',
    'ytprxy1454513855.jpg',
    'Mix together until coffee and sugar is dissolved. Add milk. Shake well. Using a blender or milk shake maker produces a very foamy drink. Serve in coffee mug.',
    '{"Coffee": "1/4 cup instant", "Sugar": "1/4 cup", "Water": "1/4 cup hot", "Milk": "4 cups cold"}'
  ),
  (
    12820,
    'Irish Cream',
    'Homemade Liqueur',
    'Irish coffee cup',
    '90etyl1504884699.jpg',
    'Mix scotch and milk. Add half-and-half. Add rest.',
    '{"Scotch": "1 cup", "Half-and-half": "1 1/4 cup", "Condensed Milk": "1 can sweetened", "Coconut Syrup": "3 drops", "Chocolate Syrup": "1 tblsp"}'
  ),
  (
    11528,
    'Irish Spring',
    'Ordinary Drink',
    'Collins glass',
    'sot8v41504884783.jpg',
    'Pour all ingredients (except orange slice and cherry) into a collins glass over ice cubes. Garnish with the slice of orange, add the cherry on top, and serve.',
    '{"Irish Whiskey": "1 oz", "Peach Brandy": "1/2 oz", "Orange Juice": "1 oz", "Sweet And Sour": "1 oz", "Orange": "1 slice", "Cherry": "1"}'
  ),
  (
    13971,
    'Irish Coffee',
    'Coffee / Tea',
    'Irish coffee cup',
    'sywsqw1439906999.jpg',
    'Heat the coffee, whiskey and sugar; do not boil. Pour into glass and top with cream; serve hot.',
    '{"Irish Whiskey": "1 1/2 oz", "Coffee": "8 oz", "Sugar": "1 tsp", "Whipped Cream": "1 tblsp"}'
  ),
  (
    11524,
    'Imperial Fizz',
    'Ordinary Drink',
    'Highball glass',
    'zj1usl1504884548.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Light Rum": "1/2 oz", "Blended Whiskey": "1 1/2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Carbonated Water": "to Taste"}'
  ),
  (
    17015,
    'Irish Russian',
    'Beer',
    'Highball glass',
    'swqurw1454512730.jpg',
    'Add the ingredients in the order listed in the recipe. Care must be taken when adding the Guinness to prevent an excess of foam. Do Not add ice.',
    '{"Vodka": "1 shot", "Kahlua": "1 shot", "Coca-cola": "1 dash", "Guinness Stout": "Fill with"}'
  ),
  (
    12706,
    'Imperial Cocktail',
    'Cocktail',
    'Cocktail glass',
    'bcsj2e1487603625.jpg',
    'Shake with ice and strain into cocktail glass.',
    '{"Lime Juice": "4 cl", "Gin": "2 cl", "Aperol": "4 cl"}'
  ),
  (
    12772,
    'Iced Coffee Fillip',
    'Coffee / Tea',
    'Coffee mug',
    'sxtxrp1454514223.jpg',
    'Mix together in a coffee mug and chill before serving.',
    '{"Kahlua": "2 tsp", "Coffee": "Strong cold"}'
  ),
  (
    16987,
    'Irish Curdling Cow',
    'Cocktail',
    'Highball glass',
    'yrhutv1503563730.jpg',
    'Pour Irish Cream, Vodka, and Bourbon in a glass. Add some ice and mix in the orange juice.',
    '{"Baileys Irish Cream": "3/4 oz", "Bourbon": "3/4 oz", "Vodka": "3/4 oz", "Orange Juice": "2-3 oz"}'
  ),
  (
    16178,
    'Jitterbug',
    'Cocktail',
    'Cocktail Glass',
    'wwqvrq1441245318.jpg',
    'Wet glass, dip rim in sugar. Then add Ice. Then add everything else. It''s that simple!',
    '{"Gin": "2 jiggers", "Vodka": "1 jigger", "Grenadine": "3 dashes", "Lime Juice": "1 shot", "Sugar": "Around rim put 1 pinch", "Sugar Syrup": "3 dashes", "Soda Water": "Fill to top with"}'
  ),
  (
    17178,
    'Jam Donut',
    'Shot',
    'Shot glass',
    'uuytrp1474039804.jpg',
    'Coat the rim of a shot glass with sugar using sugar syrup to stick. Add the Chambord raspberry liqueur to the shot glass, and carefully layer the Baileys Irish Cream on top. Serve.',
    '{"Baileys Irish Cream": "2/3 oz", "Chambord Raspberry Liqueur": "1/3 oz", "Sugar Syrup": "1 tsp", "Sugar": "2 pinches"}'
  ),
  (
    13775,
    'Jelly Bean',
    'Shot',
    'Cordial glass',
    'bglc6y1504388797.jpg',
    'mix equal parts in pony glass-tastes just like a jelly bean!',
    '{"Blackberry Brandy": "1 oz", "Anis": "1 oz"}'
  ),
  (
    13847,
    'Jackhammer',
    'Ordinary Drink',
    'Collins Glass',
    '9von5j1504388896.jpg',
    'Serve over ice- Warning,Deadly!',
    '{"Jack Daniels": "1 oz", "Amaretto": "1 oz"}'
  ),
  (
    14956,
    'Jello shots',
    'Shot',
    'Shot glass',
    'l0smzo1504884904.jpg',
    'Boil 3 cups of water then add jello. Mix jello and water until jello is completely disolved. Add the two cups of vodka and mix together. Pour mixture into plastic shot glasses and chill until firm. Then, eat away...',
    '{"Vodka": "2 cups", "Jello": "3 packages", "Water": "3 cups"}'
  ),
  (
    11580,
    'John Collins',
    'Ordinary Drink',
    'Collins glass',
    '0t4bv71606854479.jpg',
    'Pour all ingredients directly into highball glass filled with ice. Stir gently. Garnish. Add a dash of Angostura bitters.',
    '{"Bourbon": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1 tsp superfine", "Club Soda": "3 oz", "Maraschino Cherry": "1", "Orange": "1"}'
  ),
  (
    14095,
    'Jamaica Kiss',
    'Shake',
    'Hurricane glass',
    'urpvvv1441249549.jpg',
    'Fill a tumbler with ice cubes. Add a shot of Tia Maria and a shot of Jamaican light rum. Fill the tumbler with milk. Blend until smooth and serve immediately.',
    '{"Coffee Liqueur": "1 shot", "Light Rum": "1 shot Jamaican", "Ice": "cubes", "Milk": "to Taste"}'
  ),
  (
    11558,
    'Japanese Fizz',
    'Ordinary Drink',
    'Highball glass',
    '37vzv11504884831.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Blended Whiskey": "1 1/2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Port": "1 tblsp", "Egg White": "1", "Carbonated Water": "to Taste"}'
  ),
  (
    12688,
    'Just a Moonmint',
    'Shake',
    'Highball Glass',
    'znald61487604035.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Milk": "2 cups", "Chocolate Syrup": "to Taste", "Mint Syrup": "to Taste"}'
  ),
  (
    15825,
    'Jamaican Coffee',
    'Coffee / Tea',
    'Champagne flute',
    'xqptps1441247257.jpg',
    'Stir the rum, coffee and water together. Top with the whipped cream. Sprinkle with a pinch of well ground coffee and drink with a straw.',
    '{"Rum": "1/6 glass", "Coffee": "1/6 glass strong black", "Water": "1/2 glass cold", "Whipped Cream": "to Taste"}'
  ),
  (
    11566,
    'Jewel Of The Nile',
    'Ordinary Drink',
    'Cocktail glass',
    'hx4nrb1504884947.jpg',
    'In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.',
    '{"Gin": "1 1/2 oz", "Green Chartreuse": "1/2 oz", "Yellow Chartreuse": "1/2 oz"}'
  ),
  (
    11542,
    'Jack Rose Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'uuqqrv1439907068.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Apple Brandy": "1 1/2 oz", "Grenadine": "1 tsp", "Lime": "Juice of 1/2"}'
  ),
  (
    16275,
    'Jack''s Vanilla Coke',
    'Other/Unknown',
    'Old-fashioned glass',
    'kjnt7z1504793319.jpg',
    'After pouring in your ingredients, and adding 3-5 ice cubes, according to taste. Stir the drink with a stirrer to get the Vanilla off the bottom.',
    '{"Ice": "4-5", "Tennessee Whiskey": "2 oz", "Vanilla Extract": "1 tsp", "Coca-cola": "10-12 oz"}'
  ),
  (
    17203,
    'Kir',
    'Ordinary Drink',
    'Wine Glass',
    'apneom1504370294.jpg',
    'Add the crème de cassis to the bottom of the glass, then top up with wine.',
    '{"Creme De Cassis": "1 part", "Champagne": "5 parts"}'
  ),
  (
    12764,
    'Karsk',
    'Ordinary Drink',
    'Highball glass',
    '808mxk1487602471.jpg',
    'Put a copper coin in a coffe-cup and fill up with coffee until you no longer see the coin, then add alcohol until you see the coin. Norwegian speciality.',
    '{"Coffee": "1 part", "Grain Alcohol": "2 parts"}'
  ),
  (
    11600,
    'Kamikaze',
    'Ordinary Drink',
    'Cocktail glass',
    'd7ff7u1606855412.jpg',
    'Shake all ingredients together with ice. Strain into glass, garnish and serve.',
    '{"Vodka": "1 oz", "Triple Sec": "1 oz", "Lime Juice": "1 oz"}'
  ),
  (
    13837,
    'Kir Royale',
    'Ordinary Drink',
    'Champagne Flute',
    'yt9i7n1504370388.jpg',
    'Pour Creme de cassis in glass, gently pour champagne on top',
    '{"Creme De Cassis": "1 part", "Champagne": "5 parts"}'
  ),
  (
    14456,
    'Kurant Tea',
    'Coffee / Tea',
    'Champagne flute',
    'xrsrpr1441247464.jpg',
    'Pour Absolut Kurant into a comfortably big tea-cup. Add the not too hot(!) apple tea and, if you like, some sugar. Enjoy!',
    '{"Absolut Kurant": "4 cl", "Tea": "Turkish apple", "Sugar": " (if needed)"}'
  ),
  (
    14752,
    'Kiwi Lemon',
    'Ordinary Drink',
    'Highball glass',
    'tpupvr1478251697.jpg',
    'Mix in highball glass. Stirr. Garnish with slice of kiwi.',
    '{"Kiwi Liqueur": "1 part", "Bitter Lemon": "2 parts", "Ice": "cubes"}'
  ),
  (
    16951,
    'Kioki Coffee',
    'Coffee / Tea',
    'Coffee mug',
    'uppqty1441247374.jpg',
    'Stir. Add whipped cream to the top.',
    '{"Kahlua": "1 oz", "Brandy": "1/2 oz", "Coffee": "to Taste"}'
  ),
  (
    178359,
    'Kiwi Martini',
    'Cocktail',
    'Cocktail glass',
    'bmxmyq1630407098.jpg',
    'The kiwi martini is a very fun vodka cocktail and it is one of the best drinks that makes use of fresh fruit. Though there are a few recipes floating around, this is one of the easiest and it is an absolutely delightful green martini to drink. For this recipe, you''ll simply muddle slices of kiwi with simple syrup, then shake it with vodka. It''s a drink that anyone can mix up in minutes and a perfect cocktail to show off your favorite vodka.',
    '{"Kiwi": "Garnish with", "Sugar Syrup": "1 tsp", "Vodka": "1 1/2 oz"}'
  ),
  (
    13190,
    'Kool-Aid Shot',
    'Shot',
    'Old-fashioned glass',
    'fegm621503564966.jpg',
    'Pour into a large glass with ice and stir. Add a little cranberry juice to taste.',
    '{"Vodka": "1 shot", "Amaretto": "1 shot", "Sloe Gin": "1 shot", "Triple Sec": "1 shot", "Cranberry Juice": "to Taste"}'
  ),
  (
    15026,
    'Kiss me Quick',
    'Ordinary Drink',
    'Highball glass',
    'm7iaxu1504885119.jpg',
    'mix in the glass',
    '{"Cranberry Vodka": "4 cl", "Apfelkorn": "2 cl", "Schweppes Russchian": "7 cl", "Apple Juice": "8 cl", "Ice": "cubes"}'
  ),
  (
    17006,
    'Kool First Aid',
    'Shot',
    'Shot glass',
    'hfp6sv1503564824.jpg',
    'Add Kool Aid to a double shot glass, and top with rum. Slam and shoot.',
    '{"151 Proof Rum": "2 oz light", "Kool-aid": "1/2 tsp Tropical"}'
  ),
  (
    11602,
    'Kentucky B And B',
    'Ordinary Drink',
    'Brandy snifter',
    'sqxsxp1478820236.jpg',
    'Pour the bourbon and Benedictine into a brandy snifter.',
    '{"Bourbon": "2 oz", "Benedictine": "1/2 oz"}'
  ),
  (
    11604,
    'Kentucky Colonel',
    'Ordinary Drink',
    'Cocktail glass',
    'utqwpu1478820348.jpg',
    'In a shaker half-filled with ice cubes combine the courbon and Benedictine. Shake and strain into a cocktail glass. Garnish with the lemon twist.',
    '{"Bourbon": "3 oz", "Benedictine": "1/2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    14446,
    'Kool-Aid Slammer',
    'Shot',
    'Shot glass',
    'kugu2m1504735473.jpg',
    'Fill half the shot glass with the kool-aid first. Then put a paper towel over the top of the glass and slowly pour in the vodka. If you do it right, you should be able to see that the two liquids are separated, with the vodka on top. Now slam it! The last thing you''ll taste is the kool-aid.',
    '{"Kool-aid": "1/2 oz Grape", "Vodka": "1/2 oz"}'
  ),
  (
    12714,
    'Kiwi Papaya Smoothie',
    'Other/Unknown',
    'Highball Glass',
    'jogv4w1487603571.jpg',
    'Throw everything into a blender and liquify.',
    '{"Kiwi": "3", "Papaya": "1/2"}'
  ),
  (
    12720,
    'Kill the cold Smoothie',
    'Other/Unknown',
    'Highball glass',
    '7j1z2e1487603414.jpg',
    'Juice ginger and lemon and add it to hot water. You may add cardomom.',
    '{"Ginger": "1 inch", "Lemon": "1/4", "Water": "1 cup hot"}'
  ),
  (
    12704,
    'Limeade',
    'Other/Unknown',
    'Highball glass',
    '5jdp5r1487603680.jpg',
    'In a large glass, put the lime juice and sugar, and stir well. Add cold seltzer water to fill. Put the lime peels in the glass. Drink. Repeat until limes or soda run out.',
    '{"Lime": "Juice of 1", "Sugar": "1 tblsp", "Soda Water": " (seltzer water)", "Lime Peel": "to Taste"}'
  ),
  (
    14378,
    'Lunch Box',
    'Beer',
    'Pint glass',
    'qywpvt1454512546.jpg',
    'Fill a pint glass almost full with beer. Then fill the rest with orange juice (careful not to fill it to the top). Then take the shot of Amaretto and drop it in.',
    '{"Beer": "3/4 bottle", "Amaretto": "1 shot", "Orange Juice": "1 oz"}'
  ),
  (
    12752,
    'Lemon Shot',
    'Shot',
    'Shot glass',
    'mx31hv1487602979.jpg',
    'Mix Galliano and Absolut Citron in a shot glass, lay lemon wedge sprinkled with sugar over glass and pour a rum over wedge and glass. light rum with a lighter and let burn for a second. Do shot quickly and suck on lemon. If it is done correctly, this will taste like a shot of sweet lemonade.',
    '{"Galliano": "1/2 oz", "Absolut Citron": "1/2 oz", "Lemon": " wedge", "Sugar": "Bacardi", "151 Proof Rum": "to Taste"}'
  ),
  (
    13196,
    'Long vodka',
    'Ordinary Drink',
    'Highball glass',
    '9179i01503565212.jpg',
    'Shake a tall glass with ice cubes and Angostura, coating the inside of the glass. Por the vodka onto this, add 1 slice of lime and squeeze juice out of remainder, mix with tonic, stir and voila you have a Long Vodka',
    '{"Vodka": "5 cl", "Lime": "1/2", "Angostura Bitters": "4 dashes", "Tonic Water": "1 dl Schweppes", "Ice": "4"}'
  ),
  (
    14366,
    'Lemon Drop',
    'Cocktail',
    'Cocktail glass',
    'mtpxgk1504373297.jpg',
    'Shake and strain into a chilled cocktail glass rimmed with sugar.',
    '{"Absolut Vodka": "1 1/2 shot", "Cointreau": "1 1/2 shot", "Lemon": "Juice of 1 wedge"}'
  ),
  (
    11658,
    'Loch Lomond',
    'Ordinary Drink',
    'Cocktail glass',
    'rpvtpr1468923881.jpg',
    'In a mixing glass half-filled with ice cubes, combine the Scotch, Drambuie, and vermouth. Stir well. Strain into a cocktail glass. Garnish with the lemon twist.',
    '{"Scotch": "2 oz", "Drambuie": "1/2 oz", "Dry Vermouth": "1/2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    11662,
    'London Town',
    'Ordinary Drink',
    'Cocktail glass',
    'rpsrqv1468923507.jpg',
    'In a mixing glass half-filled with ice cubes, combine all of the ingredients. Stir well. Strain into a cocktail glass.',
    '{"Gin": "1 1/2 oz", "Maraschino Liqueur": "1/2 oz", "Orange Bitters": "2 dashes"}'
  ),
  (
    12692,
    'Lassi Khara',
    'Other/Unknown',
    'Highball Glass',
    'm1suzm1487603970.jpg',
    'Blend (frappe) in blender until frothy. Add torn curry leaves and serve cold.',
    '{"Yoghurt": "1 cup", "Water": "2 cups cold", "Salt": "1 tsp", "Asafoetida": "1 pinch"}'
  ),
  (
    12694,
    'Lassi Raita',
    'Other/Unknown',
    'Highball Glass',
    's4x0qj1487603933.jpg',
    'Blend the yoghurt and ice cubes together, until the yoghurt becomes more liquid. Add sugar to taste. The lemon/lime is optional but it gives it a slightly tart taste. Dash of salt. Raita is also good for the summer. Instead of having a traditional salad you can make raita instead.',
    '{"Yoghurt": "2 cups", "Ice": "4-6", "Sugar": "to Taste", "Lime": "to Taste", "Salt": "to Taste"}'
  ),
  (
    12702,
    'Lemouroudji',
    'Other/Unknown',
    'Highball Glass',
    'eirmo71487603745.jpg',
    'Juice the lemons. Peel and grate the ginger. Place the grated ginger and a liberal dash of the cayenne pepper into a piece of cheesecloth, and tie it into a knot. Let soak in the water. After 15 minutes or so, add the sugar, and the lemon juice. Chill, and serve.',
    '{"Ginger": "2 pieces", "Water": "1 gal", "Lemon": "1 lb", "Sugar": "1 cup", "Cayenne Pepper": "ground"}'
  ),
  (
    11670,
    'Lord And Lady',
    'Ordinary Drink',
    'Old-fashioned glass',
    'quwrys1468923219.jpg',
    'Pour the rum and Tia Maria into an old-fashioned glass almost filled with ice cubes. Stir well.',
    '{"Dark Rum": "1 1/2 oz", "Tia Maria": "1/2 oz"}'
  ),
  (
    12696,
    'Lassi - Sweet',
    'Other/Unknown',
    'Highball glass',
    '9jeifz1487603885.jpg',
    'Put all ingredients into a blender and blend until nice and frothy. Serve chilled.',
    '{"Yoghurt": "1 cup", "Water": "2 cups cold", "Sugar": "4 tblsp", "Salt": "pinch", "Lemon Juice": "2 tblsp"}'
  ),
  (
    12698,
    'Lassi - Mango',
    'Other/Unknown',
    'Highball glass',
    '1bw6sd1487603816.jpg',
    'Put it all in a blender and pour over crushed ice. You can also use other fruits like strawberries and bananas.',
    '{"Mango": "2", "Yoghurt": "2 cups", "Sugar": "1/2 cup", "Water": "1 cup iced"}'
  ),
  (
    15086,
    'Limona Corona',
    'Beer',
    'Beer Glass',
    'wwqrsw1441248662.jpg',
    'Open the Corona. Fill the empty space in the neck in the bottle with the rum. The bottle should be filled to the top. Plug the bottle with your thumb or the palm of your hand. Turn the bottle upside-down so the rum and beer mix. Turn the bottle rightside-up, unplug, and drink.',
    '{"Corona": "1 bottle", "Bacardi Limon": "1 oz"}'
  ),
  (
    11634,
    'Lady Love Fizz',
    'Ordinary Drink',
    'Cocktail glass',
    '20d63k1504885263.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a cocktail glass over two ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Gin": "2 oz", "Light Cream": "2 tsp", "Powdered Sugar": "1 tsp", "Lemon": "Juice of 1/2", "Egg White": "1", "Carbonated Water": "to Taste"}'
  ),
  (
    11002,
    'Long Island Tea',
    'Ordinary Drink',
    'Highball glass',
    'nkwr4c1606770558.jpg',
    'Combine all ingredients (except cola) and pour over ice in a highball glass. Add the splash of cola for color. Decorate with a slice of lemon and serve.',
    '{"Vodka": "1/2 oz", "Light Rum": "1/2 oz", "Gin": "1/2 oz", "Tequila": "1/2 oz", "Lemon": "Juice of 1/2", "Coca-cola": "1 splash"}'
  ),
  (
    11666,
    'Lone Tree Cooler',
    'Ordinary Drink',
    'Collins glass',
    'wsyqry1479298485.jpg',
    'Stir powdered sugar and 2 oz. carbonated water in a collins glass. Fill glass with ice, add gin and vermouth, and stir. Fill with carbonated water and stir again. Add the twist of lemon peel and the orange spiral so that the end dangles over rim of glass.',
    '{"Carbonated Water": "to Taste", "Gin": "to Taste", "Dry Vermouth": "to Taste", "Powdered Sugar": "to Taste", "Orange Spiral": "to Taste", "Lemon Peel": "to Taste"}'
  ),
  (
    11664,
    'Lone Tree Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'tsxpty1468923417.jpg',
    'Stir ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Sweet Vermouth": "3/4 oz", "Gin": "1 1/2 oz"}'
  ),
  (
    178335,
    'Lazy Coconut Paloma',
    'Cocktail',
    'Highball glass',
    'rytuex1598719770.jpg',
    'Mix the coconut liqueur (preferably tequila) with the grapefruit juice and top with soda water. Garnish with a large grapefruit slice against the inside of the glass.',
    '{"Coconut Liqueur": "30 ml", "Grapefruit Juice": "75 ml", "Soda Water": "Top"}'
  ),
  (
    17204,
    'Long Island Iced Tea',
    'Ordinary Drink',
    'Highball glass',
    'wx7hsg1504370510.jpg',
    'Mix all contents in a highball glass and sitr gently. Add dash of Coca-Cola for the coloring and garnish with lemon or lime twist.',
    '{"Vodka": "1/2 oz", "Tequila": "1/2 oz", "Light Rum": "1/2 oz", "Gin": "1/2 oz", "Coca-cola": "1 dash", "Lemon Peel": "Twist of"}'
  ),
  (
    178360,
    'Lemon Elderflower Spritzer',
    'Cocktail',
    'Highball glass',
    '125w0o1630407389.jpg',
    'Pour all ingredients over ice, stir and enjoy!',
    '{"Elderflower Cordial": "2 tsp", "Vodka": "1 shot", "Soda Water": "1/3 cup", "Fresh Lemon Juice": "Top"}'
  ),
  (
    12690,
    'Lassi - A South Indian Drink',
    'Other/Unknown',
    'Highball Glass',
    'iq6scx1487603980.jpg',
    'Blend in a blender for 3 seconds. Lassi is one of the easiest things to make, and there are many ways of making it. Basically, it is buttermilk (yoghurt whisked with water), and you can choose almost any consistency that you like, from the thinnest to the thickest. Serve cold.',
    '{"Yoghurt": "1/2 cup plain", "Water": "1 1/4 cup cold", "Cumin Seed": "1/2 tsp ground roasted", "Salt": "1/4 tsp", "Mint": "1/4 tsp dried"}'
  ),
  (
    12776,
    'Melya',
    'Coffee / Tea',
    'Coffee mug',
    'xwtptq1441247579.jpg',
    'Brew espresso. In a coffee mug, place 1 teaspoon of unsweetened powdered cocoa, then cover a teaspoon with honey and drizzle it into the cup. Stir while the coffee brews, this is the fun part. The cocoa seems to coat the honey without mixing, so you get a dusty, sticky mass that looks as though it will never mix. Then all at once, presto! It looks like dark chocolate sauce. Pour hot espresso over the honey, stirring to dissolve. Serve with cream.',
    '{"Espresso": "to Taste", "Honey": "Unsweetened", "Cocoa Powder": "to Taste"}'
  ),
  (
    11000,
    'Mojito',
    'Cocktail',
    'Highball glass',
    'metwgh1606770327.jpg',
    'Muddle mint leaves with sugar and lime juice. Add a splash of soda water and fill the glass with cracked ice. Pour the rum and top with soda water. Garnish and serve with straw.',
    '{"Light Rum": "2-3 oz", "Lime": "Juice of 1", "Sugar": "2 tsp", "Mint": "2-4", "Soda Water": "to Taste"}'
  ),
  (
    17205,
    'Mimosa',
    'Ordinary Drink',
    'Champagne flute',
    'juhcuu1504370685.jpg',
    'Ensure both ingredients are well chilled, then mix into the glass. Serve cold.',
    '{"Champagne": "Chilled", "Orange Juice": "2 oz"}'
  ),
  (
    11690,
    'Mai Tai',
    'Ordinary Drink',
    'Collins glass',
    'twyrrp1439907470.jpg',
    'Shake all ingredients with ice. Strain into glass. Garnish and serve with straw.',
    '{"Light Rum": "1 oz", "Orgeat Syrup": "1/2 oz", "Triple Sec": "1/2 oz", "Sweet And Sour": "1 1/2 oz", "Cherry": "1"}'
  ),
  (
    11728,
    'Martini',
    'Cocktail',
    'Cocktail glass',
    '71t8581504353095.jpg',
    'Straight: Pour all ingredients into mixing glass with ice cubes. Stir well. Strain in chilled martini cocktail glass. Squeeze oil from lemon peel onto the drink, or garnish with olive.',
    '{"Gin": "1 2/3 oz", "Dry Vermouth": "1/3 oz", "Olive": "1"}'
  ),
  (
    11007,
    'Margarita',
    'Ordinary Drink',
    'Cocktail glass',
    '5noda61589575158.jpg',
    'Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.',
    '{"Tequila": "1 1/2 oz", "Triple Sec": "1/2 oz", "Lime Juice": "1 oz", "Salt": "to Taste"}'
  ),
  (
    11008,
    'Manhattan',
    'Cocktail',
    'Cocktail glass',
    'yk70e31606771240.jpg',
    'Stirred over ice, strained into a chilled glass, garnished, and served up.',
    '{"Sweet Vermouth": "3/4 oz", "Bourbon": "2 1/2 oz Blended", "Angostura Bitters": "dash", "Ice": "2 or 3", "Maraschino Cherry": "1", "Orange Peel": "1 twist of"}'
  ),
  (
    178343,
    'Michelada',
    'Cocktail',
    'Pint glass',
    'u736bd1605907086.jpg',
    'Mix the beer with tomato juice, freshly squeezed lime juice, and Worcestershire sauce, teriyaki sauce, soy sauce, or hot sauce. Served In a chilled, salt-rimmed glass',
    '{"Beer": "4 oz", "Tomato Juice": "4 oz", "Lime Juice": "1 tblsp", "Hot Sauce": "Dash", "Worcestershire Sauce": "Dash", "Soy Sauce": "Dash"}'
  ),
  (
    13936,
    'Miami Vice',
    'Cocktail',
    'Cocktail glass',
    'qvuyqw1441208955.jpg',
    'First: Mix pina colada with 2.5 oz. of rum with ice(set aside). Second: Mix daiquiri with 2.5 oz. of rum with ice. Third: While frozen, add pina colda mix then daiquiri mix in glass (Making sure they do not get mixed together).',
    '{"151 Proof Rum": "5 oz Bacardi", "Pina Colada Mix": "frozen", "Daiquiri Mix": "frozen"}'
  ),
  (
    16041,
    'Mudslinger',
    'Punch / Party Drink',
    'Punch bowl',
    'hepk6h1504885554.jpg',
    'Add all contents to a large jug or punch bowl. Stir well!',
    '{"Southern Comfort": "750 ml", "Orange Juice": "1 L", "Pepsi Cola": "750 ml"}'
  ),
  (
    16196,
    'Moranguito',
    'Shot',
    'Shot glass',
    'urpsyq1475667335.jpg',
    'first you put rhe absinthe, then put tequila, then put the Granadine syrup.',
    '{"Absinthe": "2/5", "Tequila": "2/5", "Grenadine": "1/5"}'
  ),
  (
    17206,
    'Mint Julep',
    'Ordinary Drink',
    'Collins glass',
    'squyyq1439907312.jpg',
    'In a highball glass gently muddle the mint, sugar and water. Fill the glass with cracked ice, add Bourbon and stir well until the glass is well frosted. Garnish with a mint sprig.',
    '{"Mint": "4 fresh", "Bourbon": "2 1/2 oz", "Powdered Sugar": "1 tsp", "Water": "2 tsp"}'
  ),
  (
    17256,
    'Martinez 2',
    'Cocktail',
    'Cocktail glass',
    'fs6kiq1513708455.jpg',
    'Add all ingredients to a mixing glass and fill with ice. Stir until chilled, and strain into a chilled coupe glass.',
    '{"Gin": "1 1/2 oz", "Sweet Vermouth": "1 1/2 oz", "Maraschino Liqueur": "1 tsp", "Angostura Bitters": "2 dashes"}'
  ),
  (
    12774,
    'Masala Chai',
    'Coffee / Tea',
    'Coffee Mug',
    'uyrpww1441246384.jpg',
    'Bring 2 cups of water to boil. Add all the ingredients and boil again for about 15 seconds. Let stand for a minute. Warm milk in a pot. Filter tea into cups. Add milk and sugar. That''s IT.',
    '{"Water": "2 cups", "Tea": "3-4 tsp", "Ginger": "1 chunk dried", "Cardamom": "3-4 crushed", "Cloves": "3", "Cinnamon": "1 piece", "Black Pepper": "1-2 whole", "Sugar": " to taste", "Milk": "to Taste"}'
  ),
  (
    12988,
    'Mulled Wine',
    'Punch / Party Drink',
    'Collins Glass',
    'iuwi6h1504735724.jpg',
    'Simmer 3 cups water with, sugar, cloves, cinnamon sticks, and lemon peel in a stainless steel pot for 10 minutes. Add wine heat to a  coffee temperature  (DO NOT BOIL) then add the brandy.',
    '{"Water": "3 cups", "Sugar": "1 cup", "Cloves": "12", "Cinnamon": "2", "Lemon Peel": "1", "Red Wine": "750 ml", "Brandy": "1/4 cup"}'
  ),
  (
    11009,
    'Moscow Mule',
    'Punch / Party Drink',
    'Copper Mug',
    '3pylqc1504370988.jpg',
    'Combine vodka and ginger beer in a highball glass filled with ice. Add lime juice. Stir gently. Garnish.',
    '{"Vodka": "2 oz", "Lime Juice": "2 oz", "Ginger Ale": "8 oz"}'
  ),
  (
    14209,
    'Mocha-Berry',
    'Coffee / Tea',
    'Irish coffee cup',
    'vtwyyx1441246448.jpg',
    'pour 6 oz. of coffee in a mug or Irish coffee cup. add coca mix and chambord, mix well and top off with whipped cream.',
    '{"Coffee": "6 oz", "Chambord Raspberry Liqueur": "2 oz", "Cocoa Powder": "2 tblsp", "Whipped Cream": "to Taste"}'
  ),
  (
    178315,
    'Munich Mule',
    'Cocktail',
    'Highball glass',
    'rj55pl1582476101.jpg',
    'Fill glass with ice Pour Gin and Lime Juice Fill glass with Ginger Beer Garnish with Cucumer and Lime slice',
    '{"Gin": "5 cl", "Lime Juice": "2 cl", "Ginger Beer": "10 cl", "Cucumber": "Chopped", "Lemon": "Chopped"}'
  ),
  (
    15841,
    'Mojito Extra',
    'Cocktail',
    'Collins glass',
    'vwxrsw1478251483.jpg',
    'Put mint with lemon juice in a glas, mash the mint with a spoon, ice, rum & fill up with club soda. Top it with Angostura.',
    '{"Mint": "1/2 handful", "Lemon Juice": "3 cl", "Dark Rum": "1/8 L Jamaican", "Club Soda": "1/8 L", "Angostura Bitters": "8 drops"}'
  ),
  (
    17189,
    'Monkey Gland',
    'Ordinary Drink',
    'Cocktail glass',
    '94psp81504350690.jpg',
    'Shake well over ice cubes in a shaker, strain into a chilled cocktail glass.',
    '{"Gin": "2 oz", "Benedictine": "1 tsp", "Orange Juice": "1/2 oz", "Grenadine": "1 tsp"}'
  ),
  (
    178358,
    'Mango Mojito',
    'Cocktail',
    'Jar',
    'wfqmgm1630406820.jpg',
    'Squeeze the juice from 1½ limes and blend with the mango to give a smooth purée. Cut the rest of the limes into quarters, and then cut each wedge in half again. Put 2 pieces of lime in a highball glass for each person and add 1 teaspoon of caster sugar and 5-6 mint leaves to each glass. Squish everything together with a muddler or the end of a rolling pin to release all the flavours from the lime and mint. Divide the mango purée between the glasses and add 30ml white rum and a handful of crushed ice to each one, stirring well to mix everything together. Top up with soda water to serve and garnish with extra mint, if you like.',
    '{"Lime": "3", "Mango": "Garnish with", "Mint": "Sprig", "White Rum": "200 ml", "Ice": "cubes", "Soda Water": "Top"}'
  ),
  (
    11798,
    'Monkey Wrench',
    'Ordinary Drink',
    'Old-fashioned glass',
    'bw2noj1582473243.jpg',
    'Pour all of the ingredients into an old-fashioned glass almost filled with ice cubes. Stir well.',
    '{"Light Rum": "1 1/2 oz", "Grapefruit Juice": "3 oz", "Bitters": "1 dash"}'
  ),
  (
    13825,
    'Midnight Manx',
    'Ordinary Drink',
    'Old-fashioned glass',
    'uqqurp1441208231.jpg',
    'Fill a mixer with ice and add Baileys, Kahlua, Goldshlager, and cream. Shake for 5 seconds and Strain into a double rocks glass filled with ice. Add chilled coffee Stir and enjoy!',
    '{"Kahlua": "1 oz", "Baileys Irish Cream": "1 oz", "Goldschlager": "dash", "Heavy Cream": "2 oz", "Coffee": "2 oz Hazlenut"}'
  ),
  (
    14053,
    'Mother''s Milk',
    'Shot',
    'Shot glass',
    '7stuuh1504885399.jpg',
    'Shake over ice, strain. Serves two.',
    '{"Goldschlager": "1 oz", "Butterscotch Schnapps": "1 oz", "Milk": "1 oz"}'
  ),
  (
    14842,
    'Midnight Mint',
    'Cocktail',
    'Cocktail glass',
    'svuvrq1441208310.jpg',
    'If available, rim cocktail (Martini) glass with sugar syrup then dip into chocolate flakes or powder. Add ingredients into shaker with ice. Shake well then strain into cocktail glass.',
    '{"Baileys Irish Cream": "1 oz", "White Creme De Menthe": "3/4 oz", "Cream": "3/4 oz double"}'
  ),
  (
    17188,
    'Mary Pickford',
    'Cocktail',
    'Cocktail glass',
    'f9erqb1504350557.jpg',
    'Shake and strain into a chilled large cocktail glass',
    '{"Light Rum": "1 1/2 oz", "Pineapple Juice": "1 oz", "Maraschino Liqueur": "1/2 tsp", "Grenadine": "1/2 tsp", "Maraschino Cherry": "1"}'
  ),
  (
    15224,
    'Malibu Twister',
    'Cocktail',
    'Highball glass',
    '2dwae41504885321.jpg',
    'Add rum & trister then, add cranberry jucie,stir',
    '{"Malibu Rum": "2 parts", "Tropicana": "2 parts", "Cranberry Juice": "1 part"}'
  ),
  (
    11766,
    'Midnight Cowboy',
    'Ordinary Drink',
    'Cocktail glass',
    'vsxxwy1441208133.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Bourbon": "2 oz", "Dark Rum": "1 oz", "Heavy Cream": "1/2 oz"}'
  ),
  (
    178355,
    'Mountain Bramble',
    'Cocktail',
    'Old-fashioned glass',
    'stwiva1619704025.jpg',
    'Muddle the blackberries in a tumbler glass. Mix the Gin, lemon juice and sugar syrup in a shaker and strain over chopped ice. Top with Soda water and garnish with more blackberries and some mint',
    '{"Gin": "2 oz", "Lemon Juice": "0.75 oz", "Sugar Syrup": "0.75 oz", "Blackberries": "Ground", "Soda Water": "Top", "Mint": "Garnish with"}'
  ),
  (
    11720,
    'Martinez Cocktail',
    'Cocktail',
    'Cocktail glass',
    'wwxwvr1439906452.jpg',
    'Stir all ingredients (except cherry) with ice and strain into a cocktail glass. Top with the cherry and serve.',
    '{"Gin": "1 oz", "Dry Vermouth": "1 oz", "Triple Sec": "1/4 tsp", "Orange Bitters": "1 dash", "Cherry": "1"}'
  ),
  (
    12744,
    'Microwave Hot Cocoa',
    'Cocoa',
    'Coffee mug',
    '8y4x5f1487603151.jpg',
    'Combine sugar, cocoa, salt and hot water in 1-quart micro-proof measuring cup (or coffee mug). Microwave at HIGH (100%) for 1 to 1 1/2 minutes or until boiling. Add milk, sitr and microwave an additonal 1 1/2 to 2 minutes or until hot. Stir in vanilla, blend well.',
    '{"Sugar": "5 tblsp", "Cocoa Powder": "3 tblsp", "Salt": "1 dash", "Water": "3 tblsp hot", "Milk": "2 cups", "Vanilla Extract": "1/4 tsp"}'
  ),
  (
    12716,
    'Mango Orange Smoothie',
    'Other/Unknown',
    'Highball Glass',
    'vdp2do1487603520.jpg',
    'Throw everything into a blender and liquify.',
    '{"Mango": "1", "Orange": "2"}'
  ),
  (
    11786,
    'Mississippi Planters Punch',
    'Ordinary Drink',
    'Collins glass',
    'urpyqs1439907531.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a collins glass over ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Brandy": "1 oz", "Light Rum": "1/2 oz", "Bourbon": "1/2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tblsp", "Carbonated Water": "to Taste"}'
  ),
  (
    11003,
    'Negroni',
    'Ordinary Drink',
    'Old-fashioned glass',
    'qgdu971561574065.jpg',
    'Stir into glass over ice, garnish and serve.',
    '{"Gin": "1 oz", "Campari": "1 oz", "Sweet Vermouth": "1 oz"}'
  ),
  (
    11844,
    'New York Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    '61wgch1504882795.jpg',
    'Shake blended whiskey, juice of lemon, and powdered sugar with ice and strain into a whiskey sour glass. Float claret on top. Decorate with the half-slice of lemon and the cherry and serve.',
    '{"Blended Whiskey": "2 oz", "Lemon": "to Taste", "Sugar": "1 tsp", "Red Wine": " (Claret)", "Cherry": "to Taste"}'
  ),
  (
    13861,
    'Nutty Irishman',
    'Shake',
    'Highball Glass',
    'xspupx1441248014.jpg',
    'Serve over ice',
    '{"Baileys Irish Cream": "1 part", "Frangelico": "1 part", "Milk": "1 part"}'
  ),
  (
    13192,
    'National Aquarium',
    'Ordinary Drink',
    'Collins Glass',
    'dlw0om1503565021.jpg',
    'Pour all ingredients into a shaker of ice. Shake well. Serve on the rocks.',
    '{"Rum": "1/2 oz", "Vodka": "1/2 oz", "Gin": "1/2 oz", "Blue Curacao": "1/2 oz", "Sour Mix": "2 oz", "Lemon-lime Soda": "1 splash"}'
  ),
  (
    13204,
    'New York Lemonade',
    'Cocktail',
    'Cocktail glass',
    'b3n0ge1503565473.jpg',
    'Serve in a chilled cocktail glass. Lemon and sugar the rim. Stir and Strain.',
    '{"Absolut Citron": "2 oz", "Grand Marnier": "1 oz", "Lemon Juice": "2 oz sweetened", "Club Soda": "1 oz"}'
  ),
  (
    12746,
    'Nuked Hot Chocolate',
    'Cocoa',
    'Coffee mug',
    'xcu6nb1487603142.jpg',
    'Mix with a bit of milk (1 oz or so) in coffee mug. Nuke mug for about 30-50 seconds. Stir until the heated cocoa dissolves. Fill mug with milk. Nuke for 1-2 minutes, depending on wattage and preferences as to burnt mouth parts.',
    '{"Cocoa Powder": "2 tsp", "Sugar": "1 tsp", "Vanilla Extract": "1/2 tsp", "Milk": "12 oz"}'
  ),
  (
    11872,
    'Orgasm',
    'Ordinary Drink',
    'Cocktail glass',
    'vr6kle1504886114.jpg',
    'Shake all ingredients with ice, strain into a chilled cocktail glass, and serve.',
    '{"Creme De Cacao": "1/2 oz white", "Amaretto": "1/2 oz", "Triple Sec": "1/2 oz", "Vodka": "1/2 oz", "Light Cream": "1 oz"}'
  ),
  (
    17827,
    'Old Pal',
    'Cocktail',
    'Nick and Nora Glass',
    'x03td31521761009.jpg',
    'Chill cocktail glass. Add ingredients to a mixing glass, and fill 2/3 full with ice. Stir about 20 seconds. Empty cocktail glass and strain into the glass. Garnish with a twist of lemon peel.',
    '{"Rye Whiskey": "2 oz", "Campari": "1 oz", "Dry Vermouth": "1 oz"}'
  ),
  (
    12618,
    'Orangeade',
    'Cocktail',
    'Highball glass',
    'ytsxxw1441167732.jpg',
    'Place some ice cubes in a large tumbler or highball glass, add lemon juice, orange juice, sugar syrup, and stir well. Top up with cold soda water, serve with a drinking straw.',
    '{"Lemon Juice": "5 cl", "Orange Juice": "15 cl", "Sugar Syrup": "2-3 cl", "Soda Water": "to Taste"}'
  ),
  (
    16995,
    'Orange Whip',
    'Other/Unknown',
    'Collins Glass',
    'ttyrxr1454514759.jpg',
    'Pour ingredients over ice and stir.',
    '{"Orange Juice": "4 oz", "Rum": "1 oz", "Vodka": "1 oz", "Cream": "1 package", "Ice": "Over"}'
  ),
  (
    11870,
    'Orange Oasis',
    'Ordinary Drink',
    'Highball glass',
    'su1olx1582473812.jpg',
    'Shake brandy, gin, and orange juice with ice and strain into a highball glass over ice cubes. Fill with ginger ale, stir, and serve.',
    '{"Cherry Brandy": "1/2 oz", "Gin": "1 1/2 oz", "Orange Juice": "4 oz", "Ginger Ale": "to Taste"}'
  ),
  (
    15330,
    'Orange Crush',
    'Shot',
    'Shot glass',
    'zvoics1504885926.jpg',
    'Add all ingredients to tumbler-Pour as shot',
    '{"Vodka": "1 oz", "Triple Sec": "1 oz", "Orange Juice": "1 oz"}'
  ),
  (
    11001,
    'Old Fashioned',
    'Cocktail',
    'Old-fashioned glass',
    'vrwquq1478252802.jpg',
    'Place sugar cube in old fashioned glass and saturate with bitters, add a dash of plain water. Muddle until dissolved. Fill the glass with ice cubes and add whiskey. Garnish with orange twist, and a cocktail cherry.',
    '{"Bourbon": "4.5 cL", "Angostura Bitters": "2 dashes", "Sugar": "1 cube", "Water": "dash"}'
  ),
  (
    13499,
    'Oreo Mudslide',
    'Ordinary Drink',
    'Collins Glass',
    'tpwwut1468925017.jpg',
    'Blend Vodka, Kahlua, Bailey''s, ice-cream and the Oreo well in a blender. Pour into a large frosted glass. Garnish with whipped cream and a cherry.',
    '{"Vodka": "1 oz", "Kahlua": "1 oz", "Baileys Irish Cream": "1 oz", "Vanilla Ice-cream": "2 scoops", "Oreo Cookie": "1"}'
  ),
  (
    14586,
    'Orange Push-up',
    'Ordinary Drink',
    'Hurricane glass',
    'mgf0y91503565781.jpg',
    'Combine liquors in a blender. Add a half scoop of ice and blend. Garnish with an orange and cherry flag. So good it will melt in your mouth!!!',
    '{"Spiced Rum": "1.5 oz", "Grenadine": "0.5 oz", "Orange Juice": "4 oz", "Sour Mix": "1 splash"}'
  ),
  (
    17266,
    'Oatmeal Cookie',
    'Cocktail',
    'Mason jar',
    'bsvmlg1515792693.jpg',
    'Just mix it all together. It''s meant to be a shot, but it works just fine as a proper adult-sized drink over lots of ice. Tastes like an oatmeal cookie.',
    '{"Kahlua": "2 parts", "Baileys Irish Cream": "2 parts", "Butterscotch Schnapps": "4 parts", "Jagermeister": "1 part", "Goldschlager": "1/2 part"}'
  ),
  (
    178341,
    'Orange Rosemary Collins',
    'Cocktail',
    'Highball glass',
    'mokcas1604179977.jpg',
    'Add the spirits to the bottom of the glass and top equally with the mixer drinks. Garnish with orange slices inside the glass as well as some rosemary on top.',
    '{"Gin": "1 shot", "Orange Juice": "Top", "Lemon Juice": "Top", "Rosemary Syrup": "25 ml", "Soda Water": "Top", "Rosemary": "Garnish with", "Orange Peel": "Garnish with"}'
  ),
  (
    12748,
    'Orange Scented Hot Chocolate',
    'Cocoa',
    'Coffee mug',
    'hdzwrh1487603131.jpg',
    'Combine all ingredients in heavy medium saucepan. Stir over low heat until chocolate melts. Increase heat and bring just to a boil, stirring often. Remove from heat and whisk untily frothy. Return to heat and bring to boil again. Remove from heat, whisk until frothy. Repeat heating and whisking once again. Discard orange peel. (Can be prepared 2 hours ahead. Let stand at room temperature. Before serving, bring just to boil, remove from heat and whisk until frothy.) Pour hot chocolate into coffee mugs. Makes 2 servings.',
    '{"Milk": "2 cups", "Chocolate": "4 oz chopped bittersweet or semi-sweet", "Orange Peel": "3 2-inch strips", "Espresso": "1/2 tsp instant", "Nutmeg": "1/8 tsp ground"}'
  ),
  (
    13200,
    'Owen''s Grandmother''s Revenge',
    'Ordinary Drink',
    'Highball glass',
    '0wt4uo1503565321.jpg',
    'Add ingredients and mix in blender.',
    '{"Whiskey": "12 oz", "Beer": "12 oz", "Lemonade": "12 oz frozen", "Ice": "1 cup crushed"}'
  ),
  (
    17253,
    'Paloma',
    'Cocktail',
    'Collins glass',
    'samm5j1513706393.jpg',
    'Stir together and serve over ice.',
    '{"Grape Soda": "3 oz", "Tequila": "1 1/2 oz"}'
  ),
  (
    11936,
    'Pink Gin',
    'Ordinary Drink',
    'White wine glass',
    'qyr51e1504888618.jpg',
    'Pour the bitters into a wine glass. Swirl the glass to coat the inside with the bitters, shake out the excess. Pour the gin into the glass. Do not add ice.',
    '{"Bitters": "3 dashes", "Gin": "2 oz"}'
  ),
  (
    17190,
    'Paradise',
    'Ordinary Drink',
    'Cocktail glass',
    'ejozd71504351060.jpg',
    'Shake together over ice. Strain into cocktail glass and serve chilled.',
    '{"Gin": "7 parts", "Apricot Brandy": "4 parts", "Orange Juice": "3 parts"}'
  ),
  (
    11938,
    'Pink Lady',
    'Ordinary Drink',
    'Cocktail glass',
    '5ia6j21504887829.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Gin": "1 1/2 oz", "Grenadine": "1 tsp", "Light Cream": "1 tsp", "Egg White": "1"}'
  ),
  (
    17249,
    'Pegu Club',
    'Cocktail',
    'Cocktail glass',
    'jfkemm1513703902.jpg',
    'Shake, strain, up, cocktail glass',
    '{"Gin": "1 1/2 oz", "Orange Curacao": "3/4 oz", "Lime Juice": "3/4 oz", "Angostura Bitters": "1 dash", "Orange Bitters": "1 dash"}'
  ),
  (
    178354,
    'Pink Moon',
    'Cocktail',
    'Whiskey Glass',
    'lnjoc81619696191.jpg',
    'Slowly shake in a shaker with ice, strain into a square whiskey glass. Top with fresh ice. Add the blackberries to garnish. Add flowers and a green leaf for a special look!',
    '{"Gin": "1 shot", "Coconut Liqueur": "1 shot", "Elderflower Cordial": "25 ml", "Lime Juice": "30 ml", "Blackberries": "Garnish with"}'
  ),
  (
    13214,
    'Pisco Sour',
    'Cocktail',
    'Cocktail glass',
    'tsssur1439907622.jpg',
    'Vigorously shake and strain contents in a cocktail shaker with ice cubes, then pour into glass and garnish with bitters.',
    '{"Pisco": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1-2 tblsp", "Ice": "1", "Egg White": "to Taste"}'
  ),
  (
    17192,
    'Porto flip',
    'Ordinary Drink',
    'Cocktail glass',
    '64x5j41504351518.jpg',
    'Shake ingredients together in a mixer with ice. Strain into glass, garnish and serve.',
    '{"Brandy": "3 parts", "Port": "9 parts", "Egg Yolk": "2 parts"}'
  ),
  (
    17829,
    'Penicillin',
    'Cocktail',
    'Old-fashioned glass',
    'hc9b1a1521853096.jpg',
    'Shake blended Scotch, lemon juice, honey syrup and ginger syrup with ice. Strain over large ice in chilled rocks glass. Float smoky Scotch on top (be sure to use a smoky Scotch such as an Islay single malt). Garnish with candied ginger.',
    '{"Blended Scotch": "2 oz", "Lemon Juice": "3/4 oz", "Honey Syrup": "2 tsp", "Ginger Syrup": "2 tsp", "Islay Single Malt Scotch": "1/4 oz"}'
  ),
  (
    17207,
    'Pina Colada',
    'Ordinary Drink',
    'Collins glass',
    'cpf4j51504371346.jpg',
    'Mix with crushed ice in blender until smooth. Pour into chilled glass, garnish and serve.',
    '{"Light Rum": "3 oz", "Coconut Milk": "3 tblsp", "Pineapple": "3 tblsp"}'
  ),
  (
    16992,
    'Pink Penocha',
    'Punch / Party Drink',
    'Punch bowl',
    '6vigjx1503564007.jpg',
    'mix all ingredients into bowl keep iced stir frequently',
    '{"Everclear": "750 ml", "Vodka": "1750 ml", "Peach Schnapps": "1750 ml", "Orange Juice": "1 gal", "Cranberry Juice": "1 gal"}'
  ),
  (
    178338,
    'Pure Passion',
    'Cocktail',
    'Whiskey sour glass',
    '4tymma1604179273.jpg',
    'Mix up all ingredients with a cocktail stirrer and serve with crushed ice with mint and edible flour if available.',
    '{"Rum": "40 ml", "Passoa": "20 ml", "Lime Juice": "30 ml", "Passion Fruit Syrup": "15 ml", "Peach Bitters": "Dash", "Mint": "Garnish with"}'
  ),
  (
    13072,
    'Popped cherry',
    'Ordinary Drink',
    'Highball glass',
    'sxvrwv1473344825.jpg',
    'Served over ice in a tall glass with a popped cherry (can add more popped cherries if in the mood)!',
    '{"Vodka": "2 oz", "Cherry Liqueur": "2 oz", "Cranberry Juice": "4 oz", "Orange Juice": "4 oz"}'
  ),
  (
    11959,
    'Poppy Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'cslw1w1504389915.jpg',
    'Shake ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Gin": "1 1/2 oz", "Creme De Cacao": "3/4 oz white"}'
  ),
  (
    11965,
    'Port Wine Flip',
    'Ordinary Drink',
    'Whiskey sour glass',
    'vrprxu1441553844.jpg',
    'Shake all ingredients (except nutmeg) with ice and strain into a whiskey sour glass. Sprinkle nutmeg on top and serve.',
    '{"Port": "1 1/2 oz", "Light Cream": "2 tsp", "Powdered Sugar": "1 tsp", "Egg": "1 whole", "Nutmeg": "to Taste"}'
  ),
  (
    17191,
    'Planter''s Punch',
    'Punch / Party Drink',
    'Collins glass',
    'fdk8a31606854815.jpg',
    'Pour all ingredients, except the bitters, into shaker filled with ice. Shake well. Pour into large glass, filled with ice. Add Angostura bitters,  on top . Garnish with cocktail cherry and pineapple.',
    '{"Dark Rum": "1 part", "Orgeat Syrup": "1/2 part", "Orange Juice": "2 parts", "Pineapple Juice": "1 part"}'
  ),
  (
    178327,
    'Pineapple Paloma',
    'Cocktail',
    'Collins glass',
    'pg8iw31593351601.jpg',
    'Rub the rim of each glass with lime slice and dip into salt. Add ice, tequila, grapefruit juice, lime juice and top with pineapple soda. Give it a quick stir. Garnish with fresh pineapple or lime.',
    '{"Tequila": "4 oz", "Grapefruit Juice": "4 oz", "Fresh Lime Juice": "1 oz", "Pineapple Juice": "8 oz", "Lime": "Garnish with", "Pepper": "Rimmed"}'
  ),
  (
    178357,
    'Pornstar Martini',
    'Cocktail',
    'Cocktail glass',
    'xjhjdf1630406071.jpg',
    'Straight: Pour all ingredients into mixing glass with ice cubes. Shake well. Strain in chilled martini cocktail glass. Cut passion fruit in half and use as garnish. Pour prosecco into a chilled shot glass and serve alongside the martini.',
    '{"Vodka": "3 cl", "Passoa": "3 cl", "Passion Fruit Juice": "1 cl", "Lime": "1 cl", "Prosecco": "1 shot"}'
  ),
  (
    178368,
    'Planter’s Punch',
    'Cocktail',
    'Highball glass',
    'jn6o251643844541.jpg',
    'Squeeze an orange and strain the juice. Put all the ingredients in a shaker filled with ice and shake for at least 12 seconds. Strain into a highball glass and decorate with a pineapple wedge or fruit of your choice.',
    '{"Dark Rum": "4.5 cL", "Orange Juice": "3 cl", "Pineapple Juice": "3.5 cl", "Grenadine": "1 cl", "Sugar Syrup": "1 cl", "Angostura Bitters": "4 drops"}'
  ),
  (
    11961,
    'Port And Starboard',
    'Ordinary Drink',
    'Pousse cafe glass',
    'wxvupx1441553911.jpg',
    'Pour carefully into a pousse-cafe glass, so that creme de menthe floats on grenadine. Serve without mixing.',
    '{"Grenadine": "1 tblsp", "Green Creme De Menthe": "1/2 oz"}'
  ),
  (
    11963,
    'Port Wine Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'qruprq1441553976.jpg',
    'Stir ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Port": "2 1/2 oz", "Brandy": "1/2 tsp"}'
  ),
  (
    15092,
    'Pysch Vitamin Light',
    'Ordinary Drink',
    'Collins Glass',
    'xsqsxw1441553580.jpg',
    'Shake with ice.',
    '{"Orange Juice": "1 part", "Apple Juice": "1 part", "Pineapple Juice": "1 part", "Ice": "to Taste"}'
  ),
  (
    13535,
    'Pink Panty Pulldowns',
    'Ordinary Drink',
    'Collins Glass',
    'squsuy1468926657.jpg',
    'Shake well',
    '{"Sprite": "1 L", "Pink Lemonade": "2 cups", "Vodka": "2 cups"}'
  ),
  (
    178323,
    'Passion Fruit Martini',
    'Cocktail',
    'Cocktail glass',
    '6trfve1582473527.jpg',
    'Pour all ingredients into a glass and stir. Garnish with half a passion fruit piece.',
    '{"Vodka": "1 shot", "Sugar Syrup": "1/2 shot", "Passion Fruit Juice": "Full Glass"}'
  ),
  (
    12718,
    'Pineapple Gingerale Smoothie',
    'Other/Unknown',
    'Highball Glass',
    'eg9i1d1487603469.jpg',
    'Throw everything into a blender and liquify.',
    '{"Ginger": "1/4 inch", "Pineapple": "1/2"}'
  ),
  (
    11993,
    'Quentin',
    'Ordinary Drink',
    'Cocktail glass',
    'spxtqp1478963398.jpg',
    'In a shaker half-filled with ice cubes, combine the rum, Kahlua, and cream. Shake well. Strain into a cocktail glass and garnish with the nutmeg.',
    '{"Dark Rum": "1 1/2 oz", "Kahlua": "1/2 oz", "Light Cream": "1 oz", "Nutmeg": "1/8 tsp grated"}'
  ),
  (
    11987,
    'Queen Bee',
    'Ordinary Drink',
    'Cocktail glass',
    'rvvpxu1478963194.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Coffee Brandy": "1 oz", "Lime Vodka": "1 1/2 oz", "Sherry": "1/2 oz cream"}'
  ),
  (
    13198,
    'Quick F**K',
    'Shot',
    'Shot glass',
    'wvtwpp1478963454.jpg',
    'In a shot glass add 1/3 Kahlua first. Then 1/3 Miduri, topping it off with a 1/3 bailey''s irish cream',
    '{"Kahlua": "1 part", "Midori Melon Liqueur": "1 part", "Baileys Irish Cream": "1 part"}'
  ),
  (
    15761,
    'Quick-sand',
    'Ordinary Drink',
    'Highball glass',
    'vprxqv1478963533.jpg',
    'Simply add the orange juice, quite a quick pour in order to mix the sambucca with the orange juice. The juice MUST have fruit pulp!',
    '{"Black Sambuca": "25 ml", "Orange Juice": "Add 250 ml"}'
  ),
  (
    11989,
    'Queen Charlotte',
    'Ordinary Drink',
    'Collins glass',
    'vqruyt1478963249.jpg',
    'Pour red wine and grenadine into a collins glass over ice cubes. Fill with lemon-lime soda, stir, and serve.',
    '{"Red Wine": "2 oz", "Grenadine": "1 oz", "Lemon-lime Soda": "to Taste"}'
  ),
  (
    11991,
    'Queen Elizabeth',
    'Ordinary Drink',
    'Cocktail glass',
    'vpqspv1478963339.jpg',
    'Stir all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Dry Vermouth": "1/2 oz", "Gin": "1 1/2 oz", "Benedictine": "1 1/2 tsp"}'
  ),
  (
    11983,
    'Quaker''s Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'yrqppx1478962314.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "3/4 oz", "Brandy": "3/4 oz", "Lemon": "Juice of 1/4", "Raspberry Syrup": "2 tsp"}'
  ),
  (
    11985,
    'Quarter Deck Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'qrwvps1478963017.jpg',
    'Stir all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "1 1/2", "Sherry": "1/3 oz cream", "Lime": "Juice of 1/2"}'
  ),
  (
    17208,
    'Rose',
    'Ordinary Drink',
    'Cocktail glass',
    '8kxbvq1504371462.jpg',
    'Shake together in a cocktail shaker, then strain into chilled glass. Garnish and serve.',
    '{"Dry Vermouth": "1/2 oz", "Gin": "1 oz", "Apricot Brandy": "1/2 oz", "Lemon Juice": "1/2 tsp", "Grenadine": "1 tsp", "Powdered Sugar": "to Taste"}'
  ),
  (
    16031,
    'Radler',
    'Ordinary Drink',
    'Highball glass',
    'xz8igv1504888995.jpg',
    'Pour beer into large mug, slowly add the 7-up (or Sprite).',
    '{"Beer": "12 oz", "7-up": "12 oz"}'
  ),
  (
    12093,
    'Rum Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'bylfi21504886323.jpg',
    'In a shaker half-filled with ice cubes, combine the rum, lemon juice, and sugar. Shake well. Strain into a sour glass and garnish with the orange slice and the cherry.',
    '{"Light Rum": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1/2 tsp superfine", "Orange": "1", "Maraschino Cherry": "1"}'
  ),
  (
    12097,
    'Rum Toddy',
    'Ordinary Drink',
    'Old-fashioned glass',
    'athdk71504886286.jpg',
    'Dissolve powdered sugar in water in an old-fashioned glass. Add rum and one ice cube and stir. Add the twist of lemon peel and serve.',
    '{"Rum": "2 oz light or dark", "Powdered Sugar": "2 tsp", "Lemon Peel": "1 twist of", "Water": "2 tsp"}'
  ),
  (
    14978,
    'Rum Punch',
    'Punch / Party Drink',
    'Punch bowl',
    'wyrsxu1441554538.jpg',
    'Mix all ingredients in a punch bowl and serve.',
    '{"Rum": "mikey bottle", "Ginger Ale": "large bottle", "Fruit Punch": "355 ml frozen", "Orange Juice": "355 ml frozen", "Ice": "crushed"}'
  ),
  (
    12055,
    'Royal Fizz',
    'Ordinary Drink',
    'Collins glass',
    'wrh44j1504390609.jpg',
    'Shake all ingredients (except cola) with ice and strain into a chilled collins glass. Fill with cola and serve.',
    '{"Gin": "1 oz", "Sweet And Sour": "2 oz", "Egg": "1 whole", "Coca-cola": "to Taste"}'
  ),
  (
    12071,
    'Rum Cooler',
    'Ordinary Drink',
    'Collins glass',
    '2hgwsb1504888674.jpg',
    'Pour the rum and soda into a collins glass almost filled with ice cubes. Stir well and garnish with the lemon wedge.',
    '{"Rum": "2 oz light or dark", "Lemon-lime Soda": "4 oz", "Lemon": "1"}'
  ),
  (
    12101,
    'Rusty Nail',
    'Ordinary Drink',
    'Old-fashioned glass',
    'yqsvtw1478252982.jpg',
    'Pour the Scotch and Drambuie into an old-fashioned glass almost filled with ice cubes. Stir well. Garnish with the lemon twist.',
    '{"Scotch": "1 1/2 oz", "Drambuie": "1/2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    16250,
    'Rum Runner',
    'Punch / Party Drink',
    'Cocktail glass',
    'vqws6t1504888857.jpg',
    'Mix all ingredients in glass & add ice.',
    '{"Malibu Rum": "1 1/2 oz", "Blackberry Brandy": "1 oz", "Orange Juice": "3-4 oz", "Pineapple Juice": "3-4 oz", "Cranberry Juice": "3-4 oz"}'
  ),
  (
    12067,
    'Rum Cobbler',
    'Ordinary Drink',
    'Old-fashioned glass',
    '5vh9ld1504390683.jpg',
    'In an old-fashioned glass, dissolve the sugar in the club soda. Add crushed ice until the glass is almost full. Add the rum. Stir well. Garnish with the cherry and the orange and lemon slices.',
    '{"Sugar": "1 tsp superfine", "Club Soda": "3 oz", "Lemon": "1", "Dark Rum": "2 oz", "Maraschino Cherry": "1", "Orange": "1"}'
  ),
  (
    14087,
    'Red Snapper',
    'Shot',
    'Old-fashioned glass',
    '7p607y1504735343.jpg',
    'One shot each, shake n shoot',
    '{"Crown Royal": "1 shot", "Amaretto": "1 shot", "Cranberry Juice": "1 shot"}'
  ),
  (
    15082,
    'Royal Flush',
    'Shot',
    'Old-fashioned glass',
    '7rnm8u1504888527.jpg',
    'Pour all the ingredients into tumbler over ice. Strain into glass.',
    '{"Crown Royal": "1 1/2 oz", "Peach Schnapps": "1 oz", "Chambord Raspberry Liqueur": "1/2 oz", "Cranberry Juice": "1 oz"}'
  ),
  (
    17122,
    'Royal Bitch',
    'Shot',
    'Shot glass',
    'qupuyr1441210090.jpg',
    'Into a shot glass layer the Crown Royal on top of the Frangelico.',
    '{"Frangelico": "1 part", "Crown Royal": "1 part"}'
  ),
  (
    17114,
    'Ruby Tuesday',
    'Cocktail',
    'Highball glass',
    'qsyqqq1441553437.jpg',
    'Pour gin and cranberry into a highball filled with ice cubes. Add grenadine and stir.',
    '{"Gin": "2 oz", "Cranberry Juice": "5 oz", "Grenadine": "2 splashes"}'
  ),
  (
    12630,
    'Rail Splitter',
    'Cocktail',
    'Highball glass',
    'stsuqq1441207660.jpg',
    'Mix sugar syrup with lemon juice in a tall glass. Fill up with ginger ale.',
    '{"Sugar Syrup": "2 tsp", "Lemon Juice": "to Taste", "Ginger Ale": "to Taste"}'
  ),
  (
    17245,
    'Rosemary Blue',
    'Cocktail',
    'Balloon Glass',
    'qwc5f91512406543.jpg',
    '1) Add the Bombay Sapphire, Blue Curacao, rosemary sprig and gently squeezed lemon wedge to a balloon glass. Swirl well to combine. 2) Fill with cubed ice and top with the Fever-Tree Light Tonic Water. 3) Gently fold with a bar spoon to mix.',
    '{"Gin": "50 ml", "Blue Curacao": "15 ml", "Tonic Water": "100 ml", "Rosemary": "Garnish with"}'
  ),
  (
    12057,
    'Royal Gin Fizz',
    'Ordinary Drink',
    'Highball glass',
    'pe1x1c1504735672.jpg',
    'Shake all ingredients (except carbonated water) with ice and strain into a highball glass over two ice cubes. Fill with carbonated water, stir, and serve.',
    '{"Gin": "2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Egg": "1 whole", "Carbonated Water": "to Taste"}'
  ),
  (
    12087,
    'Rum Milk Punch',
    'Ordinary Drink',
    'Collins glass',
    'w64lqm1504888810.jpg',
    'Shake all ingredients (except nutmeg) with ice and strain into a collins glass. Sprinkle nutmeg on top and serve.',
    '{"Light Rum": "2 oz", "Milk": "1 cup", "Powdered Sugar": "1 tsp", "Nutmeg": "to Taste"}'
  ),
  (
    178367,
    'Ramos Gin Fizz',
    'Cocktail',
    'Highball glass',
    '967t911643844053.jpg',
    'Prepare all the ingredients on the counter to be able to work well and quickly, especially the cream and egg white. Pour all the ingredients into a shaker. Shake vigorously for 1 minute: cream and egg white must be mixed perfectly, so don''t rush. Now open the shaker and put some ice and shake for 1-2 minutes. It depends on how long you can resist! Pour into a highball glass, add a splash of soda and garnish to taste. Ramos Gin Fizz was once drunk as an invigorating drink or even as a breakfast, try it as an aperitif and after dinner and you will discover a little gem now lost.',
    '{"Gin": "4.5 cL", "Lemon Juice": "3 cl", "Sugar Syrup": "3 cl", "Cream": "6 cl", "Egg White": "1", "Vanilla Extract": "2 drop", "Soda Water": "2 cl"}'
  ),
  (
    178333,
    'Raspberry Julep',
    'Cocktail',
    'Cordial glass',
    'hyztmx1598719265.jpg',
    'Softly muddle the mint leaves and raspberry syrup in the bottom of the cup. Add crushed ice and Bourbon to the cup and then stir. Top with more ice, garnish with a mint sprig.',
    '{"Bourbon": "2 oz", "Raspberry Syrup": "1/2 oz", "Mint": "8"}'
  ),
  (
    12091,
    'Rum Screwdriver',
    'Ordinary Drink',
    'Highball glass',
    '4c85zq1511782093.jpg',
    'Pour rum into a highball glass over ice cubes. Add orange juice, stir, and serve.',
    '{"Light Rum": "1 1/2 oz", "Orange Juice": "5 oz"}'
  ),
  (
    17167,
    'Raspberry Cooler',
    'Other/Unknown',
    'Highball glass',
    'suqyyx1441254346.jpg',
    'Pour the raspberry vodka and soda into a highball glass almost filled with ice cubes. Stir well.',
    '{"Raspberry Vodka": "2 oz", "Lemon-lime Soda": "4 oz", "Ice": "to Taste"}'
  ),
  (
    12089,
    'Rum Old-fashioned',
    'Ordinary Drink',
    'Old-fashioned glass',
    'otn2011504820649.jpg',
    'Stir powdered sugar, water, and bitters in an old-fashioned glass. When sugar has dissolved add ice cubes and light rum. Add the twist of lime peel, float 151 proof rum on top, and serve.',
    '{"Light Rum": "1 1/2 oz", "151 Proof Rum": "1 tsp", "Powdered Sugar": "1/2 tsp", "Bitters": "1 dash", "Water": "1 tsp", "Lime Peel": "Twist of"}'
  ),
  (
    17214,
    'Russian Spring Punch',
    'Ordinary Drink',
    'Highball glass',
    'ctt20s1504373488.jpg',
    'Pour the ingredients into an highball glass, top with Sparkling wine.',
    '{"Vodka": "2.5 cl", "Creme De Cassis": "1.5 cl", "Sugar Syrup": "1 cl", "Lemon Juice": "2.5 cl"}'
  ),
  (
    16984,
    'Radioactive Long Island Iced Tea',
    'Ordinary Drink',
    'Collins Glass',
    'rdvqmh1503563512.jpg',
    'Pour all ingredients over ice in a very tall glass. Sip cautiously.',
    '{"Rum": "1 oz", "Vodka": "1 oz", "Tequila": "1 oz", "Gin": "1 oz", "Triple Sec": "1 oz", "Chambord Raspberry Liqueur": "1 oz", "Midori Melon Liqueur": "1 oz", "Malibu Rum": "1 oz"}'
  ),
  (
    17141,
    'Smut',
    'Punch / Party Drink',
    'Beer mug',
    'rx8k8e1504365812.jpg',
    'Throw it all together and serve real cold.',
    '{"Red Wine": "1/3 part", "Peach Schnapps": "1 shot", "Pepsi Cola": "1/3 part", "Orange Juice": "1/3 part"}'
  ),
  (
    17215,
    'Spritz',
    'Ordinary Drink',
    'Old-Fashioned glass',
    'j9evx11504373665.jpg',
    'Build into glass over ice, garnish and serve.',
    '{"Prosecco": "6 cl", "Campari": "4 cl", "Soda Water": "splash"}'
  ),
  (
    12127,
    'Sazerac',
    'Ordinary Drink',
    'Old-fashioned glass',
    'vvpxwy1439907208.jpg',
    'Rinse a chilled old-fashioned glass with the absinthe, add crushed ice, and set it aside. Stir the remaining ingredients over ice and set it aside. Discard the ice and any excess absinthe from the prepared glass, and strain the drink into the glass. Add the lemon peel for garnish.',
    '{"Ricard": "1 tsp", "Sugar": "1/2 tsp superfine", "Peychaud Bitters": "2 dashes", "Water": "1 tsp", "Bourbon": "2 oz", "Lemon Peel": "1 twist of"}'
  ),
  (
    12130,
    'Scooter',
    'Ordinary Drink',
    'Cocktail glass',
    'twuptu1483388307.jpg',
    'Shake all ingredients well with cracked ice, strain into a cocktail glass, and serve.',
    '{"Brandy": "1 oz", "Amaretto": "1 oz", "Light Cream": "1 oz"}'
  ),
  (
    12196,
    'Sidecar',
    'Ordinary Drink',
    'Cocktail glass',
    'x72sik1606854964.jpg',
    'Pour all ingredients into cocktail shaker filled with ice. Shake well and strain into cocktail glass.',
    '{"Cognac": "2 oz", "Cointreau": "1/2 oz", "Lemon Juice": "1 oz"}'
  ),
  (
    13020,
    'Sangria',
    'Punch / Party Drink',
    'Pitcher',
    'xrvxpp1441249280.jpg',
    'Mix all together in a pitcher and refrigerate. Add cloves and cinnamon sticks to taste. Serve in wine glasses.',
    '{"Red Wine": "1 bottle", "Sugar": "1/2 cup", "Orange Juice": "1 cup", "Lemon Juice": "1 cup", "Cloves": "to Taste", "Cinnamon": "to Taste"}'
  ),
  (
    17193,
    'Stinger',
    'Ordinary Drink',
    'Cocktail glass',
    '2ahv791504352433.jpg',
    'Pour in a mixing glass with ice, stir and strain into a cocktail glass. May also be served on rocks in a rocks glass.',
    '{"Brandy": "1 1/2 oz", "White Creme De Menthe": "1/2 oz"}'
  ),
  (
    178349,
    'Snowday',
    'Cocktail',
    'Collins glass',
    '4n1ipk1614009624.jpg',
    'Stir all ingredients with ice. Strain into a chilled rocks glass over fresh ice. Express orange peel over drink and garnish.',
    '{"Vodka": "1 oz", "Amaro Montenegro": "1 oz", "Ruby Port": "1 oz", "Blood Orange": "1 tsp", "Angostura Bitters": "Dash", "Orange Peel": "Garnish with"}'
  ),
  (
    14195,
    'Snowball',
    'Ordinary Drink',
    'Highball glass',
    '7ibfs61504735416.jpg',
    'Place one ice cube in the glass and add 1 1/2 oz of Advocaat. Fill up the glass with lemonade and decorate with a slice of lemon. Serve at once.',
    '{"Advocaat": "1 1/2 oz", "Lemonade": "8-10 oz cold", "Lemon": "1 slice", "Ice": "cubes"}'
  ),
  (
    16985,
    'Shot-gun',
    'Shot',
    'Shot glass',
    '2j1m881503563583.jpg',
    'Pour one part Jack Daneils and one part Jim Beam into shot glass then float Wild Turkey on top.',
    '{"Jim Beam": "1 part", "Jack Daniels": "1 part", "Wild Turkey": "1 oz"}'
  ),
  (
    178322,
    'Spice 75',
    'Cocktail',
    'Wine Glass',
    '0108c41576797064.jpg',
    'Gently warm 60g golden caster sugar in a pan with 30ml water and 1 tbsp allspice. Cook gently until the sugar has dissolved, then leave the mixture to cool. Strain through a sieve lined with a coffee filter (or a double layer of kitchen paper). Pour 60ml of the spiced syrup into a cocktail shaker along with 200ml rum and 90ml lime juice. Shake with ice and strain between six flute glasses. Top up with 600ml champagne and garnish each with an orange twist.',
    '{"Sugar": "60 ml", "Allspice": "1 tblsp", "Rum": "20 cl", "Lime Juice": "90 ml", "Champagne": "6 cl", "Orange Spiral": "Garnish with"}'
  ),
  (
    12107,
    'Salty Dog',
    'Ordinary Drink',
    'Highball glass',
    '4vfge01504890216.jpg',
    'Pour all ingredients over ice cubes in a highball glass. Stir well and serve. (Vodka may be substituted for gin, if preferred.)',
    '{"Grapefruit Juice": "5 oz", "Gin": "1 1/2 oz", "Salt": "1/4 tsp"}'
  ),
  (
    12308,
    'Stone Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'vruvtp1472719895.jpg',
    'Shake all ingredients with ice, strain into a chilled whiskey sour glass, and serve.',
    '{"Apricot Brandy": "1 oz", "Orange Juice": "1 oz", "Sweet And Sour": "1 oz"}'
  ),
  (
    13377,
    'Sea breeze',
    'Ordinary Drink',
    'Highball glass',
    '7rfuks1504371562.jpg',
    'Build all ingredients in a highball glass filled with ice. Garnish with lime wedge.',
    '{"Vodka": "1 1/2 oz", "Cranberry Juice": "4 oz", "Grapefruit Juice": "1 oz"}'
  ),
  (
    12158,
    'Scotch Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    '0dnb6k1504890436.jpg',
    'Shake scotch, juice of lime, and powdered sugar with ice and strain into a whiskey sour glass. Decorate with 1/2 slice lemon, top with the cherry, and serve.',
    '{"Scotch": "1 1/2 oz", "Lime": "Juice of 1/2", "Powdered Sugar": "1/2 tsp", "Lemon": "1/2 slice", "Cherry": "1"}'
  ),
  (
    12162,
    'Screwdriver',
    'Ordinary Drink',
    'Highball glass',
    '8xnyke1504352207.jpg',
    'Mix in a highball glass with ice. Garnish and serve.',
    '{"Vodka": "2 oz", "Orange Juice": "to Taste"}'
  ),
  (
    12190,
    'Sherry Flip',
    'Ordinary Drink',
    'Nick and Nora Glass',
    'qrryvq1478820428.jpg',
    'Shake all ingredients (except nutmeg) with ice and strain into a whiskey sour glass. Sprinkle nutmeg on top and serve.',
    '{"Sherry": "1 1/2 oz cream", "Light Cream": "2 tsp", "Powdered Sugar": "1 tsp", "Egg": "1 whole", "Nutmeg": "to Taste"}'
  ),
  (
    16990,
    'Sweet Tooth',
    'Shake',
    'Highball Glass',
    'j6rq6h1503563821.jpg',
    'Put 2 shots Godiva Liquour into a glass, add as much or as little milk as you would like.',
    '{"Godiva Liqueur": "2 shots", "Milk": "to Taste"}'
  ),
  (
    12256,
    'Sol Y Sombra',
    'Ordinary Drink',
    'Brandy snifter',
    '3gz2vw1503425983.jpg',
    'Shake ingredients with ice, strain into a brandy snifter, and serve. (The English translation of the name of this drink is  Sun and Shade , and after sampling this drink, you''ll understand why. Thanks, Kirby.)',
    '{"Brandy": "1 1/2 oz", "Anisette": "1 1/2 oz"}'
  ),
  (
    16273,
    'Shark Attack',
    'Cocktail',
    'Pitcher',
    'uv96zr1504793256.jpg',
    'Mix lemonade and water according to instructions on back of can. If the instructions say to add 4 1/3 cans of water do so. Mix into pitcher. Add 1 1/2 cup of Vodka (Absolut). Mix well. Pour into glass of crushed ice. Excellent!',
    '{"Lemonade": "1 can", "Water": "3 cans", "Vodka": "1 1/2 cup"}'
  ),
  (
    12188,
    'Sherry Eggnog',
    'Ordinary Drink',
    'Collins glass',
    'xwrpsv1478820541.jpg',
    'Shake sherry, powdered sugar, and egg with ice and strain into a collins glass. Fill with milk and stir. Sprinkle nutmeg on top and serve.',
    '{"Sherry": "2 oz cream", "Powdered Sugar": "1 tsp", "Egg": "1 whole", "Milk": "to Taste", "Nutmeg": "to Taste"}'
  ),
  (
    12724,
    'Sweet Bananas',
    'Shake',
    'Highball Glass',
    'sxpcj71487603345.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Milk": "2 cups", "Banana": "1", "Honey": "1 tblsp"}'
  ),
  (
    13024,
    'Sweet Sangria',
    'Punch / Party Drink',
    'Pitcher',
    'uqqvsp1468924228.jpg',
    'Dissolve the sugar in hot water and cool. Peel the citrus fruits and break into wedges. Mix the wine, sugar syrup, fruit, and Fresca in a pitcher and put in the fridge for a few hours. Serve in tall glasses with a straw.',
    '{"Red Wine": "2 bottles", "Sugar": "1 cup", "Water": "2 cups hot", "Apple": "1 cup", "Orange": " wedges", "Lime": " wedges", "Lemon": "to Taste", "Fresca": "to Taste"}'
  ),
  (
    15184,
    'San Francisco',
    'Ordinary Drink',
    'Highball glass',
    'szmj2d1504889961.jpg',
    'Take a tall glass and put in a few ice cubes, fill the vodka over it and fill with juice then the  creme , to end fill in the grenadine but very carefully at the side of the glass so it will lay down in the bottom. garnish with orange and strawberry.',
    '{"Vodka": "2 cl", "Creme De Banane": "2 cl", "Grenadine": "to Taste", "Orange Juice": "to Taste"}'
  ),
  (
    15226,
    'Space Odyssey',
    'Ordinary Drink',
    'Highball glass',
    'vxtjbx1504817842.jpg',
    'Fill glass with ice and add shots of Bacardi and Malibu. Add splash of pineapple juice and top with orange juice. Add grenadine for color and garnish with cherries.',
    '{"151 Proof Rum": "1 shot Bacardi", "Malibu Rum": "1 shot", "Pineapple Juice": "1 shot", "Orange Juice": "to Taste", "Grenadine": "to Taste", "Cherries": "to Taste"}'
  ),
  (
    12138,
    'Scotch Cobbler',
    'Ordinary Drink',
    'Old-fashioned glass',
    '1q7coh1504736227.jpg',
    'Pour scotch, brandy, and curacao over ice in an old-fashioned glass. Add the orange slice, top with the mint sprig, and serve.',
    '{"Scotch": "2 oz", "Brandy": "4 dashes", "Curacao": "4 dashes", "Orange": "1 slice", "Mint": "1"}'
  ),
  (
    12780,
    'Spiking coffee',
    'Coffee / Tea',
    'Coffee mug',
    'isql6y1487602375.jpg',
    'Incidentally, a pinch of cinnamon is indeed a nice addition to coffee but true heaven is a cardamom seed. Of course, you serve it in a coffee mug.',
    '{"Coffee": "to Taste", "Cinnamon": "to Taste"}'
  ),
  (
    15521,
    'Swedish Coffee',
    'Coffee / Tea',
    'Coffee Mug',
    'ywtrvt1441246783.jpg',
    'Pour the coffee in an ordinary coffee cup. Add the aquavit. Add sugar by taste. Stir and have a nice evening (morning)',
    '{"Coffee": "1 cup", "Aquavit": "4 cl", "Sugar": "By taste"}'
  ),
  (
    12214,
    'Singapore Sling',
    'Ordinary Drink',
    'Hurricane glass',
    '7dozeg1582578095.jpg',
    'Pour all ingredients into cocktail shaker filled with ice cubes. Shake well. Strain into highball glass. Garnish with pineapple and cocktail cherry.',
    '{"Cherry Brandy": "1/2 oz", "Grenadine": "1/2 oz", "Gin": "1 oz", "Sweet And Sour": "2 oz", "Carbonated Water": "to Taste", "Cherry": "to Taste"}'
  ),
  (
    13389,
    'Snake Bite (UK)',
    'Beer',
    'Pint glass',
    'xuwpyu1441248734.jpg',
    'Pour ingredients into a pint glass. Drink. Fall over.',
    '{"Lager": "1/2 pint", "Cider": "1/2 pint sweet or dry"}'
  ),
  (
    178306,
    'Slippery Nipple',
    'Shot',
    'Shot glass',
    'l9tgru1551439725.jpg',
    'Pour the Sambuca into a shot glass, then pour the Irish Cream on top so that the two liquids do not mix.',
    '{"Sambuca": "1 part", "Irish Cream": "1 part"}'
  ),
  (
    12198,
    'Sidecar Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'ewjxui1504820428.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Brandy": "1 oz", "Triple Sec": "1/2 oz", "Lemon": "Juice of 1/4"}'
  ),
  (
    12754,
    'Sex on the Beach',
    'Ordinary Drink',
    'Highball glass',
    'lijtw51551455287.jpg',
    'Build all ingredients in a highball glass filled with ice. Garnish with orange slice.',
    '{"Vodka": "1 oz", "Peach Schnapps": "3/4 oz", "Cranberry Juice": "to Taste", "Grapefruit Juice": "to Taste"}'
  ),
  (
    13625,
    'Screaming Orgasm',
    'Ordinary Drink',
    'Cocktail glass',
    'x894cs1504388670.jpg',
    'Pour first vodka, then Bailey''s, then Kahlua into a cocktail glass over crushed ice. Stir. Caution: use only high quality vodka. Cheap vodka can cause the Bailey''s to curdle. Test your brand of vodka by mixing 1 Tsp each of vodka and Bailey''s first.',
    '{"Vodka": "1 oz", "Baileys Irish Cream": "1 1/2 oz", "Kahlua": "1/2 oz"}'
  ),
  (
    178308,
    'Spritz Veneziano',
    'Cocktail',
    'Wine Glass',
    '51ezka1551456113.jpg',
    'Build into glass over ice, garnish and serve.',
    '{"Prosecco": "6 cl", "Aperol": "4 cl", "Soda Water": "Top"}'
  ),
  (
    12186,
    'Shanghai Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'ttyrxr1478820678.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Light Rum": "1 oz Jamaican", "Anisette": "1 tsp", "Grenadine": "1/2 tsp", "Lemon": "Juice of 1/4"}'
  ),
  (
    12224,
    'Sloe Gin Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'd7mo481504889531.jpg',
    'Stir all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Sloe Gin": "2 oz", "Dry Vermouth": "1/4 tsp", "Orange Bitters": "1 dash"}'
  ),
  (
    12750,
    'Spanish chocolate',
    'Cocoa',
    'Coffee mug',
    'pra8vt1487603054.jpg',
    'Stir the milk with the chocolate and the cinnamon over low heat until the chocolate dissolves. Add the eggs and beat the mixture until it becomes thick, taking care not to boil. Serve in coffee mug.',
    '{"Milk": "2 cups", "Chocolate": "2 oz sweet", "Cinnamon": "1/2 tsp", "Egg Yolk": "2 beaten"}'
  ),
  (
    13026,
    'Sangria The  Best',
    'Punch / Party Drink',
    'Pitcher',
    'vysywu1468924264.jpg',
    'Mix wine, sugar and fruit, and let sit in the fridge for 18-24 hours. The mixture will have a somewhat syrupy consistency. Before serving stir in brandy and cut the mixture with soda water until it have a thinner, more wine like consistency. Serve from a pitcher in wine glasses.',
    '{"Red Wine": "1 1/2 L", "Sugar": "1 cup", "Lemon": "1 large", "Orange": "1 large", "Apple": "1 large", "Brandy": "3-4 oz plain", "Soda Water": "to Taste"}'
  ),
  (
    12722,
    'Strawberry Shivers',
    'Other/Unknown',
    'Highball glass',
    '9h1vvt1487603404.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Strawberries": "1 1/2 cup", "Honey": "4 tsp", "Water": "1/2 cup"}'
  ),
  (
    13032,
    'Spiced Peach Punch',
    'Punch / Party Drink',
    'Collins Glass',
    'qxvypq1468924331.jpg',
    'Combine peach nectar, orange juice and brown sugar in a large saucepan. Tie cinnamon and cloves in a small cheesecloth bag. Drop into saucepan. Heat slowly, stirring constantly, until sugar dissolves. Simmer 10 minutes. Stir in lime juice. Serve in hot mugs.',
    '{"Peach Nectar": "46 oz", "Orange Juice": "20 oz", "Brown Sugar": "1/2 cup", "Cinnamon": "3 3-inch", "Cloves": "1/2 tsp", "Lime Juice": "2 tblsp"}'
  ),
  (
    12316,
    'Strawberry Daiquiri',
    'Ordinary Drink',
    'Cocktail glass',
    'deu59m1504736135.jpg',
    'Pour all ingredients into shaker with ice cubes. Shake well. Strain in chilled cocktail glass.',
    '{"Strawberry Schnapps": "1/2 oz", "Light Rum": "1 oz", "Lime Juice": "1 oz", "Powdered Sugar": "1 tsp", "Strawberries": "1 oz"}'
  ),
  (
    12760,
    'Surf City Lifesaver',
    'Ordinary Drink',
    'Highball glass',
    '2rzfer1487602699.jpg',
    'Lots of ice and soda top up in tall glass with cherry and a grin.',
    '{"Ouzo": "1 part", "Baileys Irish Cream": "1 part", "Gin": "2 parts", "Grand Marnier": "1/2 part"}'
  ),
  (
    13036,
    'Strawberry Lemonade',
    'Punch / Party Drink',
    'Collins Glass',
    'spvvxp1468924425.jpg',
    'Throw everything into a blender and mix until fairly smooth. Serve over ice.',
    '{"Lemon": "Juice of 1", "Sugar": "1 tblsp", "Strawberries": "8-10 ripe", "Water": "1 cup"}'
  ),
  (
    13042,
    'Sunny Holiday Punch',
    'Punch / Party Drink',
    'Punch bowl',
    'rywtwy1468924758.jpg',
    'Combine all ingredients in a punch bowl.',
    '{"Pineapple Juice": "46 oz chilled", "Club Soda": "28 oz", "Orange Juice": "6 oz frozen", "Lemon": "1", "Berries": "2 cups", "Champagne": "1 bottle"}'
  ),
  (
    15789,
    'Snakebite and Black',
    'Beer',
    'Pint glass',
    'rssvwv1441248863.jpg',
    'Put blackcurrant squash in first up to about 1cm in glass. Then add the larger and cider one after another.',
    '{"Lager": "1/2 pint", "Cider": "1/2 pint", "Blackcurrant Squash": "A little bit of"}'
  ),
  (
    12322,
    'Strawberry Margarita',
    'Ordinary Drink',
    'Cocktail glass',
    'tqyrpw1439905311.jpg',
    'Rub rim of cocktail glass with lemon juice and dip rim in salt. Shake schnapps, tequila, triple sec, lemon juice, and strawberries with ice, strain into the salt-rimmed glass, and serve.',
    '{"Strawberry Schnapps": "1/2 oz", "Tequila": "1 oz", "Triple Sec": "1/2 oz", "Lemon Juice": "1 oz", "Strawberries": "1 oz", "Salt": "to Taste"}'
  ),
  (
    17233,
    'Salted Toffee Martini',
    'Cocktail',
    'Cocktail glass',
    '3s6mlr1509551211.jpg',
    'Add ice, toffee gin, chocolate liqueur and Amaretto to a cocktail shaker and shake vigorously. Pour the chocolate syrup into a saucer and dip the top of a martini glass into the sauce. Grate some of the Willie''s sea salt chocolate into another saucer and dip the coated glass, so the flakes stick to the sauce, creating a chocolate rim! Pour the contents of the shaker into your chocolatey glass and sprinkle with more grated chocolate - enjoy!',
    '{"Gin": "50 ml", "Chocolate Liqueur": "30 ml", "Amaretto": "15 ml", "Chocolate Sauce": "Garnish", "Salted Chocolate": "Grated"}'
  ),
  (
    12854,
    'Scottish Highland Liqueur',
    'Homemade Liqueur',
    'Collins Glass',
    'upqvvp1441253441.jpg',
    'Combine all ingreds in aging container. Cover tightly and shake gently several times during the first 24 hrs. After 24 hrs, remove the lemon zest. Cover again and let stand in a cool, dark place for 2 weeks, shaking gently every other day. Strain through a wire sieve to remove the angelica root and fennel. Return to aging container, cover and let stand undisturbed in a cool dark place for 6 months. Siphon or pour clear liqueur into a sterile bottle. The cloudy dregs may be saved for cooking.',
    '{"Johnnie Walker": "1 fifth", "Honey": "1 1/2 cup mild", "Angelica Root": "2 tsp dried and chopped", "Fennel Seeds": "1/4 tsp crushed", "Lemon Peel": "2 2 inch strips"}'
  ),
  (
    178332,
    'Smashed Watermelon Margarita',
    'Cocktail',
    'Collins glass',
    'dztcv51598717861.jpg',
    'In a mason jar muddle the watermelon and 5 mint leaves together into a puree and strain. Next add the grapefruit juice, juice of half a lime and the tequila as well as some ice. Put a lid on the jar and shake. Pour into a glass and add more ice. Garnish with fresh mint and a small slice of watermelon.',
    '{"Watermelon": "Garnish with", "Mint": "Garnish with", "Grapefruit Juice": "1/3 Cup", "Lime": "Juice of 1/2", "Tequila": "1 shot"}'
  ),
  (
    12388,
    'Thriller',
    'Ordinary Drink',
    'Cocktail glass',
    'rvuswq1461867714.jpg',
    'In a shaker half-filled with ice cubes, combine all of the ingredients. Shake well. Strain into a cocktail glass.',
    '{"Scotch": "1 1/2 oz", "Wine": "1 oz Green Ginger", "Orange Juice": "1 oz"}'
  ),
  (
    12856,
    'Tia-Maria',
    'Homemade Liqueur',
    'Collins Glass',
    'sih81u1504367097.jpg',
    'Boil water, sugar and coffe for 10 mins and let cool. Add rum and vanilla. Put in clean bottle(s) and leave for 1 week before using.',
    '{"Water": "1 cup", "Brown Sugar": "3/4-1 cup", "Coffee": "4 tsp", "Rum": "1 cup", "Vanilla Extract": "4 tsp"}'
  ),
  (
    17828,
    'Tipperary',
    'Cocktail',
    'Nick and Nora Glass',
    'b522ek1521761610.jpg',
    'Stir over ice. Strain into chilled glass. Cut a wide swath of orange peel, and express the orange oils over the drink. Discard orange twist.',
    '{"Irish Whiskey": "2 oz", "Sweet Vermouth": "1 oz", "Green Chartreuse": "1/2 oz"}'
  ),
  (
    178350,
    'The Galah',
    'Cocktail',
    'Collins glass',
    'sy7y6r1614775067.jpg',
    'Mix together the alcoholic portions and top with Pineapple and Lime juice.',
    '{"Dark Rum": "1 shot", "Campari": "1 shot", "Creme De Banane": "1/2 shot", "Pineapple Juice": "Top", "Lime Juice": "Top"}'
  ),
  (
    15006,
    'Turkeyball',
    'Shot',
    'Shot glass',
    'rxurpr1441554292.jpg',
    'Shake with ice and strain into a shot glass.',
    '{"Wild Turkey": "1 oz", "Amaretto": "3/4 oz", "Pineapple Juice": "1 splash"}'
  ),
  (
    12402,
    'Tom Collins',
    'Ordinary Drink',
    'Collins glass',
    '7cll921606854636.jpg',
    'In a shaker half-filled with ice cubes, combine the gin, lemon juice, and sugar. Shake well. Strain into a collins glass alomst filled with ice cubes. Add the club soda. Stir and garnish with the cherry and the orange slice.',
    '{"Gin": "2 oz", "Lemon Juice": "1 oz", "Sugar": "1 tsp superfine", "Club Soda": "3 oz", "Maraschino Cherry": "1", "Orange": "1"}'
  ),
  (
    12726,
    'Tomato Tang',
    'Other/Unknown',
    'Highball glass',
    '869qr81487603278.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up.',
    '{"Tomato Juice": "2 cups", "Lemon Juice": "1-2 tblsp", "Celery Salt": "1 dash"}'
  ),
  (
    12782,
    'Thai Coffee',
    'Coffee / Tea',
    'Highball glass',
    'wquwxs1441247025.jpg',
    'Place the coffee and spices in the filter cone of your coffee maker. Brew coffee as usual, let it cool. In a tall glass, dissolve 1 or 2 teaspoons of sugar in an ounce of the coffee (it''s easier to dissolve than if you put it right over ice). Add 5-6 ice cubes and pour coffee to within about 1 inch of the top of the glass. Rest a spoon on top of the coffee and slowly pour whipping cream into the spoon. This will make the cream float on top of the coffee rather than dispersing into it right away.',
    '{"Coffee": "6 tblsp ground", "Coriander": "1/4 tsp", "Cardamom": "4-5 whole green", "Sugar": "to Taste", "Whipping Cream": "to Taste", "Ice": "to Taste"}'
  ),
  (
    15639,
    'Texas Sling',
    'Shake',
    'Wine Glass',
    'ypl13s1504890158.jpg',
    'Blend with Ice until smooth. Serve in a tulip glass, top with whip cream.',
    '{"Kahlua": "1/2 oz", "Irish Cream": "1/2 oz", "Amaretto": "1/2 oz", "151 Proof Rum": "1/2 oz Bacardi", "Cream": "1 oz"}'
  ),
  (
    12362,
    'Tequila Fizz',
    'Ordinary Drink',
    'Collins glass',
    '2bcase1504889637.jpg',
    'Shake all ingredients (except ginger ale) with ice and strain into a collins glass over ice cubes. Fill with ginger ale, stir, and serve.',
    '{"Tequila": "2 oz", "Lemon Juice": "1 tblsp", "Grenadine": "3/4 oz", "Egg White": "1", "Ginger Ale": "to Taste"}'
  ),
  (
    12370,
    'Tequila Sour',
    'Ordinary Drink',
    'Whiskey sour glass',
    'ek0mlq1504820601.jpg',
    'Shake tequila, juice of lemon, and powdered sugar with ice and strain into a whiskey sour glass. Add the half-slice of lemon, top with the cherry, and serve.',
    '{"Tequila": "2 oz", "Lemon": "1/2 slice", "Powdered Sugar": "1 tsp", "Cherry": "1"}'
  ),
  (
    14860,
    'Talos Coffee',
    'Coffee / Tea',
    'Brandy snifter',
    'rswqpy1441246518.jpg',
    'Add your GM and then add your coffee.',
    '{"Grand Marnier": "3 parts", "Coffee": "1 part"}'
  ),
  (
    15515,
    'Tennesee Mud',
    'Coffee / Tea',
    'Coffee Mug',
    'txruqv1441245770.jpg',
    'Mix Coffee, Jack Daniels and Amaretto. Add Cream on top.',
    '{"Coffee": "8 oz", "Jack Daniels": "4 oz", "Amaretto": "4 oz", "Whipped Cream": "to Taste"}'
  ),
  (
    12418,
    'Turf Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    'utypqq1441554367.jpg',
    'Stir all ingredients (except orange peel) with ice and strain into a cocktail glass. Add the twist of orange peel and serve.',
    '{"Dry Vermouth": "1 oz", "Gin": "1 oz", "Anis": "1/4 tsp", "Bitters": "2 dashes", "Orange Peel": "Twist of"}'
  ),
  (
    12786,
    'Thai Iced Tea',
    'Coffee / Tea',
    'Highball glass',
    'trvwpu1441245568.jpg',
    'Combine Thai tea (i.e., the powder), boiling water, and sweetened condensed milk, stir until blended. Pour into 2 tall glasses filled with ice cubes. Garnish with mint leaves. Makes 2 servings.',
    '{"Tea": "1/4 cup Thai", "Water": "1/2 cup boiling", "Condensed Milk": "2 tsp sweetened", "Ice": "cubes", "Mint": "garnish"}'
  ),
  (
    17247,
    'The Last Word',
    'Cocktail',
    'Cocktail glass',
    '91oule1513702624.jpg',
    'Shake with ice and strain into a cocktail glass.',
    '{"Green Chartreuse": "1 oz", "Maraschino Liqueur": "1 oz", "Lime Juice": "1 oz"}'
  ),
  (
    17824,
    'The Laverstoke',
    'Cocktail',
    'Balloon Glass',
    '6xfj5t1517748412.jpg',
    '1) Squeeze two lime wedges into a balloon glass then add the cordial, Bombay Sapphire and MARTINI Rosso Vermouth, swirl to mix. 2) Fully fill the glass with cubed ice and stir to chill. 3) Top with Fever-Tree Ginger Ale and gently stir again to combine. 4) Garnish with a snapped ginger slice and an awoken mint sprig.',
    '{"Gin": "50 ml", "Elderflower Cordial": "15 ml", "Rosso Vermouth": "15 ml", "Tonic Water": "75 ml", "Lime": "2 Wedges", "Ginger": "1 Slice", "Mint": "1 Large Sprig"}'
  ),
  (
    12420,
    'Tuxedo Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    '4u0nbl1504352551.jpg',
    'Stir all ingredients with ice and strain into a cocktail glass. Garnish with a cherry and a twist of lemon zest.',
    '{"Dry Vermouth": "1 1/2 oz", "Gin": "1 1/2 oz", "Maraschino Liqueur": "1/4 tsp", "Anis": "1/4 tsp", "Orange Bitters": "2 dashes", "Cherry": "1"}'
  ),
  (
    13621,
    'Tequila Sunrise',
    'Cocktail',
    'Highball glass',
    'quqyqp1480879103.jpg',
    'Pour the tequila and orange juice into glass over ice. Add the grenadine, which will sink to the bottom. Stir gently to create the sunrise effect. Garnish and serve.',
    '{"Tequila": "2 measures", "Orange Juice": "to Taste", "Grenadine": "to Taste"}'
  ),
  (
    178307,
    'Tequila Slammer',
    'Shot',
    'Hurricane glass',
    '43uhr51551451311.jpg',
    'Mix carefully to avoid releasing the dissolved CO2.',
    '{"Tequila": "1 shot", "7-up": "1 part"}'
  ),
  (
    178330,
    'The Philosopher',
    'Cocktail',
    'Margarita glass',
    'sp8hkp1596017787.jpg',
    'Add all the spirits in a shaker (best to use Hendricks gin) as well as the orange bitters and lemon juice. Strain into a Margarita glass, top with Prosecco.',
    '{"Gin": "1 shot", "Melon Liqueur": "1 shot", "Orange Bitters": "1 dash", "Lemon Juice": "1 dash", "Prosecco": "Top"}'
  ),
  (
    12784,
    'Thai Iced Coffee',
    'Coffee / Tea',
    'Highball glass',
    'rqpypv1441245650.jpg',
    'Prepare a pot of coffee at a good European strength. In the ground coffee, add 2 or 3 freshly ground cardamom pods. Sweeten while hot, then cool quickly. Serve in highball glass over ice, with cream. To get the layered effect, place a spoon atop the coffee and pour the milk carefully into the spoon so that it floats on the top of the coffee.',
    '{"Coffee": "black", "Sugar": "to Taste", "Cream": " pods", "Cardamom": "to Taste"}'
  ),
  (
    14602,
    'Tequila Surprise',
    'Shot',
    'Shot glass',
    '8189p51504735581.jpg',
    'Fill shot glass with Tequila. Add drops of Tobasco sauce.',
    '{"Tequila": "full glass", "Tabasco Sauce": "About 8 drops"}'
  ),
  (
    17826,
    'The Jimmy Conway',
    'Cocktail',
    'Whiskey sour glass',
    'wbcvyo1535794478.jpg',
    'Fill glass with ice Pour in The Irishman and Disaronno Fill to the top with Cranberry Juice Garnish with a slice of lemon…Enjoy!',
    '{"Irish Whiskey": "50 ml", "Amaretto": "50 ml", "Cranberry Juice": "4 oz"}'
  ),
  (
    15178,
    'Texas Rattlesnake',
    'Shot',
    'Highball glass',
    'rtohqp1504889750.jpg',
    'Mix all ingredients and Shake well. Sweet at first, with a BITE at the end...',
    '{"Yukon Jack": "1 part", "Cherry Brandy": "1/2 part", "Southern Comfort": "1 part", "Sweet And Sour": "1 splash"}'
  ),
  (
    17216,
    'Tommy''s Margarita',
    'Ordinary Drink',
    'Old-Fashioned glass',
    'loezxn1504373874.jpg',
    'Shake and strain into a chilled cocktail glass.',
    '{"Tequila": "4.5 cl", "Lime Juice": "1.5 cl", "Agave Syrup": "2 spoons"}'
  ),
  (
    178339,
    'The Strange Weaver',
    'Cocktail',
    'Collins glass',
    'opxjzh1604179528.jpg',
    'Mix ingredients slowly in a glass with ice, garnish with orange slice',
    '{"Light Rum": "1 oz", "Gin": "1 oz", "Sweet Vermouth": "0.75 oz", "Campari": "0.75 oz", "Lemon Juice": "Dash", "Orgeat Syrup": "Dash", "Orange Peel": "Garnish with"}'
  ),
  (
    16271,
    'The Evil Blue Thing',
    'Cocktail',
    'Old-fashioned glass',
    'ojnpz71504793059.jpg',
    'Pour ingredients into glass, and drop in a blue whale! The blue whale isn''t really necessary, but it makes the drink more  fun .',
    '{"Creme De Cacao": "1 1/2 oz", "Blue Curacao": "1 oz", "Light Rum": "1/2 oz"}'
  ),
  (
    12450,
    'Victor',
    'Ordinary Drink',
    'Cocktail glass',
    'voapgc1492976416.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Gin": "1 1/2 oz", "Sweet Vermouth": "1/2 oz", "Brandy": "1/2 oz"}'
  ),
  (
    17218,
    'Vesper',
    'Cocktail',
    'Cocktail glass',
    'mtdxpa1504374514.jpg',
    'Shake over ice until well chilled, then strain into a deep goblet and garnish with a thin slice of lemon peel.',
    '{"Gin": "6 cl", "Vodka": "1.5 cl", "Lillet Blanc": "0.75 cl"}'
  ),
  (
    12444,
    'Vesuvio',
    'Ordinary Drink',
    'Old-fashioned glass',
    '26cq601492976203.jpg',
    'Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.',
    '{"Light Rum": "1 oz", "Sweet Vermouth": "1/2 oz", "Lemon": "Juice of 1/2", "Powdered Sugar": "1 tsp", "Egg White": "1"}'
  ),
  (
    12446,
    'Veteran',
    'Ordinary Drink',
    'Old-fashioned glass',
    'iwml9t1492976255.jpg',
    'Pour the rum and cherry brandy into an old-fashioned glass almost filled with ice cubes. Stir well.',
    '{"Dark Rum": "2 oz", "Cherry Brandy": "1/2 oz"}'
  ),
  (
    17217,
    'Vampiro',
    'Ordinary Drink',
    'Old-Fashioned glass',
    'yfhn371504374246.jpg',
    'Vampiros may be made in a tall glass or an old fashioned glass. Bartenders may first  rim  the glass with Kosher Salt, which is done by placing a layer of Kosher Salt on a chopping board, moistening the glass'' rim with lime juice or water, and then placing the upside down glass rim onto the Kosher Salt, so that the salt sticks to the moistened rim. The second step is to fill half the glass with ice and add one or two shooter glasses full of high quality Tequila. The next stage is to add the flavouring elements. This is done by squeezing a fresh lime into the glass, adding a few grains of salt, adding citrus-flavoured soda pop, until the glass is 4/5 full, and then adding spicy Viuda de Sanchez (or orange juice, lime juice and pico de gallo). The final step is to stir the ingredients so that the flavours are properly blended.',
    '{"Tequila": "6 cl", "Tomato Juice": "3 cl", "Orange Juice": "3 cl", "Lime Juice": "1.5 cl", "Sugar Syrup": "1 dash", "Salt": "1 pinch"}'
  ),
  (
    12436,
    'Van Vleet',
    'Ordinary Drink',
    'Old-fashioned glass',
    'fgq2bl1492975771.jpg',
    'Shake all ingredients with ice, strain into an old-fashioned glass over ice cubes, and serve.',
    '{"Light Rum": "3 oz", "Maple Syrup": "1 oz", "Lemon Juice": "1 oz"}'
  ),
  (
    16967,
    'Vodka Fizz',
    'Other/Unknown',
    'White wine glass',
    'xwxyux1441254243.jpg',
    'Blend all ingredients, save nutmeg. Pour into large white wine glass and sprinkle nutmeg on top.',
    '{"Vodka": "2 oz", "Half-and-half": "2 oz", "Limeade": "2 oz", "Ice": "to Taste", "Nutmeg": "to Taste"}'
  ),
  (
    178362,
    'Vodka Slime',
    'Cocktail',
    'Highball glass',
    'apex461643588115.jpg',
    'Fill glass with ice. Add vodka, 7-up then finish with the lime juice.',
    '{"Sprite": "1 cup", "Lime Juice": "1/2 shot", "Vodka": "1 1/2 shot"}'
  ),
  (
    178363,
    'Vodka Lemon',
    'Cocktail',
    'Highball glass',
    'mql55h1643820632.jpg',
    'The vodka lemon is prepared directly in a highball glass or in a large tumbler: put 6-7 ice cubes in the glass, pour the vodka, lemonade and mix with a bar spoon. Finally decorate with a slice of lemon and, if you prefer, add a few mint leaves. Your vodka lemon is ready to be served.',
    '{"Vodka": "5 cl", "Lemon Juice": "7 cl", "Lemon Peel": "1 Slice", "Ice": "cubes"}'
  ),
  (
    178364,
    'Vodka Tonic',
    'Cocktail',
    'Highball glass',
    '9koz3f1643821062.jpg',
    'Wash and cut 1 wedge and 1 slice of lime or lemon. Fill a tumbler with fresh ice. Pour the desired dose of vodka and top up with the tonic. Squeeze the lime wedge into the glass and decorate with the slice. That''s all, very simple: it''s just the recipe for happiness!',
    '{"Vodka": "4 cl", "Tonic Water": "10 cl", "Lemon Peel": "1 Slice"}'
  ),
  (
    14167,
    'Vodka Martini',
    'Ordinary Drink',
    'Cocktail glass',
    'qyxrqw1439906528.jpg',
    'Shake the vodka and vermouth together with a number of ice cubes, strain into a cocktail glass, add the olive and serve.',
    '{"Vodka": "1 1/2 oz", "Dry Vermouth": "3/4 oz", "Olive": "1"}'
  ),
  (
    15403,
    'Vodka Russian',
    'Ordinary Drink',
    'Collins Glass',
    'rpttur1454515129.jpg',
    'Mix it as a ordinary drink .',
    '{"Vodka": "2 oz", "Schweppes Russchian": "to Taste"}'
  ),
  (
    12442,
    'Vermouth Cassis',
    'Ordinary Drink',
    'Highball glass',
    'tswpxx1441554674.jpg',
    'Stir vermouth and creme de cassis in a highball glass with ice cubes. Fill with carbonated water, stir again, and serve.',
    '{"Dry Vermouth": "1 1/2 oz", "Creme De Cassis": "3/4 oz", "Carbonated Water": "to Taste"}'
  ),
  (
    12452,
    'Victory Collins',
    'Ordinary Drink',
    'Collins glass',
    'lx0lvs1492976619.jpg',
    'Shake all ingredients (except orange slice) with ice and strain into a collins glass over ice cubes. Add the slice of orange and serve.',
    '{"Vodka": "1 1/2 oz", "Lemon Juice": "3 oz", "Grape Juice": "3 oz unsweetened", "Powdered Sugar": "1 tsp", "Orange": "1 slice"}'
  ),
  (
    12460,
    'Vodka And Tonic',
    'Ordinary Drink',
    'Highball glass',
    'lmj2yt1504820500.jpg',
    'Pour vodka into a highball glass over ice cubes. Fill with tonic water, stir, and serve.',
    '{"Vodka": "2 oz", "Tonic Water": "to Taste"}'
  ),
  (
    12434,
    'Valencia Cocktail',
    'Ordinary Drink',
    'Cocktail glass',
    '9myuc11492975640.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Apricot Brandy": "1 1/2 oz", "Orange Juice": "1 tblsp", "Orange Bitters": "2 dashes"}'
  ),
  (
    12518,
    'Whisky Mac',
    'Ordinary Drink',
    'Collins Glass',
    'yvvwys1461867858.jpg',
    'Pour both of the ingredients into a wine goblet with no ice.',
    '{"Scotch": "1 1/2 oz", "Wine": "1 oz Green Ginger"}'
  ),
  (
    13058,
    'Wine Punch',
    'Punch / Party Drink',
    'Collins Glass',
    'txustu1473344310.jpg',
    'Combine all of the ingredients and pour over a block of ice.',
    '{"Red Wine": "1 bottle", "Lemon": "2", "Orange Juice": "1 cup", "Orange": "3", "Pineapple Juice": "1 cup"}'
  ),
  (
    17194,
    'White Lady',
    'Ordinary Drink',
    'Cocktail glass',
    'jofsaz1504352991.jpg',
    'Add all ingredients into cocktail shaker filled with ice. Shake well and strain into large cocktail glass.',
    '{"Gin": "4cl", "Triple Sec": "3cl", "Lemon Juice": "2cl"}'
  ),
  (
    13056,
    'Wine Cooler',
    'Punch / Party Drink',
    'Collins Glass',
    'yutxtv1473344210.jpg',
    'Mix wine and soft drink. Pour into glass. Add ice.',
    '{"Red Wine": "2 oz white or", "Lemon-lime Soda": "5 oz", "Ice": "cubes"}'
  ),
  (
    178347,
    'Winter Rita',
    'Beer',
    'Highball Glass',
    'fwpd0v1614006733.jpg',
    'Salt rim. Combine all ingredients, shake with ice, and strain over fresh ice.⠀',
    '{"Tequila": "1 2/3 oz", "Campari": "1/4 oz", "Lime Juice": "3/4 oz", "Orange Juice": "1/2 oz", "Rosemary Syrup": "1/2 oz", "Salt": "Dash"}'
  ),
  (
    11004,
    'Whiskey Sour',
    'Ordinary Drink',
    'Old-fashioned glass',
    'hbkfsh1589574990.jpg',
    'Shake with ice. Strain into chilled glass, garnish and serve. If served ''On the rocks'', strain ingredients into old-fashioned glass filled with ice.',
    '{"Blended Whiskey": "2 oz", "Lemon": "1/2 slice", "Powdered Sugar": "1/2 tsp", "Cherry": "1"}'
  ),
  (
    12528,
    'White Russian',
    'Ordinary Drink',
    'Old-fashioned glass',
    'vsrupw1472405732.jpg',
    'Pour vodka and coffee liqueur over ice cubes in an old-fashioned glass. Fill with light cream and serve.',
    '{"Vodka": "2 oz", "Coffee Liqueur": "1 oz", "Light Cream": "to Taste"}'
  ),
  (
    178348,
    'Winter Paloma',
    'Cocktail',
    'Highball glass',
    'u5f0pz1614007748.jpg',
    'Everyone’s favourite Paloma gets a delicious Indian makeover. Tequila reposado infused with “Timur Pepper” which has citrusy & grapefruit notes and is grown at the foothills of Himalaya. It also produces a slightly numbing and tingling sensation on your lip when consumed. We have also spiced up the fresh grapefruit juice with the warming spice blend from Himalaya. The combination of all these interesting elements has allowed us to elevate your Paloma sipping experience.',
    '{"Tequila": "2 shots", "Grapefruit Juice": "Top", "Lime Juice": "Juice of 1", "Agave Syrup": "1 tsp", "Pepper": "Dash"}'
  ),
  (
    16158,
    'Whitecap Margarita',
    'Other/Unknown',
    'Margarita/Coupette glass',
    'srpxxp1441209622.jpg',
    'Place all ingredients in a blender and blend until smooth. This makes one drink.',
    '{"Ice": "1 cup", "Tequila": "2 oz", "Cream Of Coconut": "1/4 cup", "Lime Juice": "3 tblsp fresh"}'
  ),
  (
    178326,
    'White Wine Sangria',
    'Punch / Party Drink',
    'Pitcher',
    'hnuod91587851576.jpg',
    'Chop the Lemon, Lime and other fruits into large chunks. Fill the Pitcher with the white wine and mix in the Apple Brandy. Top to taste with soda water.',
    '{"Lime": "1", "Lemon": "1", "White Wine": "750 ml", "Strawberries": "1 cup", "Apple": "1 cup", "Apple Brandy": "3 shots", "Soda Water": "Top"}'
  ),
  (
    12474,
    'Waikiki Beachcomber',
    'Ordinary Drink',
    'Cocktail glass',
    'ysuqus1441208583.jpg',
    'Shake all ingredients with ice, strain into a cocktail glass, and serve.',
    '{"Triple Sec": "3/4 oz", "Gin": "3/4 oz", "Pineapple Juice": "1 tblsp"}'
  ),
  (
    17219,
    'Yellow Bird',
    'Cocktail',
    'Cocktail glass',
    '2t9r6w1504374811.jpg',
    'Shake and strain into a chilled cocktail glass',
    '{"White Rum": "3 cl", "Galliano": "1.5 cl", "Triple Sec": "1.5 cl", "Lime Juice": "1.5 cl"}'
  ),
  (
    12728,
    'Yoghurt Cooler',
    'Other/Unknown',
    'Highball Glass',
    'trttrv1441254466.jpg',
    'Place all ingredients in the blender jar - cover and whiz on medium speed until well blended. Pour in one tall, 2 medium or 3 small glasses and drink up. Note: Use lots of ice in this one - great on hot days! To add ice: Remove the center of the cover while the blender is on - drop 3 or 4 ice cubs and blend until they''re completely crushed.',
    '{"Yoghurt": "1 cup", "Fruit": "1 cup", "Ice": "to Taste"}'
  ),
  (
    15328,
    'Zorro',
    'Coffee / Tea',
    'Coffee Mug',
    'kvvd4z1485621283.jpg',
    'add all and pour black coffee and add whipped cream on top.',
    '{"Sambuca": "2 cl", "Baileys Irish Cream": "2 cl", "White Creme De Menthe": "2 cl"}'
  ),
  (
    14888,
    'Zinger',
    'Soft Drink',
    'Highball glass',
    'iixv4l1485620014.jpg',
    'Get a shot glass and pour in three shots of the schnapps. Do the same with the Surge Cola. Then down it like Scheetz would.',
    '{"Peachtree Schnapps": "4 shots", "Surge": "4 shots"}'
  ),
  (
    15691,
    'Zoksel',
    'Soft Drink',
    'Beer pilsner',
    'ft8ed01485620930.jpg',
    'No specific mixinginstructions, just poor every ingredient in one glass. The lemon goes with it.',
    '{"Beer": "to Taste", "Root Beer": "to Taste", "Lemonade": "to Taste", "Coca-cola": " slice", "7-up": "to Taste", "Creme De Cassis": "to Taste", "Lemon": "to Taste"}'
  ),
  (
    17241,
    'Zombie',
    'Cocktail',
    'Hurricane glass',
    '2en3jk1509557725.jpg',
    'Blend at high speed for no more than 5 seconds. Pour into a glass, add ice cubes to fill, then add the garnish. *Donn’s mix: Bring 3 crushed cinnamon sticks, 1 cup of sugar and 1 cup of water to a boil, stirring until the sugar is dissolved. Simmer for 2 minutes, then remove from the heat and let sit for at least 2 hours before straining into a clean glass bottle. Then add 1 part of the syrup and 2 parts of fresh grapefruit juice together.',
    '{"Rum": "1 1/2 oz", "Gold Rum": "1 1/2 oz", "151 Proof Rum": "1 oz", "Pernod": "1 tsp", "Grenadine": "1 tsp", "Lime Juice": "1 tsp", "Angostura Bitters": "1 drop"}'
  ),
  (
    15933,
    'Zambeer',
    'Soft Drink',
    'Collins Glass',
    'bje5401485619578.jpg',
    'Mix sambuca with rootbeer and stir. Add ice',
    '{"Sambuca": "1 1/2 oz", "Root Beer": "Add 10 oz", "Ice": "cubes"}'
  ),
  (
    16963,
    'Zorbatini',
    'Cocktail',
    'Cocktail glass',
    'wtkqgb1485621155.jpg',
    'Prepare like a Martini. Garnish with a green olive.',
    '{"Vodka": "1 1/4 oz Stoli", "Ouzo": "1/4 oz"}'
  ),
  (
    15254,
    'Zenmeister',
    'Ordinary Drink',
    'Collins Glass',
    'qyuvsu1479209462.jpg',
    'Mix together and enjoy',
    '{"Jägermeister": "1/2 oz", "Root Beer": "1/2 oz"}'
  ),
  (
    16942,
    'Zipperhead',
    'Shot',
    'Whiskey sour glass',
    'r2qzhu1485620235.jpg',
    'Fill glass with rocks, add straw before putting in liquor. Then add the ingredients in order, trying to keep layered as much as possible (i.e. Chambord on bottom, then Vodka, Then soda on top).',
    '{"Chambord Raspberry Liqueur": "1 shot", "Vodka": "1 shot", "Soda Water": "Fill with"}'
  ),
  (
    17027,
    'Zima Blaster',
    'Ordinary Drink',
    'Hurricane glass',
    '1wifuv1485619797.jpg',
    'Fill glass with ice. Pour in Chambord, then fill with Zima. Mix and enjoy.',
    '{"Zima": "12 oz", "Chambord Raspberry Liqueur": "3 oz"}'
  ),
  (
    14594,
    'Zizi Coin-coin',
    'Punch / Party Drink',
    'Margarita/Coupette glass',
    '0fbo2t1485620752.jpg',
    'Pour 5cl of Cointreau on ice, add 2cl of fresh lemon (or lime) juice, stir gently, and finally add slices of lemon/lime in glass.',
    '{"Cointreau": "5 cl", "Lemon Juice": "2 cl", "Ice": "cubes", "Lemon": " or lime"}'
  ),
  (
    14065,
    'Zippy''s Revenge',
    'Cocktail',
    'Old-fashioned glass',
    '1sqm7n1485620312.jpg',
    'Mix Kool-Aid to taste then add Rum and ammaretto. shake well to disolve the sugar in the Kool-Aid... serve cold',
    '{"Amaretto": "2 oz", "Rum": "2 oz", "Kool-aid": "4 oz Grape"}'
  ),
  (
    15801,
    'Zimadori Zinger',
    'Punch / Party Drink',
    'Collins glass',
    'bw8gzx1485619920.jpg',
    'Pour Zima in a collins glass over ice and then pour the shot of Midori. Don''t stir. Garnish with a cherry.',
    '{"Midori Melon Liqueur": "1.5 oz", "Zima": "12 oz"}'
  ),
  (
    14157,
    'Ziemes Martini Apfelsaft',
    'Ordinary Drink',
    'Collins Glass',
    'xnzr2p1485619687.jpg',
    'Serve without ice. At least the juice shold have room temperature.',
    '{"Vermouth": "4 cl", "Apple Juice": "16 cl"}'
  );
