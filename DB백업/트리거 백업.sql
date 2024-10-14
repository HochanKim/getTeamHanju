--------------------------------------------------------
--  파일이 생성됨 - 월요일-10월-14-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Trigger PIKUP_COUNT_TR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."PIKUP_COUNT_TR" 
AFTER INSERT OR UPDATE ON "HANJU_PICKUP_STOCK"
FOR EACH ROW
DECLARE
    DIFF_COUNT NUMBER;
BEGIN
    IF INSERTING THEN
        DIFF_COUNT := :NEW.STOCK;
    ELSIF UPDATING THEN
        DIFF_COUNT := :NEW.STOCK - :OLD.STOCK;
    END IF;

    UPDATE HANJU_PRODUCT H
    SET H.STOCK = H.STOCK + DIFF_COUNT
    WHERE H.PRODUCT_ID = :NEW.PRODUCT_ID;
END;
/
ALTER TRIGGER "SYSTEM"."PIKUP_COUNT_TR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger TEST_COUNT_TR
--------------------------------------------------------

  CREATE OR REPLACE NONEDITIONABLE TRIGGER "SYSTEM"."TEST_COUNT_TR" 
AFTER INSERT OR UPDATE ON "HANJU_PICKUP_STOCK"
FOR EACH ROW
DECLARE
    DIFF_COUNT NUMBER;
BEGIN
    IF INSERTING THEN
        DIFF_COUNT := :NEW.STOCK;
    ELSIF UPDATING THEN
        DIFF_COUNT := :NEW.STOCK - :OLD.STOCK;
    END IF;

    UPDATE HANJU_PRODUCT H
    SET H.STOCK = H.STOCK + DIFF_COUNT
    WHERE H.PRODUCT_ID = :NEW.PRODUCT_ID;
END;
/
ALTER TRIGGER "SYSTEM"."TEST_COUNT_TR" ENABLE;
