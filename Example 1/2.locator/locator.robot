*** Settings ***
Resource    ..//1.setting/Setting_1.robot



*** Variables ***

#locator test Product Sorting

&{TC03}    
...    clicl dropdow=xpath=//*[@class="product_sort_container"]
...    Selcet=xpath=//option[text()='Price (low to high)']




&{TC04}    
...    Produck02=xpath=//*[text()='Sauce Labs Bike Light']



&{TC05}
...    Add product=xpath=//*[@id="add-to-cart-sauce-labs-backpack"]
...    shopping cart link=xpath=//*[@class="shopping_cart_link"]

&{TC06}
...    Remove product=xpath=//button[text()='Remove']


&{TC07}
...    Click checkout=xpath=//button[text()='Checkout']
