#!/usr/bin/python

import requests,sys
from decimal import *

mkr = requests.get('https://api.coingecko.com/api/v3/coins/markets?vs_currency=eur&per_page=150&price_change_percentage=1h,24h,7d')
market = mkr.json()

for i in range(0, len(market)):
    if(sys.argv[1] == market[i]['id']):
        print(market[i]['name'])

for i in range(0, len(market)):
    arg_name = market[i]['id'] + "_price"
    if(sys.argv[1] == arg_name):
        print(round(market[i]['current_price'],5),"€")

for i in range(0, len(market)):
    arg_name = market[i]['id'] + "_1h"
    if(sys.argv[1] == arg_name):
        print(round(market[i]['price_change_percentage_1h_in_currency'],2),"%")

for i in range(0, len(market)):
    arg_name = market[i]['id'] + "_24h"
    if(sys.argv[1] == arg_name):
        print(round(market[i]['price_change_percentage_24h_in_currency'],2),"%")

for i in range(0, len(market)):
    arg_name = market[i]['id'] + "_7d"
    if(sys.argv[1] == arg_name):
        print(round(market[i]['price_change_percentage_7d_in_currency'],2),"%")
