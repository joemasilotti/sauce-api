s1  = Sauce.create(:name => 'Sriracha Hot Chili Sauce', :manufacturer => 'Huy Fong')
s2  = Sauce.create(:name => 'Original Mexican Hot Sauce', :manufacturer => 'Cholula')
s3  = Sauce.create(:name => 'Louisiana Brand Hot Sauce', :manufacturer => 'Cajun Injector')
s4  = Sauce.create(:name => 'Pure Habanero', :manufacturer => 'Ass Kickin\'')
s5  = Sauce.create(:name => 'Dave\'s Ghost Pepper Naga Jolokia Hot Sauce', :manufacturer => 'Dave\'s Gourmet')
s6  = Sauce.create(:name => 'Satan\'s Blood Hot Sauce', :manufacturer => 'mad dog')
s7  = Sauce.create(:name => 'Cambodian Hot Sauce', :manufacturer => 'Black Market Hot Sauce')
s8  = Sauce.create(:name => 'Bacon Flavored Hot Sauce', :manufacturer => 'Bacon Hot Sauce')
s9  = Sauce.create(:name => 'Ass Blaster Hot Sauce', :manufacturer => 'Candy Crate')
s10 = Sauce.create(:name => 'Ass Kickin\' Original Hot Sauce', :manufacturer => 'Candy Crate')
s11 = Sauce.create(:name => 'Crazy Mother Pucker\'s Habitual Jalapeno Hot Sauce', :manufacturer => 'Candy Crate')

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
