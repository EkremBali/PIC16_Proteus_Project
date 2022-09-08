# PIC16_Proteus_Project
 PIC16F877A mikroişlemcisi ile Proteus Simülasyon programı üzerinde hazırlanmış 3 farklı proje.
 
 Her bir projenin klasöründe projenin çalışır halini gösteren bir video bulunmaktadır. Öncelikle projeler PIC16'nın komut seti ile yani Assembly olarak kodlanmıştır. Proje klasörleri içerisindeki Proteus klasörlerinde proteus projeleri, Kod&HexFile klasörlerinde ise kod dosyaları ve build edilmiş hex dosyaları bulunmaktadır.ASM uzantılı dosyayı açarak kodları görebilirsiniz.Hex uzantılı dosya ise Proteus üzerinde PIC16F877A mikroişlemcisine yüklenerek simülasyonun çalışmasını sağlıyor.Elbette bu hex dosyası gerçek bir mikroişlemciye yüklenerek de çalıştırılabilir.
 
 İlk proje olan 12 bit sayıcıda 12 led ve 2 adet buton bulunmaktadır. Bu 12 led 12 biti temsil etmektedir. Butonlardan arttırma işlemi yapan butona basıldığında ledler sırası ile yanıyor ve sayı artmış oluyor, azaltma işlemi yapan buton ise tam tersini yaparak sayıyı azaltıyor. Videodan daha net anlayabilirsiniz.
 
 ![12BitSayıcı](https://github.com/EkremBali/PIC16_Proteus_Project/blob/main/images/12BitSay%C4%B1c%C4%B1%20-%20Proteus%208%20Professional%20-%20Schematic%20Capture%208.09.2022%2015_02_57.png)
 
 İkinci proje olan Display sayaç'da ise iki adet 7-segment display kullanılmıştır. Bu iki display saniyeyi temsil etmekte ve her 1 saniyede sayı 00-59 arasında artmaktadır.
 
 ![DisplaySayac](https://github.com/EkremBali/PIC16_Proteus_Project/blob/main/images/Display_Saniye_Say%C4%B1c%C4%B1.png)
 
  Son projede ise bir Dot Matrix ve 4 adet buton kullanılmıştır. Bu dot matriste 3 nokta ile bir yılan temsil edilmektedir. Bu yılan 4 buton kullanılarak 4 yönde hareket ettirilmektedir. Yılan ters yöne dönememektedir. Örneğin yukarı gidiliyorsa aşağı dönme çalışmaz.
 
 ![DotMatrisYılan](https://github.com/EkremBali/PIC16_Proteus_Project/blob/main/images/Matris%20-%20Proteus%208%20Professional%208.09.2022%2015_22_51.png)
