CREATE TABLE [User] (
	id integer(10) NOT NULL,
	first_name string(30) NOT NULL,
	last_name string(30) NOT NULL,
	ip string(30) NOT NULL,
	email string(50) NOT NULL,
	password string(100) NOT NULL,
	status string(10) NOT NULL,
	activation_code string(200) NOT NULL,
	forgot_code string(200) NOT NULL,
	forgot_code_sent_time datetime(100) NOT NULL,
  CONSTRAINT [PK_USER] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [user_address] (
	id integer NOT NULL,
	user_id integer NOT NULL,
	complete_address string(300) NOT NULL,
	phone_number string(15) NOT NULL,
  CONSTRAINT [PK_USER_ADDRESS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [products] (
	id integer NOT NULL,
	product_name string(300) NOT NULL,
	product_slug string(350) NOT NULL,
	category_id integer NOT NULL,
	subcategory_id integer NOT NULL,
  CONSTRAINT [PK_PRODUCTS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [categories] (
	id integer NOT NULL,
	category_name string(100) NOT NULL,
	category_icon string(225) NOT NULL,
  CONSTRAINT [PK_CATEGORIES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [subcategories] (
	id integer NOT NULL,
	category_id integer NOT NULL,
	sub_category_name string(100) NOT NULL,
  CONSTRAINT [PK_SUBCATEGORIES] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [variations] (
	id integer NOT NULL,
	variation_name string(50) NOT NULL,
  CONSTRAINT [PK_VARIATIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [variation_opitons] (
	id integer NOT NULL,
	variation_id integer NOT NULL,
  CONSTRAINT [PK_VARIATION_OPITONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [product_variations] (
	id integer NOT NULL,
	product_id integer NOT NULL,
	variation_name string(100) NOT NULL,
  CONSTRAINT [PK_PRODUCT_VARIATIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [product_variations_options] (
	id integer NOT NULL,
	product_variation_id integer NOT NULL,
	variation_name string NOT NULL,
	variation_img string(200) NOT NULL,
	sku string(100) NOT NULL,
	price float(10) NOT NULL,
	product_stock_id integer(10) NOT NULL,
  CONSTRAINT [PK_PRODUCT_VARIATIONS_OPTIONS] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [product_stock] (
	id integer NOT NULL,
	total_stock integer NOT NULL,
	unit_price float NOT NULL,
	total_price float NOT NULL,
  CONSTRAINT [PK_PRODUCT_STOCK] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [user_address] WITH CHECK ADD CONSTRAINT [user_address_fk0] FOREIGN KEY ([user_id]) REFERENCES [User]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [user_address] CHECK CONSTRAINT [user_address_fk0]
GO

ALTER TABLE [products] WITH CHECK ADD CONSTRAINT [products_fk0] FOREIGN KEY ([category_id]) REFERENCES [categories]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [products] CHECK CONSTRAINT [products_fk0]
GO
ALTER TABLE [products] WITH CHECK ADD CONSTRAINT [products_fk1] FOREIGN KEY ([subcategory_id]) REFERENCES [subcategories]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [products] CHECK CONSTRAINT [products_fk1]
GO


ALTER TABLE [subcategories] WITH CHECK ADD CONSTRAINT [subcategories_fk0] FOREIGN KEY ([category_id]) REFERENCES [categories]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [subcategories] CHECK CONSTRAINT [subcategories_fk0]
GO


ALTER TABLE [variation_opitons] WITH CHECK ADD CONSTRAINT [variation_opitons_fk0] FOREIGN KEY ([variation_id]) REFERENCES [variations]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [variation_opitons] CHECK CONSTRAINT [variation_opitons_fk0]
GO

ALTER TABLE [product_variations] WITH CHECK ADD CONSTRAINT [product_variations_fk0] FOREIGN KEY ([product_id]) REFERENCES [products]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [product_variations] CHECK CONSTRAINT [product_variations_fk0]
GO

ALTER TABLE [product_variations_options] WITH CHECK ADD CONSTRAINT [product_variations_options_fk0] FOREIGN KEY ([product_variation_id]) REFERENCES [product_variations]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [product_variations_options] CHECK CONSTRAINT [product_variations_options_fk0]
GO
ALTER TABLE [product_variations_options] WITH CHECK ADD CONSTRAINT [product_variations_options_fk1] FOREIGN KEY ([product_stock_id]) REFERENCES [product_stock]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [product_variations_options] CHECK CONSTRAINT [product_variations_options_fk1]
GO


