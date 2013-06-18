m1 = Manufacturer.create(:name => 'Huy Fong')
m2 = Manufacturer.create(:name => 'Cholua')
m3 = Manufacturer.create(:name => 'Cajun Injector')
m4 = Manufacturer.create(:name => 'Ass Kickin\'')
m5 = Manufacturer.create(:name => 'Dave\'s Gourmet')
m6 = Manufacturer.create(:name => 'mad dog')
m7 = Manufacturer.create(:name => 'Black Market Hot Sauce')
m8 = Manufacturer.create(:name => 'Bacon Hot Sauce')
m9 = Manufacturer.create(:name => 'Candy Crate')

s1  = Sauce.create(:name => 'Sriracha Hot Chili Sauce', :manufacturer_id => m1.id)
s2  = Sauce.create(:name => 'Original Mexican Hot Sauce', :manufacturer_id => m2.id)
s3  = Sauce.create(:name => 'Louisiana Brand Hot Sauce', :manufacturer_id => m3.id)
s4  = Sauce.create(:name => 'Pure Habanero', :manufacturer_id => m4.id)
s5  = Sauce.create(:name => 'Dave\'s Ghost Pepper Naga Jolokia Hot Sauce', :manufacturer_id => m5.id)
s6  = Sauce.create(:name => 'Satan\'s Blood Hot Sauce', :manufacturer_id => m6.id)
s7  = Sauce.create(:name => 'Cambodian Hot Sauce', :manufacturer_id => m7.id)
s8  = Sauce.create(:name => 'Bacon Flavored Hot Sauce', :manufacturer_id => m8.id)
s9  = Sauce.create(:name => 'Ass Blaster Hot Sauce', :manufacturer_id => m9.id)
s10 = Sauce.create(:name => 'Ass Kickin\' Original Hot Sauce', :manufacturer_id => m9.id)
s11 = Sauce.create(:name => 'Crazy Mother Pucker\'s Habitual Jalapeno Hot Sauce', :manufacturer_id => m9.id)

f1 = Flavor.create(:name => 'spicy')
f2 = Flavor.create(:name => 'bitter')
f3 = Flavor.create(:name => 'sweet')
f4 = Flavor.create(:name => 'sour')
f5 = Flavor.create(:name => 'smoky')
f6 = Flavor.create(:name => 'tangy')

s1.flavors = [ f1, f3 ]
s2.flavors = [ f6 ]
s3.flavors = [ f6 ]
s4.flavors = [ f1, f4 ]

a1 = Admin.create(:email => 'user@example.com', :password => 'password1')
