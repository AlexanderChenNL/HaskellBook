data Doggies a = Husky a | Mastiff a deriving (Eq, Show)

data Bordeaux doge = Bordeaux doge




data Price = Price Integer deriving (Eq, Show)

data Size = Size Integer deriving (Eq, Show)

data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYourChancesUnited deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)

myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar :: Vehicle
urCar = Car Mazda (Price 20000)

clownCar :: Vehicle
clownCar = Car Tata (Price 7000)

doge :: Vehicle
doge = Plane PapuAir (Size 822)

isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _         = False

areCars :: [Vehicle] -> [Bool]
areCars = map isCar

getManu :: Vehicle -> Maybe Manufacturer
getManu (Car m _) = Just m
getManu _         = Nothing
 
getSize :: Vehicle -> Maybe Size
getSize (Plane _ m) = Just m
getSize _           = Nothing

data Example = MakeExample deriving Show

data Example2 = MakeExample2 Int deriving Show


class TooMany a where
    tooMany :: a -> Bool

instance TooMany Int where
    tooMany n = n > 42

newtype Goats = Goats Int deriving Show
instance TooMany Goats where
    tooMany (Goats n) = n > 43


data Weekday =
        Monday
    |   Tuesday
    |   Wednesday
    |   Thursday
    |   Friday


--f Friday = "Miller Time"


data Testing

squish :: [[a]] -> [a]
squish = foldr (++) []  
