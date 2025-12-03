# DBeaver-ile-PostgreSQL-Final-Odevi 
## Otel rezervasyon sistemi veri tabanı projesi
Bu proje, PostgreSQL ve PL/pgSQL kullanılarak geliştirilmiş kapsamlı bir **otel rezervasyon sistemidir**.  
Sistem otel, oda tipleri, odalar, misafirler, rezervasyonlar, hizmetler ve ödemelerle ilgili tüm operasyonları yönetir.
### DrawSQL'de database diagrams oluşturuldu
<img width="3742" height="2036" alt="drawSQL-image-export-2025-12-02" src="https://github.com/user-attachments/assets/cc567c78-3cbb-4a08-b831-21bd63a50898" />
### Projenin çalıştırılması
#### 1)DBeaver ve pgAdmin açın
#### 2)2 si arasında bağlantı oluşturun
#### 3) DBeaver'da databases üstüne basıp create new database basın orda otel_db adında database oluşturun
#### 4) otel_db üzerine gelip set as default basıp kullanılaak database olarak ayarlayın ve pgadminde de otel_db database üstüne basınki aktifleşsin
#### 5) otel_db üzerine gelip sqleditor basın ve opensqlscript basın ve Begum_Gecer_Otel_rezervasyonSistemi.sql açın eğer bu gözükmüyorsa newsql script basıp yeni bir tane açın ve içine ####"Begum_Gecer_Otel_rezervasyonSistemi.sql" bu dosyadaki tüm kodları yapıştırın 
#### 5) çalıştırın eğer çalışmaz hata alırsanız bu utf8 den dolayı kaynaklanır  bunu çözmek için bu script dosyasını vscode açın aşağıda utf8 yazacak ona basın “Reopen with Encoding” → UTF-8 seç
#### “Save with Encoding” → UTF-8 seç ardından dbeaver da değişiklikleri uygula yazısı çıkacak bas ona ve projeyi tüm kodları yeniden çalıştır bu sefer proje çalışıcak istediğin tüm sorguları  ayrı ayrı ####çalıştırabilirsin.


## ✨ Özellikler

- Otel ve oda yönetimi
- Misafir yönetimi
- Rezervasyon, check-in ve check-out
- Ödeme takibi ve durum güncellemesi
- Ek hizmetlerin rezervasyona eklenmesi
- Müsait odaları sorgulama
- Otel doluluk oranı hesaplama
- Aylık gelir ve istatistik raporları
- Trigger ve stored procedure ile otomatik veri kontrolü
