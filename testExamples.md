

Given [ Placed(0,0,X),Placed(0,1,X) ]
When  [ Place(0,2,X) ]
Then  [ X Won ]

Given []
When  [ CreateGame(1) ]
Then  [ Game is created with ID(1) ]

Given [ CreateGame(1) ]
When  [ Join(1) ]
Then  [ Player 1 has joined game 1 ]

Given [ CreateGame(1),Join(1) ]
When  [ Join(1) ]
Then  [ Game #1 has started ]

Given [ CreateGame(1) Join(1) ]
When  [ Leave(1) ]
Then  [ Player has left game 1]

Given [ Placed(1,1,O),Placed(1,2,O) ]
When  [ Place(1,0,O) ]
Then  [ O Won ]

Given [ Placed(0,0,X),Placed(1,1,X), ]
When  [ Place(2,2,X) ]
Then  [ X Won ]

Given [ ]
When  [ Place(0,0,X) ]
Then  [ MovePlaced ]

Given [ Placed(0,0,X) ]
When  [ Place(0,0,O) ]
Then  [ IllegalMove ]

Given [ Placed(0,0,X) ]
When  [ Place(0,0,X) ]
Then  [ IllegalMove ]

Given [ ]
When  [ Place(0,0,O) ]
Then  [ NotYourMove ]

Given [ Placed(0,0,X) ]
When  [ Place(0,1,X) ]
Then  [ NotYourMove ]

Given [ Placed(0,0,X),Placed(0,1,X) ]
When  [ Place(0,2,X) ]
Then  [ GameWon ]

Given [ Placed(0,0,X),Placed(0,1,O),Placed(0,2,X)
        Placed(1,0,O),Placed(1,1,X),Placed(1,2,O)
        Placed(2,0,O),Placed(2,1,X)]
When  [ Place(2,2,O) ]
Then  [ GameDraw ]

Given [ ]
When  []
Then  []

Given [ ]
When  []
Then  []

Given [ ]
When  []
Then  []
