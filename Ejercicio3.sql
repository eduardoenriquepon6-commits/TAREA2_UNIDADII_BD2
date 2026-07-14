/* Crear un procedimiento almacenado que llame a la función del inciso 2 y que 
se encargue de imprimir toda la información que retorna la función */

SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE SP_DATOS_ANIMALES
IS 

    v_datos_animales sys_refcursor;
    registro animales%rowtype;

BEGIN 

    v_datos_animales:= fn_datos_animales;

    LOOP 

        FETCH v_datos_animales
        INTO registro;

        EXIT WHEN v_datos_animales%NOTFOUND;

            DBMS_OUTPUT.PUT_LINE('CODIGO DEL ANIMAL: ' || registro.animalid);
            DBMS_OUTPUT.PUT_LINE('ESPECIE DEL ANIMAL: ' || registro.especie);
            DBMS_OUTPUT.PUT_LINE('NOMBRE DEL ANIMAL: ' || registro.nombre);
            DBMS_OUTPUT.PUT_LINE('PESO DEL ANIMAL: ' || registro.peso);
            DBMS_OUTPUT.PUT_LINE('FECHA DE NACIMIENTO DEL ANIMAL: ' || registro.fechanacimiento);
            DBMS_OUTPUT.PUT_LINE('CODIGO DE LUGAR DEL ANIMAL: ' || registro.lugarcodigo);
            DBMS_OUTPUT.PUT_LINE(CHR(13));

    END LOOP;

    CLOSE v_datos_animales;

END;

EXEC SP_DATOS_ANIMALES;