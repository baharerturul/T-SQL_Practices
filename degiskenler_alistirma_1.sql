/* Sinema filmleri database mevcuttur. 
Bu listede sorguya FILMID degeri gondererek gelen degerlerden anlamli bir text sonucu cikariniz. 
Filmin adi, filmin konusu, vizyona giris tarihi gibi verileri anlamli bir sekilde yazdiriniz. Lab30.bak */ 

--SELECT*FROM MOVIE
--SELECT ID, FILMID FROM MOVIE ORDER BY FILMID ASC

--SELECT TITLE,BUDGET,HOMEPAGE,ORIGINAL_LANGUAGE,ORIGINAL_TITLE,OVERVIEW,RELEASE_DATE,RUNTIME,VOTE_AVERAGE,TAGLINE FROM MOVIE

DECLARE @FILMID_NMR AS INT
SET @FILMID_NMR=11
--SELECT * FROM MOVIE WHERE @FILMID_NMR=FILMID
DECLARE @TITLE AS NVARCHAR(1000)
DECLARE @BUDGET AS FLOAT
DECLARE @HOMEPAGE AS NVARCHAR(1000)
DECLARE @ORIGINAL_LANGUAGE AS NVARCHAR(1000)
DECLARE @ORIGINAL_TITLE AS NVARCHAR(1000)
DECLARE @OVERVIEW AS NVARCHAR(MAX)
DECLARE @RELEASE_DATE AS DATE
DECLARE @RUNTIME AS INT
DECLARE @VOTE_AVERAGE AS FLOAT
DECLARE @TAGLINE AS NVARCHAR(1000)



SELECT @TITLE=TITLE,@BUDGET=BUDGET,@HOMEPAGE=HOMEPAGE,@ORIGINAL_LANGUAGE=ORIGINAL_LANGUAGE,@ORIGINAL_TITLE=ORIGINAL_TITLE,@OVERVIEW=OVERVIEW,@RELEASE_DATE=RELEASE_DATE,
@RUNTIME=RUNTIME,@VOTE_AVERAGE=VOTE_AVERAGE,@TAGLINE=TAGLINE FROM MOVIE WHERE FILMID=@FILMID_NMR

DECLARE @TEXT AS NVARCHAR(MAX)
SET @TEXT=CONCAT(@TITLE, ' adlý filmin ','bütçesi ',CONVERT(VARCHAR,@BUDGET),' þeklindedir.',CHAR(13),
'Filmin sayfa bilgisi:  ',@HOMEPAGE,' þeklindedir.',CHAR(13),
'Orjinal dili ise ',' ', @ORIGINAL_LANGUAGE, ' þeklindedir.',CHAR(13), 
'Orjinal adý ise , ',@ORIGINAL_TITLE,' þekindedir.',CHAR(13),
'Filmin içeriði, ',CONVERT(NVARCHAR(1000),@OVERVIEW), ' þeklindedir.',CHAR(13),
'Film ', CONVERT(NVARCHAR(100),@RELEASE_DATE),' tarihinde vizyona giriþ yapmýþtýr.',CHAR(13) ,
'Filmin toplam uzunluðu ise ',CONVERT(VARCHAR(100),@RUNTIME),' dakikadýr.', CHAR(13),
'Filmin seyircilerden aldýðý ortalama puan ise, ',CONVERT(VARCHAR(100),@VOTE_AVERAGE),' þeklindedir.',CHAR(13),
'Son olarak filmin sloganý ', @TAGLINE, ' þeklindedir.')
--SET @TEXT=@TITLE+ ' adlý filmin '+'bütçesi '+CONVERT(VARCHAR,@BUDGET)+' þeklindedir. Filmin sayfa bilgisi:  '+@HOMEPAGE+' Orjinal dili ise '+@ORIGINAL_LANGUAGE+ ' þeklindedir. Orjinal adý ise, '+@ORIGINAL_TITLE+' þekindedir. Filmin içeriði, '+CONVERT(NVARCHAR(1000),@OVERVIEW)+ ' þeklindedir. Film '+ CONVERT(NVARCHAR(100),@RELEASE_DATE)+' tarihinde vizyona giriþ yapmýþtýr. Filmin toplam uzunluðu ise '+CONVERT(VARCHAR(100),@RUNTIME)+' dakikadýr. Filmin seyircilerden aldýðý ortalama puan ise, '+CONVERT(VARCHAR(100),@VOTE_AVERAGE)+' þeklindedir. Son olarak filmin sloganý: '+ @TAGLINE
SELECT @TEXT 

PRINT @TEXT
--SELECT @TEXT FROM MOVIE WHERE @FILMID_NMR=FILMID

--CHAR(13), SQL'DE ALT SATIRA GEÇMEK ÝÇÝN KULLANILAN BÝR KARAKTER. ALT SATIRA GEÇÝÞLER, PRINT ÝLE MESSAGES SAYFASINDA DAHA RAHAT GÖRÜNÜR.