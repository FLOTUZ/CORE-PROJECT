create or replace table productswwc
(
    id                    int auto_increment,
    name                  varchar(100)                 null,
    slug                  varchar(50)                  null,
    permalink             varchar(255)                 null,
    date_created          datetime                     null,
    date_created_gmt      datetime                     null,
    date_modified         datetime                     null,
    date_modified_gmt     datetime                     null,
    type                  varchar(50)                  null,
    status                varchar(15)                  null,
    featured              tinyint(1)                   null,
    catalog_visibility    varchar(15)                  null,
    description           varchar(3000)                null,
    short_description     varchar(500)                 null,
    sku                   varchar(50)                  null,
    price                 double                       null,
    regular_price         double                       null,
    sale_price            double                       null,
    date_on_sale_from     datetime                     null,
    date_on_sale_from_gmt datetime                     null,
    date_on_sale_to       datetime                     null,
    date_on_sale_to_gmt   datetime                     null,
    price_html            varchar(100)                 null,
    on_sale               tinyint(1)                   null,
    purchasable           tinyint(1)                   null,
    total_sales           int                          null,
    virtual               tinyint(1)                   null,
    downloadable          tinyint(1)                   null,
    downloads             longtext collate utf8mb4_bin null,
    download_limit        int default -1               null,
    download_expiry       int default -1               null,
    external_url          varchar(100)                 null,
    button_text           varchar(50)                  null,
    tax_status            varchar(50)                  null,
    tax_class             varchar(50)                  null,
    manage_stock          tinyint(1)                   null,
    stock_quantity        double                       null,
    stock_status          varchar(50)                  null,
    backorders            varchar(10)                  null,
    backorders_allowed    tinyint(1)                   null,
    backordered           tinyint(1)                   null,
    sold_individually     tinyint(1)                   null,
    weight                varchar(50)                  null,
    length                varchar(50)                  null,
    width                 varchar(50)                  null,
    height                varchar(50)                  null,
    shipping_required     tinyint(1)                   null,
    shipping_taxable      tinyint(1)                   null,
    shipping_class        varchar(50)                  null,
    shipping_class_id     int                          null,
    reviews_allowed       tinyint(1)                   null,
    average_rating        double                       null,
    rating_count          int                          null,
    related_ids           longtext collate utf8mb4_bin null,
    upsell_ids            longtext collate utf8mb4_bin null,
    cross_sell_ids        longtext collate utf8mb4_bin null,
    parent_id             int                          null,
    purchase_note         varchar(500)                 null,
    categories            longtext collate utf8mb4_bin null,
    tags                  longtext collate utf8mb4_bin null,
    images                longtext collate utf8mb4_bin null,
    attributes            longtext collate utf8mb4_bin null,
    default_attributes    longtext collate utf8mb4_bin null,
    variations            longtext collate utf8mb4_bin null,
    grouped_products      longtext collate utf8mb4_bin null,
    menu_order            int                          null,
    meta_data             longtext collate utf8mb4_bin null,
    _links                longtext collate utf8mb4_bin null,
    constraint productswwc_id_uindex
        unique (id),
    constraint _links
        check (json_valid(`_links`)),
    constraint attributes
        check (json_valid(`attributes`)),
    constraint categories
        check (json_valid(`categories`)),
    constraint cross_sell_ids
        check (json_valid(`cross_sell_ids`)),
    constraint default_attributes
        check (json_valid(`default_attributes`)),
    constraint downloads
        check (json_valid(`downloads`)),
    constraint grouped_products
        check (json_valid(`grouped_products`)),
    constraint images
        check (json_valid(`images`)),
    constraint meta_data
        check (json_valid(`meta_data`)),
    constraint related_ids
        check (json_valid(`related_ids`)),
    constraint tags
        check (json_valid(`tags`)),
    constraint upsell_ids
        check (json_valid(`upsell_ids`)),
    constraint variations
        check (json_valid(`variations`))
);

alter table productswwc
    add primary key (id);

