/* VLADIMIR PALENOV PROBLEM SET 4 */
/* SETTING UP THE DATE FORMAT */
ALTER SESSION SET NLS_DATE_FORMAT = 'MM/DD/YYYY';
/* B1 */
SELECT PAT_FNAME, PAT_LNAME
FROM PATRON
ORDER BY LOWER(PAT_LNAME), LOWER(PAT_FNAME);

/* B2 */
SELECT CHECK_NUM, CHECK_OUT_DATE, CHECK_DUE_DATE
FROM CHECKOUT
ORDER BY CHECK_NUM;

/* B3 */
SELECT BOOK_NUM, BOOK_TITLE AS "TITLE", BOOK_SUBJECT AS "Subject of Book"
FROM BOOK
ORDER BY BOOK_NUM;

/* B4 */
SELECT BOOK_NUM, BOOK_TITLE, BOOK_COST AS "Replacement Cost"
FROM BOOK
ORDER BY BOOK_NUM;

/* B5 */
SELECT CHECKOUT.CHECK_NUM, BOOK.BOOK_NUM, CHECKOUT.PAT_ID, CHECKOUT.CHECK_OUT_DATE, CHECKOUT.CHECK_DUE_DATE
FROM BOOK, CHECKOUT
WHERE CHECKOUT.BOOK_NUM = BOOK.BOOK_NUM
ORDER BY CHECKOUT.CHECK_OUT_DATE DESC, CHECKOUT.CHECK_NUM ASC;

/* B6 */
SELECT BOOK_NUM, BOOK_TITLE, BOOK_COST
FROM BOOK
WHERE BOOK_SUBJECT = 'Database'
ORDER BY BOOK_NUM;

/* B7 */
SELECT CHECKOUT.CHECK_NUM, BOOK.BOOK_NUM, CHECKOUT.CHECK_OUT_DATE
FROM BOOK, CHECKOUT
WHERE CHECKOUT.BOOK_NUM = BOOK.BOOK_NUM AND CHECKOUT.CHECK_OUT_DATE < '4/05/2017'
ORDER BY CHECKOUT.CHECK_NUM;

/* B8 */
SELECT CHECKOUT.CHECK_NUM, BOOK.BOOK_NUM, CHECKOUT.PAT_ID, CHECKOUT.CHECK_OUT_DATE, CHECKOUT.CHECK_DUE_DATE
FROM BOOK, CHECKOUT
WHERE CHECKOUT.BOOK_NUM = BOOK.BOOK_NUM AND CHECKOUT.CHECK_IN_DATE IS NULL
ORDER BY BOOK.BOOK_NUM;

/* B9 */
SELECT AU_ID, AU_FNAME, AU_LNAME, AU_BIRTHYEAR
FROM AUTHOR
ORDER BY AU_BIRTHYEAR DESC NULLS LAST, AU_LNAME ASC;

/* B10 */
SELECT BOOK_SUBJECT, COUNT(*) AS "Books In Subject"
FROM BOOK
GROUP BY BOOK_SUBJECT
ORDER BY COUNT(*) DESC, BOOK_SUBJECT ASC;

/* B11 */
SELECT WRITES.AU_ID, count(*) AS "Books Written"
FROM WRITES
GROUP BY WRITES.AU_ID
ORDER BY count(*) DESC, WRITES.AU_ID ASC;

/* B12 */
SELECT CHECKOUT.PAT_ID AS "PATRON", CHECKOUT.BOOK_NUM AS "BOOK", (CHECKOUT.CHECK_IN_DATE - CHECKOUT.CHECK_OUT_DATE) AS "Days Kept"
FROM CHECKOUT
ORDER BY "Days Kept" DESC NULLS LAST, CHECKOUT.PAT_ID, CHECKOUT.BOOK_NUM;

/* B13 */
SELECT BOOK.BOOK_NUM, CONCAT(CONCAT(CONCAT(BOOK.BOOK_TITLE, ' ('), BOOK.BOOK_YEAR), ')') AS "BOOK", BOOK.BOOK_SUBJECT
FROM BOOK
ORDER BY BOOK.BOOK_NUM;

/* B14 */
SELECT A.AU_LNAME, A.AU_FNAME, C.BOOK_TITLE, C.BOOK_COST
FROM AUTHOR A, WRITES B, BOOK C
WHERE A.AU_ID = B.AU_ID
AND B.BOOK_NUM = C.BOOK_NUM
ORDER BY C.BOOK_NUM, A.AU_ID;

/* B15 */
SELECT B.BOOK_NUM, COUNT(C.BOOK_NUM) AS "Times Checked Out"
FROM BOOK B, CHECKOUT C
WHERE B.BOOK_NUM = C.BOOK_NUM
GROUP BY B.BOOK_NUM
HAVING COUNT(C.BOOK_NUM) > 0
ORDER BY COUNT(C.BOOK_NUM) DESC, B.BOOK_NUM DESC;



 