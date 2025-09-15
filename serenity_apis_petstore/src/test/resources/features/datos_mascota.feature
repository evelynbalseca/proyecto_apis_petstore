

  Feature: Datos mascotas en pagina petstore.swagger - Evelyn Balseca

    Background:
      * url 'https://petstore.swagger.io/v2'
      * header Content-Type = 'application/json'


    Scenario: Añadir una mascota a la tienda
      Given path 'pet'
      And request
      """
      {
        "id": 12345,
         "category": {
            "id": 111,
            "name": "Perro"
          },
          "name": "doggie",
          "photoUrls": ["F:\EvelynDocumentos"],
          "tags": [
           {
            "id": 22,
            "name": "Mascota"
            }
          ],
          "status": "available"
      }
      """

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
      Given path 'pet'
      And request

       """
      {
        "id": 12345,
         "name": "tarzan",
         "status": "sold"
      }
      """
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







