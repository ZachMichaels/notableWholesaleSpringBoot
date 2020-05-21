create SCHEMA notablewholesale;
use notablewholesale;

DROP TABLE IF EXISTS Users;

CREATE TABLE Users(
userId INT NOT NULL AUTO_INCREMENT,
firstName VARCHAR(255) NOT NULL,
lastName VARCHAR(255) NOT NULL,
street VARCHAR(255) NOT NULL,
city VARCHAR(255) NOT NULL,
state VARCHAR(255) NOT NULL,
zip VARCHAR(255) NOT NULL,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
PRIMARY KEY (userId) 
) ;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
	productId int NOT NULL PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(200) NOT NULL,
	price double NOT NULL,
	imageurl varchar(200) NOT NULL,
	category varchar(50) NOT NULL,
	stock int NOT NULL,
    searchTerms varchar(500) NOT NULL
    );
    
    INSERT INTO Products VALUES 
	('1', 'Meat Sticks', 'Made from our signature award winning blend of Elephant Seal, Monitor Lizard, and Koala!', '5.99','meatSticks.jpg','Groceries','30', 'groceries grocery food meat meatsticks snacks snack'),
	('2','Crackers', 'Beluga Sturgeon Caviar flavored crackers.', '3.89','crackers.jpg','Groceries','30', 'groceries grocery food crackers snacks snack'),
	('3','Free-Range Tofu', '100% grass-fed tofu!','6.99','tofu.jpg','Groceries','30', 'groceries grocery food tofu snacks snack'),
	('4', 'Stylish Romphim', '50% shirt, 50% pant, 100% stylish!','59.99','romphim.jpg','Clothing','30', 'clothes clothing attire romphim'),
	('5', 'Onesie', 'Never take your clothes off again!', '49.99','onesie.jpg','Clothing','30', 'clothes clothing attire onesie'),
	('6', 'Snuggy', 'Thanks to our patented technology, you can now wear your blanket as a hoodie!','29.99','snuggy.jpg','Clothing','30', 'clothes clothing attire snuggy'),
	('7', 'Calculator', 'Fast calculations as well as gaming. The one-in-all rig!','12.99','black-calc.jfif','Electronics','30', 'electronics electronic tech calculator'),
	('8', 'HDMI Cable', 'Cables not just for any console, but with rope functionality as well!', '18.99','hdmi.jfif','Electronics','30','electronics electronic tech hdmi cable cord cords'),
	('9', 'Television', 'Watch everything that you ever wanted to on this TV!', '299.99','television.jpg','Electronics','30', 'electronics electronic tech tv television t.v. flatscreen'),
	('10', 'Nunchucks', 'These professional grade nunchucks will take your martial arts practice to new heights. Try not to hit yourself with them!', '49.99', 'nunchucks.jpg', 'Sporting Goods','30', 'sporting goods sports nunchucks martial arts'),
	('11', 'Authentic Roman Javelin', 'Take your javelin skills to new levels with this Roman javelin, complete with iron head', '575.99','javelin.jpg','Sporting Goods','30', 'sporting goods sports authentic roman javelin spear'),
	('12', 'Rocket-powered Rollerskates', 'Whether you\'re making a getaway or just taking a stroll, these rocket-powered skates will do the job', '299.99','skates.jpg','Sporting Goods', '30', 'sporting goods sports rocket powered rollerskates skates wheels'),
	('13', 'Stapler', 'World\'s best, most durable stapler. Staples like a champ, won\'t let you down.', '9.99','stapler.jpg','Office Supplies', '30', 'office supplies work stapler staples'),
	('14', 'Paper Shredder', 'Complete any shredding job big or small with this state of the art shredder. Ninja-grade stainless steel.', '59.99','Shredder.jfif','Office Supplies','30', 'office supplies work paper shredder'),
	('15', '3D-Printer', 'Our 3D printer will meet all of your needs. Includes 12 templates for common printing jobs. 100 year warranty. Buy now and includes a free box of our free-range tofu.', '2399.99','3DPrint-Color.jpg','Office Supplies','30', 'office supplies work 3d printer print')
    ;
    
DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders(
   OrderID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
   UserID INT NOT NULL,
   Amount DECIMAL(12,2) NOT NULL,
   Status VARCHAR(255) NOT NULL,
   FOREIGN KEY (UserID) REFERENCES Users(UserID)
   );

DROP TABLE IF EXISTS OrderDetails;
CREATE TABLE OrderDetails(
   OrderID   INT NOT NULL,
   ProductID INT NOT NULL,
   Quantity INT NOT NULL,
   FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
   FOREIGN KEY (ProductID) REFERENCES Products(productID)
);
