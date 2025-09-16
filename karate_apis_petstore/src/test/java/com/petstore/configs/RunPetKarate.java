package com.petstore.configs;


import com.intuit.karate.junit5.Karate;

public final class RunPetKarate {
    @Karate.Test
    Karate testPets ()
    {
        return Karate.run("classpath:features/datos_mascota.feature").relativeTo(getClass());
    }




}