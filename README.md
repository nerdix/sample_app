Sample App: Export all products to XML-File 
===========================================

Task
----

* Fork this repo.
* Register app with versacommerce: http://app.versacommerce.de/developer (http://app.versacommerce.de/developer/signup)
* Register app with store: http://test-produkte.versacommerce.de
* Create an app which exports all products as an XML-File.
* Get in touch with me.


Toolchain
---------

API Documentation:
https://github.com/versacommerce/vc-api

API Ruby GEM:
https://github.com/versacommerce/versacommerce_api

Generator Rails App: 
https://github.com/versacommerce/versacommerce_app


## Create a new rails app
    $ rails new my_versacommerce_app
    $ cd my_versacommerce_app

## Add the gem versacommerce_app to your Gemfile
    $ echo "gem 'versacommerce_app'" >> Gemfile
    $ bundle install

## Sample XML-file
```xml
<products>
<product>
<aid>123456</aid>
<name>Product title</name>
<desc>
This is the product description without HTML-Tags.
</desc>
<price>10.0</price>
<link>http://demo.versacommerce.de/products/product-handle</link>
<brand>Vendor name</brand>
<ean>6417182976753</ean>
<shop_cat>Product category</shop_cat>
<image>http://images.versacommerce.net/++/assets.versacommerce.de/demo-1_versacommerce_de/product_images/167355/original/image20121218-2-r75eg5.jpg</image>
</product>
... ...
</products>
```


Mapping:
--------

| VersaCommerce | XML Objekt |
| ------------- | ---------- |
| id | aid |
| name | title + subtitle |
| description_html (strip html tags first ) | desc |
| price | price |
| url | link |
| vendor | brand |
| category | shop_cat |
| featured_image_url | image |
