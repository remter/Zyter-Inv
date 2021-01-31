use inventory_s;
# Create a list of users
CREATE TABLE IF not EXISTS `user`
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  `name`            VARCHAR(50) NOT NULL,                # Name of the user
  unique index  `name_key` (`name`),	#making name unique
  `role`          VARCHAR(20) NOT NULL,                 # role of the user
  created_at           timestamp NOT NULL default now(),              # created time
  updated_at			timestamp not NULL default now() on update now(),				# last updated time
  PRIMARY KEY     (id)                                  # Make the id the primary key
);

# Create a list of Audit records
CREATE TABLE IF not EXISTS `audit`
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, # Unique ID for the record
  inventory_id      INT unsigned NOT NULL,                # what object
  user_id           INT unsigned NOT NULL,                 # id of user
  `event`           varchar(20) NOT NULL,              # What action happened
  timestap			timestamp not NULL default now() on update now(),				# last updated time
  PRIMARY KEY     (id)                                  # Make the id the primary key
);

# Create a table of product types
CREATE TABLE IF not EXISTS `product`
(
  id              INT unsigned NOT NULL AUTO_INCREMENT, 	# Unique ID for the record
  `Product_name`   VARCHAR(50) NOT NULL,      	# Name of the product
  `owner`          INT Unsigned NOT NULL,               	# Person in charge of managing the product info
  created_at           timestamp NOT NULL default now(),	# created time
  updated_at			timestamp not NULL default now() on update now(),				# last updated time
  `description`		VARCHAR(200) default NULL,			# Description of the product
  PRIMARY KEY     (id)                                  # Make the id the primary key
);

# Create a table of the inventory
CREATE TABLE IF not EXISTS `inventory`
(
	id				INT unsigned NOT NULL AUTO_INCREMENT,		# Unique ID for the record
    sn				varchar(150) NOT NULL,						# Serial number of each entry
	unique index  `sn_key` (sn),								# Making sn unique	
    product_id		INT unsigned NOT NULL,						# Product type			
    checked_in		boolean NOT NULL default 1,					# Check if product is checked in or not
    last_user_id	INT unsigned, 								# User who last changed the object
    created_at		timestamp NOT Null default now(),			# created time
    updated_at		timestamp NOT null default now() on update now(),	# Updated time
    primary key (id)
)