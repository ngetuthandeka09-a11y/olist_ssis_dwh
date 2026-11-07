USE olist_dwh;
GO

IF OBJECT_ID('bronze.olist_customers', 'U') IS NULL
CREATE TABLE bronze.olist_customers (
    customer_id               NVARCHAR(100),
    customer_unique_id        NVARCHAR(100),
    customer_zip_code_prefix  NVARCHAR(20),
    customer_city             NVARCHAR(200),
    customer_state            NVARCHAR(20),
    dwh_load_ts               DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file           NVARCHAR(260),
    dwh_batch_id              INT
);
IF OBJECT_ID('bronze.olist_order_payments', 'U') IS NULL
CREATE TABLE bronze.olist_order_payments (
    order_id                NVARCHAR(100),
    payment_sequential      NVARCHAR(20),
    payment_type            NVARCHAR(50),
    payment_installments    NVARCHAR(20),
    payment_value           NVARCHAR(50),
    dwh_load_ts             DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file         NVARCHAR(260),
    dwh_batch_id            INT
);
GO

IF OBJECT_ID('bronze.olist_products', 'U') IS NULL
CREATE TABLE bronze.olist_products (
    product_id                    NVARCHAR(100),
    product_category_name         NVARCHAR(200),
    product_name_lenght           NVARCHAR(20),
    product_description_lenght    NVARCHAR(20),
    product_photos_qty            NVARCHAR(20),
    product_weight_g              NVARCHAR(20),
    product_length_cm             NVARCHAR(20),
    product_height_cm             NVARCHAR(20),
    product_width_cm              NVARCHAR(20),
    dwh_load_ts                   DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file               NVARCHAR(260),
    dwh_batch_id                  INT
);
GO

IF OBJECT_ID('bronze.olist_geolocation', 'U') IS NULL
CREATE TABLE bronze.olist_geolocation (
    geolocation_zip_code_prefix    NVARCHAR(20),
    geolocation_lat                NVARCHAR(50),
    geolocation_lng                NVARCHAR(50),
    geolocation_city               NVARCHAR(200),
    geolocation_state              NVARCHAR(20),
    dwh_load_ts                    DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file                NVARCHAR(260),
    dwh_batch_id                   INT
);
GO




IF OBJECT_ID('bronze.olist_orders', 'U') IS NULL
CREATE TABLE bronze.olist_orders (
    order_id                         NVARCHAR(100),
    customer_id                      NVARCHAR(100),
    order_status                     NVARCHAR(50),
    order_purchase_timestamp         NVARCHAR(50),
    order_approved_at                NVARCHAR(50),
    order_delivered_carrier_date     NVARCHAR(50),
    order_delivered_customer_date    NVARCHAR(50),
    order_estimated_delivery_date    NVARCHAR(50),
    dwh_load_ts                      DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file                  NVARCHAR(260),
    dwh_batch_id                     INT
);
GO

IF OBJECT_ID('bronze.olist_order_items', 'U') IS NULL
CREATE TABLE bronze.olist_order_items (
    order_id               NVARCHAR(100),
    order_item_id          NVARCHAR(20),
    product_id             NVARCHAR(100),
    seller_id              NVARCHAR(100),
    shipping_limit_date    NVARCHAR(50),
    price                  NVARCHAR(50),
    freight_value          NVARCHAR(50),
    dwh_load_ts            DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file        NVARCHAR(260),
    dwh_batch_id           INT
);
GO

IF OBJECT_ID('bronze.olist_order_reviews', 'U') IS NULL
CREATE TABLE bronze.olist_order_reviews (
    review_id                 NVARCHAR(100),
    order_id                  NVARCHAR(100),
    review_score              NVARCHAR(20),
    review_comment_title      NVARCHAR(MAX),
    review_comment_message    NVARCHAR(MAX),
    review_creation_date      NVARCHAR(50),
    review_answer_timestamp   NVARCHAR(50),
    dwh_load_ts               DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file           NVARCHAR(260),
    dwh_batch_id              INT
);
GO

IF OBJECT_ID('bronze.olist_sellers', 'U') IS NULL
CREATE TABLE bronze.olist_sellers (
    seller_id                NVARCHAR(100),
    seller_zip_code_prefix   NVARCHAR(20),
    seller_city              NVARCHAR(200),
    seller_state             NVARCHAR(20),
    dwh_load_ts              DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file          NVARCHAR(260),
    dwh_batch_id             INT
);
GO

IF OBJECT_ID('bronze.product_category_name_translation', 'U') IS NULL
CREATE TABLE bronze.product_category_name_translation (
    product_category_name            NVARCHAR(200),
    product_category_name_english    NVARCHAR(200),
    dwh_load_ts                      DATETIME2 DEFAULT SYSDATETIME(),
    dwh_source_file                  NVARCHAR(260),
    dwh_batch_id                     INT
);
GO