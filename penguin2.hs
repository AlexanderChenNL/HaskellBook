data WherePenguinsLive = Galapagos | Antartica | Australia | SouthAfrica | SouthAmerica deriving (Eq, Show)

data Penguin = Peng WherePenguinsLive deriving (Eq, Show)
isSouthAfrica:: WherePenguinsLive -> Bool
isSouthAfrica SouthAfrica = True
isSouthAfrica _                      =  False
gimmeWhereTheyLive :: Penguin ->  WherePenguinsLive
gimmeWhereTheyLive (Peng whereitlives) = whereitlives

humboldt = Peng SouthAmerica
gentoo = Peng SouthAfrica
macaroni = Peng Antartica
little = Peng Australia
galapagos = Peng Galapagos

galapagosPenguin :: Penguin -> Bool
galapagosPenguin (Peng Galapagos) = True
galapagosPenguin _                                  = False

antarticaPenguin :: Penguin -> Bool
antarticaPenguin (Peng Antartica) = True
antarticaPenguin _                                = False

antarticaOrGalapagos :: Penguin -> Bool
antarticaOrGalapagos p =  (galapagosPenguin p) || (antarticaPenguin p) =