-- create a database
CREATE DATABASE DDC_XML;

-- open a connection
USE DDC_XML;

-- create the XML_MALLS table
CREATE TABLE XML_MALLS (
    city_id CHAR(4) NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL,
    mall_dtls XML
);

-- insert into the XML_MALLS table
INSERT INTO XML_MALLS VALUES
	('CC01', 'Cebu City, Cebu', '<?xml version="1.0" encoding="UTF-8"?>
								<mallsInCebuCity>
									<mall name="Ayala Center Cebu">
										<founder type="company">Ayala Land Inc.</founder>
										<company>Ayala Malls</company>
										<yearOpened>1994</yearOpened>
										<location>Cebu Business Park, Cebu City</location>
										<areaSize>9.3 hectares</areaSize>
										<floors>5</floors>
										<parkingSpaces>2000</parkingSpaces>
										<highlightStores>
											<store>H and M</store>
											<store>Rustans</store>
										</highlightStores>
										<popularStores>
											<store>Uniqlo</store>
											<store>The Coffee Bean and Tea Leaf</store>
										</popularStores>
										<openingHours>10:00 AM - 9:00 PM</openingHours>
										<website>https://www.ayalamalls.com</website>
									</mall>
									<mall name="SM City Cebu">
										<founder type="person">Henry Sy Sr.</founder>
										<company>SM Prime Holdings</company>
										<yearOpened>1993</yearOpened>
										<location>North Reclamation Area, Cebu City</location>
										<areaSize>11 hectares</areaSize>
										<floors>4</floors>
										<parkingSpaces>3000</parkingSpaces>
										<highlightStores>
											<store>Zara</store>
											<store>Forever 21</store>
										</highlightStores>
										<popularStores>
											<store>National Bookstore</store>
											<store>Starbucks</store>
										</popularStores>
										<openingHours>10:00 AM - 10:00 PM</openingHours>
										<website>https://www.smsupermalls.com</website>
									</mall>
									<mall name="Robinsons Galleria Cebu">
										<founder type="person">John Gokongwei</founder>
										<company>Robinsons Land Corporation</company>
										<yearOpened>2015</yearOpened>
										<location>General Maxilom Avenue, Cebu City</location>
										<areaSize>4.7 hectares</areaSize>
										<floors>6</floors>
										<parkingSpaces>1500</parkingSpaces>
										<highlightStores>
											<store>Handyman</store>
											<store>Robinsons Supermarket</store>
										</highlightStores>
										<popularStores>
											<store>Toys "R" Us</store>
										</popularStores>
										<openingHours>10:00 AM - 9:00 PM</openingHours>
										<website>https://www.robinsonsmalls.com</website>
									</mall>
									<mall name="Elizabeth Mall (E-Mall)">
										<founder type="person">Elizabeth Gan</founder>
										<company>Emall Properties Inc.</company>
										<yearOpened>1997</yearOpened>
										<location>Leon Kilat Street, Cebu City</location>
										<areaSize>3 hectares</areaSize>
										<floors>3</floors>
										<parkingSpaces>500</parkingSpaces>
										<highlightStores>
											<store>Value City</store>
											<store>Jollibee</store>
										</highlightStores>
										<popularStores>
											<store>Mercury Drug</store>
										</popularStores>
										<openingHours>9:00 AM - 9:00 PM</openingHours>
										<website>https://www.elizabethmall.com</website>
									</mall>
									<mall name="One Pavilion Mall">
										<founder type="company">Gaisano Family</founder>
										<company>Gaisano Capital</company>
										<yearOpened>2012</yearOpened>
										<location>Banawa, Cebu City</location>
										<areaSize>2.2 hectares</areaSize>
										<floors>4</floors>
										<parkingSpaces>800</parkingSpaces>
										<highlightStores>
											<store>Gaisano Supermarket</store>
										</highlightStores>
										<popularStores>
											<store>Watsons</store>
											<store>Chowking</store>
										</popularStores>
										<openingHours>9:00 AM - 8:00 PM</openingHours>
										<website>https://www.gaisanocapital.com</website>
									</mall>
								</mallsInCebuCity>');

-- display the XML_MALLS table
SELECT * FROM XML_MALLS;

-- perform these queries 
SELECT * FROM XML_MALLS
FOR XML AUTO;

SELECT * FROM XML_MALLS
FOR XML RAW;

SELECT *  FROM XML_MALLS
FOR XML PATH;