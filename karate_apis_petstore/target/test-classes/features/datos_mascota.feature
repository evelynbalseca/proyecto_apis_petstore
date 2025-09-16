

  Feature: Datos mascotas en pagina petstore.swagger - Evelyn Balseca

    Background:
      * url 'https://petstore.swagger.io/v2'
      * header Content-Type = 'application/json'


    Scenario: Añadir una mascota a la tienda
      * def newPet = read('classpath:data/newPet.json')
      Given path 'pet'
      And request newPet
      When method post
      Then status 200
      And match response.id == 12345
      And match response.category == { id: 111, name: "Perro" }
      And match response.name == "doggie"
      And match response.status == "available"
      * print "Mascota creada:", response


    Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
      Given path 'pet', 12345
      When method get
      Then status 200
      And match response.id == 12345
      * print "Mascota consultada:", response

    Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
      * def actualizarDatos = read('classpath:data/newDataActualizar.json')

      Given path 'pet'
      And request actualizarDatos
      When method put
      Then status 200
      And match response.name == "tarzan"
      And match response.status == "sold"
      * print "Mascota actualizada:", response

    Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
      Given path 'pet', 'findByStatus'
      And param status = "sold"
      When method get
      Then status 200
      And match response[*].status contains 'sold'
      * print "Mascota consultada por status:", response







