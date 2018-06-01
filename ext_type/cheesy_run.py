# Test input
from cheesy import CheeseShop

shop = CheeseShop()
print(shop.cheese)

shop.cheese = "camembert"
print(shop.cheese)

shop.cheese = "cheddar"
print(shop.cheese)

del shop.cheese
print(shop.cheese)

# Test output
# We don't have: []
# We don't have: ['camembert']
# We don't have: ['camembert', 'cheddar']
# We don't have: []