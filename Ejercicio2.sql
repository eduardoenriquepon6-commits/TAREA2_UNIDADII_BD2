/* Crear una función que retorne los datos de todos los animales que se tienen
almacenados en la base de datos */

CREATE OR REPLACE FUNCTION fn_datos_animales
RETURN sys_refcursor
IS

    c_datos_animales sys_refcursor;

BEGIN

    OPEN c_datos_animales FOR
    SELECT  animalid,
            especie,
            nombre,
            peso,
            fechanacimiento,
            lugarcodigo
    FROM animales;

    RETURN c_datos_animales;

END;

--BLOQUE ANONIMO DE PRUEBA
DECLARE 

    v_datos_animales sys_refcursor;
    registro animales%rowtype;

BEGIN

    v_datos_animales:= FN_DATOS_ANIMALES;

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

SET SERVEROUTPUT ON;

SELECT *
FROM ANIMALES;
