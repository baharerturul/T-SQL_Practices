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
SET @TEXT=CONCAT(@TITLE, ' adl� filmin ','b�t�esi ',CONVERT(VARCHAR,@BUDGET),' �eklindedir.',CHAR(13),
'Filmin sayfa bilgisi:  ',@HOMEPAGE,' �eklindedir.',CHAR(13),
'Orjinal dili ise ',' ', @ORIGINAL_LANGUAGE, ' �eklindedir.',CHAR(13), 
'Orjinal ad� ise , ',@ORIGINAL_TITLE,' �ekindedir.',CHAR(13),
'Filmin i�eri�i, ',CONVERT(NVARCHAR(1000),@OVERVIEW), ' �eklindedir.',CHAR(13),
'Film ', CONVERT(NVARCHAR(100),@RELEASE_DATE),' tarihinde vizyona giri� yapm��t�r.',CHAR(13) ,
'Filmin toplam uzunlu�u ise ',CONVERT(VARCHAR(100),@RUNTIME),' dakikad�r.', CHAR(13),
'Filmin seyircilerden ald��� ortalama puan ise, ',CONVERT(VARCHAR(100),@VOTE_AVERAGE),' �eklindedir.',CHAR(13),
'Son olarak filmin slogan� ', @TAGLINE, ' �eklindedir.')
--SET @TEXT=@TITLE+ ' adl� filmin '+'b�t�esi '+CONVERT(VARCHAR,@BUDGET)+' �eklindedir. Filmin sayfa bilgisi:  '+@HOMEPAGE+' Orjinal dili ise '+@ORIGINAL_LANGUAGE+ ' �eklindedir. Orjinal ad� ise, '+@ORIGINAL_TITLE+' �ekindedir. Filmin i�eri�i, '+CONVERT(NVARCHAR(1000),@OVERVIEW)+ ' �eklindedir. Film '+ CONVERT(NVARCHAR(100),@RELEASE_DATE)+' tarihinde vizyona giri� yapm��t�r. Filmin toplam uzunlu�u ise '+CONVERT(VARCHAR(100),@RUNTIME)+' dakikad�r. Filmin seyircilerden ald��� ortalama puan ise, '+CONVERT(VARCHAR(100),@VOTE_AVERAGE)+' �eklindedir. Son olarak filmin slogan�: '+ @TAGLINE
SELECT @TEXT 

PRINT @TEXT
--SELECT @TEXT FROM MOVIE WHERE @FILMID_NMR=FILMID

--CHAR(13), SQL'DE ALT SATIRA GE�MEK ���N KULLANILAN B�R KARAKTER. ALT SATIRA GE���LER, PRINT �LE MESSAGES SAYFASINDA DAHA RAHAT G�R�N�R.