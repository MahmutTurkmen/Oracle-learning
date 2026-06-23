--DDL (Data Definition Language - Veri Tanımlama Dili), verilerin kendisiyle değil, verilerin tutulduğu yapı ile ilgilenen SQL komutlarıdır. 
-- Tablo oluşturma(create), değiştirme(alter), silme(drop) veya tablonun içeriğini sıfırlama(truncate) işlemleri için kullanılır. 

-- 1. Adım: Personel tablosunu oluşturalım.

create table personel (
  id number primary key,
  isim varchar2(50),
  maas number
);

-- 2. Adım: DML ile veri manipülasyonu

-- Personel tablosuna veri ekleme
insert into personel(id, isim, maas) values(1, 'Mahmut Turkmen', 50000);
-- Yapılan değişiklikleri görmek için tabloyu sorgulayabiliriz:
SELECT * FROM personel;
-- Veriyi güncelleme
update personel set maas = 55000 where id= 1; 
SELECT * FROM personel;
-- Veriyi silme
delete from personel where id= 1;
SELECT * FROM personel;

-- 3. Adım: Diğer DDL komutları (Yapısal işlemler)

-- Tabloyu güncelleyerek yeni bir sütun ekleme
alter table personel add departman varchar2(30);
-- Tablonun içini tamamen sıfırlama 
truncate table personel;
-- Tabloyu veri tabanından tamamen silme
drop table personel; 
