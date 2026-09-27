-- Constraints (Kısıtlayıcılar / Bütünlük kuralları) 
-- Veri tabanına hatalı veya tutarsız veri girilmesini engellemek,
-- veri bütünlüğünü (Data Integrity) sağlamak amacıyla tablolara uygulanan kurallardır.

-- 1. Adım: İlişkili üst tabloyu oluşturalım (Foreign Key için gerekli) 
create table departmanlar(
  departman_id number primary key,
  departman_adi varchar2(50) not null);

-- Üst tabloya örnek bir kayıt ekleyelim
insert into departmanlar(departman_id, departman_adi) values(10, 'Yazılım');

-- 2. Adım: Tüm kısıtlayıcıları içeren personel tablosunu oluşturalım
create table personel(
  -- Primary key: Kaydın benzersiz kimliğidir, NULL olamaz ve tekrar edemez
  personel_id number primary key,
  -- NOT NULL: Bu sütunun boş bırakılmasını kesinlikle engeller.
  ad_soyad varchar2(50) not null,
  -- UNIQUE: Aynı verinin ikinci kez girilmesini engeller.
  -- (Örneğin herkesin e-postası farklı olmalı).
  email varchar2(100) unique,
  -- CHECK: Verilen mantıksal şartı sağlamayan veriyi reddeder
  -- (Örneğin maaş sıfır veya negatif olamaz).
  maas number check (maas > 0),
  -- FOREIGN KEY: Başka bir tablodaki(departmanlar) geçerli bir kayda referans verir. 
  departman_id number, 
  constraint fk_departman foreign key (departman_id) references departmanlar(departman_id)
  );

-- 3. Adım: Başarılı veri girişi (Tüm kurallara uygun)
insert into personel (personel_id, ad_soyad, email, maas, departman_id)
values(1, 'Mahmut Turkmen', 'mahmut@gmail.com', 50000, 10);

-- 4. Adım: Kısıtlayıcıları test etme (Hata veren senaryolar)
-- Hata 1 (primary key ihlali): Aynı id(1) ile ikinci kez kayıt eklenemez (ORA-00001)
-- insert into personel(personel_id, ad_soyad, email, maas, departman_id)
-- values(1, 'Ali Veli', 'ali@gmail.com', 40000, 10);

-- Hata 2 (not null ihlali): Ad soyad boş bırakılamaz (ORA-01400)
-- insert into personel(personel_id, ad_soyad, email, maas, departman_id)
-- values(2, null, 'ali@gmail.com', 40000, 10);

-- Hata 3 (unique ihlali): Aynı e-posta adresi tekrar kullanılamaz (ORA-00001)
-- insert into personel(personel_id, ad_soyad, email, maas, departman_id)
-- values(3, 'Ayse Yilmaz, 'mahmut@gmail.com',45000, 10);

-- Hata 4 (check ihlali): Maaş sıfır veya daha düşük olamaz
-- insert into personel(personel_id, ad_soyad, email, maas, departman_id) 
-- values (4, 'Mehmet Demir', 'mehmet@gmail.com', -500, 10);

-- Hata 5 (foreign key ihlali): Departmanlar tablosunda 99 ID'li departman olmadığı için kayıt eklenemez (ORA-02291)
-- insert into personeller(personel_id, ad_soyad, email, maas, departman_id) 
-- values(5, 'Zeynep Kaya', 'zeynep@email.com', 48000, 99);









