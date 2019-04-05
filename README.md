# demo-ios

# demo-server

Documentation:

API
- GET("/hello"): HTML response with "Hello world!"
- POST("/reset"): Resets all data on server
- POST("/close"): Close the server

PERSONS
- GET("/persons"): Returns a 'persons' object with an array of 'person'
- GET("/persons/[id]"): Return the 'person' object for the given id
- PATCH("/persons/[id]"): Update the person with the given id
    - Optional query params: firstName, lastName, age, animals
- DELETE("/persons/[id]"): Removes the person with the given id
- POST("/persons"): Adds a person
    - Query params: id, firstName, lastName, age
    - Optional query params: animals

ANIMALS
- GET("/animals"): Returns a 'animals' object with an array of 'animal'
- GET("/animals/[id]"): Return the 'animal' object for the given id
- PATCH("/animals/[id]"): Update the animal with the given id
    - Optional query params: name
- DELETE("/animals/[id]"): Removes the animal with the given id
- POST("/animals"): Adds a person
    - Query params: id, name
